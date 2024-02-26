/*! ----------------------------------------------------------------------------
*  @file    ss_init_main.c
*  @brief   Single-sided two-way ranging (SS TWR) initiator example code
*
*           This is a simple code example which acts as the initiator in a SS TWR distance measurement exchange. This application sends a "poll"
*           frame (recording the TX time-stamp of the poll), after which it waits for a "response" message from the "DS TWR responder" example
*           code (companion to this application) to complete the exchange. The response message contains the remote responder's time-stamps of poll
*           RX, and response TX. With this data and the local time-stamps, (of poll TX and response RX), this example application works out a value
*           for the time-of-flight over-the-air and, thus, the estimated distance between the two devices, which it writes to the LCD.
*
*
*           Notes at the end of this file, expand on the inline comments.
* 
* @attention
*
* Copyright 2015 (c) Decawave Ltd, Dublin, Ireland.
*
* All rights reserved.
*
* @author Decawave
*/
#include <stdio.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "deca_device_api.h"
#include "deca_regs.h"
#include "port_platform.h"

#define APP_NAME "SS TWR INIT v1.3"

/* Inter-ranging delay period, in milliseconds. */
#define RNG_DELAY_MS 100

#define TWR_MSG 0x01
#define INFO_MSG 0x10

#define PAN_ID 0xA0

#define RX_ID 0
#define TX_ID 0

#define INIT_TO_RESP 0xAB
#define RESP_TO_INIT 0xBA

#define SIZE 0
#define LENGTH 0
#define FRAME_NB 0

/* Frames used in the ranging process. See NOTE 2,3 below. */
static uint8 tx_poll_msg[] = {TWR_MSG, PAN_ID, INIT_TO_RESP, FRAME_NB, TX_ID, RX_ID, LENGTH, 0, 0};
static uint8 rx_resp_msg[] = {TWR_MSG, PAN_ID, RESP_TO_INIT, FRAME_NB, TX_ID, RX_ID, LENGTH, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

static uint8 tx_info_msg[] = {INFO_MSG, PAN_ID, INIT_TO_RESP, FRAME_NB, TX_ID, RX_ID, SIZE, LENGTH, 0, 0};

/* Length of the common part of the message (up to and including the function code, see NOTE 3 below). */
#define ALL_MSG_COMMON_LEN 4 // Don't take tx id, rx id, length and later information into account
// Note : frame number is taken into account because it is used to identify the frame and ensure that we receive the response to the right one

/* Index to access some fields in the frames involved in the process. */
#define MSG_TYPE_IDX 0  // Type of message (Two-Way-Ranging, Data Communication, ...)
#define MSG_PAN_IDX 1   // PAN ID (network ID, to allow for multiple non-overlapping networks)
#define MSG_DIR_IDX 2   // Direction of message (0xE0: from init to resp, 0xE1: from resp to init)
#define MSG_FRM_IDX 3   // Frame number (to ensure that we respond to the right frame if two are sent)
#define MSG_TX_IDX 4    // Transmitter ID (the one that sent the message)
#define MSG_RX_IDX 5    // Receiver ID (the one that is supposed to receive the message)
#define MSG_LEN_IDX 6   // Length of message (length of the data)

// Data Communication Specific
#define MSG_SIZE_IDX 7  // Information on the size of one information (id + range + certainty)
#define MSG_DATA_IDX 8  // Where data starts in the message

// TWR Specific
#define RESP_MSG_POLL_RX_TS_IDX 7 // Poll Reception Timestamp
#define RESP_MSG_RESP_TX_TS_IDX 11 // Response Transmission timestamp

#define RESP_MSG_TS_LEN 4 // Length of the timestamps

// + two bytes for automatic checksum of DW1000 antenna

/* Buffer to store received response message.
* Its size is adjusted to the longest frame that this example code is supposed to handle. */
#define RX_BUF_LEN 17
static uint8 rx_buffer[RX_BUF_LEN];

/* Ranges measurements */
#define NUM_AGENTS 10

// Array of int16 being the ranges to all the robots
static uint16 ranges[NUM_AGENTS];
static uint16 ranges_noise[NUM_AGENTS];

static int8 ids[NUM_AGENTS];
static int next_id = 0;

// Array of float representing the certainty of the measurement (practically, its age)
static float ranges_certainty[NUM_AGENTS] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
// Array of int being the index of all the robots, depending on their ID
static int ids_to_index[NUM_AGENTS] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

/* Frame sequence number, incremented after each transmission. */
static uint8 frame_seq_nb = 0;

/* Hold copy of status register state here for reference so that it can be examined at a debug breakpoint. */
static uint32 status_reg = 0;

/* UWB microsecond (uus) to device time unit (dtu, around 15.65 ps) conversion factor.
* 1 uus = 512 / 499.2 s and 1 s = 499.2 * 128 dtu. */
#define UUS_TO_DWT_TIME 65536

/* Speed of light in air, in metres per second. */
#define SPEED_OF_LIGHT 299702547

/* Hold copies of computed time of flight and distance here for reference so that it can be examined at a debug breakpoint. */
static double tof;
static double distance;

/* Declaration of static functions. */
static void resp_msg_get_ts(uint8 *ts_field, uint32 *ts);


/*Transactions Counters */
static volatile int tx_count = 0; // Successful transmit counter
static volatile int rx_count = 0; // Successful receive counter

/* Decrease Certainty of Measurements */
void update_certainty() {
    for (int i = 0; i < NUM_AGENTS; ++i) {
        float certainty = ranges_certainty[i];
        if (certainty != -1) {
            ranges_certainty[i] = certainty * 0.99;
        }
    }
}

/*! ------------------------------------------------------------------------------------------------------------------
* @fn main()
*
* @brief Application entry point.
*
* @param  none
*
* @return none
*/
int ss_init_run(char *id, char *dest) {
    /* Loop forever initiating ranging exchanges. */

    /* Write frame data to DW1000 and prepare transmission. See NOTE 3 below. */
    tx_poll_msg[MSG_FRM_IDX] = frame_seq_nb % 255;
    tx_poll_msg[MSG_TX_IDX] = id[0]; // Set ourselves as sender (as source)
    tx_poll_msg[MSG_RX_IDX] = dest[0]; // Set destination chosen by user
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
    dwt_writetxdata(sizeof(tx_poll_msg), tx_poll_msg, 0); /* Zero offset in TX buffer. */
    dwt_writetxfctrl(sizeof(tx_poll_msg), 0, 1); /* Zero offset in TX buffer, ranging. */

    /* Start transmission, indicating that a response is expected so that reception is enabled automatically after the frame is sent and the delay
    * set by dwt_setrxaftertxdelay() has elapsed. */
    dwt_starttx(DWT_START_TX_IMMEDIATE | DWT_RESPONSE_EXPECTED);
    tx_count++;
    // printf("Transmission # : %d\r\n",tx_count);
    // printf("%c\r\n", tx_poll_msg[DW_ID_TS_IDX]);
    
    //printf("sent a message\r\n");

    /* We assume that the transmission is achieved correctly, poll for reception of a frame or error/timeout. See NOTE 4 below. */
    while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) &
             (SYS_STATUS_RXFCG | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR))) {};

    if (status_reg & SYS_STATUS_RXFCG) {
        uint32 frame_len;

        //printf("received something\r\n");

        /* Clear good RX frame event in the DW1000 status register. */
        dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG);

        /* A frame has been received, read it into the local buffer. */
        frame_len = dwt_read32bitreg(RX_FINFO_ID) & RX_FINFO_RXFLEN_MASK;
        //printf("lenght: %d\r\n", frame_len);

        if (frame_len <= RX_BUF_LEN) {
            dwt_readrxdata(rx_buffer, frame_len, 0);
        }

        if (
            rx_buffer[MSG_TYPE_IDX] == TWR_MSG
            && 
            rx_buffer[MSG_DIR_IDX] == RESP_TO_INIT
            &&
            rx_buffer[MSG_FRM_IDX] == frame_seq_nb % 255
            &&
            (rx_buffer[MSG_TX_IDX] == dest[0] || dest[0] == 'A') // Check that the message come from the right source
            && 
            rx_buffer[MSG_RX_IDX] == id[0] // Check that we are the destination of the message
        ) 
        {
            //printf("received a response\r\n");
            
            rx_count++;

            uint32 poll_tx_ts, resp_rx_ts, poll_rx_ts, resp_tx_ts;
            int32 rtd_init, rtd_resp;
            float clockOffsetRatio;

            /* Retrieve poll transmission and response reception timestamps. See NOTE 5 below. */
            poll_tx_ts = dwt_readtxtimestamplo32();
            resp_rx_ts = dwt_readrxtimestamplo32();

            /* Read carrier integrator value and calculate clock offset ratio. See NOTE 7 below. */
            clockOffsetRatio =
                    dwt_readcarrierintegrator() * (FREQ_OFFSET_MULTIPLIER * HERTZ_TO_PPM_MULTIPLIER_CHAN_5 / 1.0e6);

            /* Get timestamps embedded in response message. */
            resp_msg_get_ts(&rx_buffer[RESP_MSG_POLL_RX_TS_IDX], &poll_rx_ts);
            resp_msg_get_ts(&rx_buffer[RESP_MSG_RESP_TX_TS_IDX], &resp_tx_ts);

            /* Compute time of flight and distance, using clock offset ratio to correct for differing local and remote clock rates */
            rtd_init = resp_rx_ts - poll_tx_ts;
            rtd_resp = resp_tx_ts - poll_rx_ts;

            tof = ((rtd_init - rtd_resp * (1.0f - clockOffsetRatio)) / 2.0f) *
                  DWT_TIME_UNITS; // Specifying 1.0f and 2.0f are floats to clear warning
            distance = tof * SPEED_OF_LIGHT;
            printf("%c : %f\r\n", rx_buffer[MSG_TX_IDX], distance);

            // Save distance and ID (put distance in centimeters, and cast to uint16)
            if (ids_to_index[rx_buffer[MSG_TX_IDX] - 'A'] == -1) {
                printf("found new measurement\r\n");

                ids_to_index[rx_buffer[MSG_TX_IDX] - 'A'] = next_id;

                ranges[next_id] = (uint16)(distance * 100);
                ranges_noise[next_id] = (uint16)(distance * 100);

                ranges_certainty[next_id] = 1.0f;

                ids[next_id] = rx_buffer[MSG_TX_IDX];
                next_id++;
            } else {
                ranges_certainty[ids_to_index[rx_buffer[MSG_TX_IDX] - 'A']] = 1.0f;

                // Without noise mitigation (uses last measure)
                ranges[ids_to_index[rx_buffer[MSG_TX_IDX] - 'A']] = (uint16)(distance * 100);

                // With noise mitigation (averages previous value and new measurement)
                uint16 previous_range = ranges_noise[ids_to_index[rx_buffer[MSG_TX_IDX] - 'A']];
                ranges_noise[ids_to_index[rx_buffer[MSG_TX_IDX] - 'A']] = (previous_range + (uint16)(distance * 100))/2;
            }
        }
    } else {
        //printf("problem occured\r\n");

        /* Clear RX error/timeout events in the DW1000 status register. */
        dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR);

        /* Reset RX to properly reinitialise LDE operation. */
        dwt_rxreset();
    }

    /* Increment frame sequence number after transmission of the poll message (modulo 256). */
    frame_seq_nb++;

    update_certainty(); 
    deca_sleep(RNG_DELAY_MS);

    return (1);
}

int transmit_info_run(char *id) {
    /* Write frame data to DW1000 and prepare transmission. See NOTE 3 below. */
    tx_info_msg[MSG_TX_IDX] = id[0]; // Set ourselves as sender (as source)
    tx_info_msg[MSG_RX_IDX] = 'A'; // Set destination chosen by user

    // Create a buffer with the right size
    uint8 length = next_id + 1;
    int msg_size = 4; // One byte for the ID, two bytes for the distance, one byte for certainty (0-100)
    uint8 info_msg[sizeof(tx_info_msg) + length * msg_size];

    // Copy the message
    memcpy(info_msg, 0, sizeof(info_msg));
    memcpy(info_msg, tx_info_msg, sizeof(tx_info_msg));

    // Distance to itself is 0
    info_msg[MSG_DATA_IDX] = id[0];
    info_msg[MSG_DATA_IDX + 1] = 0;
    info_msg[MSG_DATA_IDX + 2] = 0;

    info_msg[MSG_DATA_IDX + 3] = 100;

    // Add ID + ranges to message
    for (int i = 1; i < length; i++) {
        uint8 id = ids[i - 1];
        uint16 range = ranges_noise[i - 1];
        float certainty = ranges_certainty[i - 1];

        info_msg[MSG_DATA_IDX + i * msg_size] = id;
        info_msg[MSG_DATA_IDX + i * msg_size + 1] = (uint8)(range >> 8);
        info_msg[MSG_DATA_IDX + i * msg_size + 2] = (uint8)(range);

        info_msg[MSG_DATA_IDX + i * msg_size + 3] = (uint8)(certainty * 100);
    }

    info_msg[MSG_SIZE_IDX] = msg_size;
    info_msg[MSG_LEN_IDX] = length;

    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
    dwt_writetxdata(sizeof(info_msg), info_msg, 0); /* Zero offset in TX buffer. */
    dwt_writetxfctrl(sizeof(info_msg), 0, 1); /* Zero offset in TX buffer, ranging. */

    /* Start transmission */
    int ret = dwt_starttx(DWT_START_TX_IMMEDIATE);
    tx_count++;

    /* If dwt_starttx() returns an error, abandon this ranging exchange and proceed to the next one. */
    if (ret == DWT_SUCCESS) {
        /* Poll DW1000 until TX frame sent event set. See NOTE 5 below. */
        while (!(dwt_read32bitreg(SYS_STATUS_ID) & SYS_STATUS_TXFRS)) {};

        /* Clear TXFRS event. */
        dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
    } else {
        /* Reset RX to properly reinitialise LDE operation. */
        dwt_rxreset();
    }

    update_certainty();
    deca_sleep(RNG_DELAY_MS);

    return (1);
}

/*! ------------------------------------------------------------------------------------------------------------------
* @fn resp_msg_get_ts()
*
* @brief Read a given timestamp value from the response message. In the timestamp fields of the response message, the
*        least significant byte is at the lower address.
*
* @param  ts_field  pointer on the first byte of the timestamp field to get
*         ts  timestamp value
*
* @return none
*/
static void resp_msg_get_ts(uint8 *ts_field, uint32 *ts) {
    int i;
    *ts = 0;
    for (i = 0; i < RESP_MSG_TS_LEN; i++) {
        *ts += ts_field[i] << (i * 8);
    }
}

/*****************************************************************************************************************************************************
* NOTES:
*
* 1. The frames used here are Decawave specific ranging frames, complying with the IEEE 802.15.4 standard data frame encoding. The frames are the
*    following:
*     - a poll message sent by the initiator to trigger the ranging exchange.
*     - a response message sent by the responder to complete the exchange and provide all information needed by the initiator to compute the
*       time-of-flight (distance) estimate.
*    The first 10 bytes of those frame are common and are composed of the following fields:
*     - byte 0/1: frame control (0x8841 to indicate a data frame using 16-bit addressing).
*     - byte 2: sequence number, incremented for each new frame.
*     - byte 3/4: PAN ID (0xDECA).
*     - byte 5/6: destination address, see NOTE 2 below.
*     - byte 7/8: source address, see NOTE 2 below.
*     - byte 9: function code (specific values to indicate which message it is in the ranging process).
*    The remaining bytes are specific to each message as follows:
*    Poll message:
*     - no more data
*    Response message:
*     - byte 10 -> 13: poll message reception timestamp.
*     - byte 14 -> 17: response message transmission timestamp.
*    All messages end with a 2-byte checksum automatically set by DW1000.
* 2. Source and destination addresses are hard coded constants in this example to keep it simple but for a real product every device should have a
*    unique ID. Here, 16-bit addressing is used to keep the messages as short as possible but, in an actual application, this should be done only
*    after an exchange of specific messages used to define those short addresses for each device participating to the ranging exchange.
* 3. dwt_writetxdata() takes the full size of the message as a parameter but only copies (size - 2) bytes as the check-sum at the end of the frame is
*    automatically appended by the DW1000. This means that our variable could be two bytes shorter without losing any data (but the sizeof would not
*    work anymore then as we would still have to indicate the full length of the frame to dwt_writetxdata()).
* 4. We use polled mode of operation here to keep the example as simple as possible but all status events can be used to generate interrupts. Please
*    refer to DW1000 User Manual for more details on "interrupts". It is also to be noted that STATUS register is 5 bytes long but, as the event we
*    use are all in the first bytes of the register, we can use the simple dwt_read32bitreg() API call to access it instead of reading the whole 5
*    bytes.
* 5. The high order byte of each 40-bit time-stamps is discarded here. This is acceptable as, on each device, those time-stamps are not separated by
*    more than 2**32 device time units (which is around 67 ms) which means that the calculation of the round-trip delays can be handled by a 32-bit
*    subtraction.
* 6. The user is referred to DecaRanging ARM application (distributed with EVK1000 product) for additional practical example of usage, and to the
*     DW1000 API Guide for more details on the DW1000 driver functions.
* 7. The use of the carrier integrator value to correct the TOF calculation, was added Feb 2017 for v1.3 of this example.  This significantly
*     improves the result of the SS-TWR where the remote responder unit's clock is a number of PPM offset from the local inmitiator unit's clock.
*     As stated in NOTE 2 a fixed offset in range will be seen unless the antenna delsy is calibratred and set correctly.
*
****************************************************************************************************************************************************/
