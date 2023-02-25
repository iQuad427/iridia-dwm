	.cpu cortex-m4
	.arch armv7e-m
	.fpu fpv4-sp-d16
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 38, 1
	.eabi_attribute 18, 4
	.file	"nrf_strerror.c"
	.text
.Ltext0:
	.section	.rodata.m_unknown_str,"a"
	.align	2
	.type	m_unknown_str, %object
	.size	m_unknown_str, 19
m_unknown_str:
	.ascii	"Unknown error code\000"
	.section .rodata
	.align	2
.LC0:
	.ascii	"NRF_SUCCESS\000"
	.align	2
.LC1:
	.ascii	"NRF_ERROR_SVC_HANDLER_MISSING\000"
	.align	2
.LC2:
	.ascii	"NRF_ERROR_SOFTDEVICE_NOT_ENABLED\000"
	.align	2
.LC3:
	.ascii	"NRF_ERROR_INTERNAL\000"
	.align	2
.LC4:
	.ascii	"NRF_ERROR_NO_MEM\000"
	.align	2
.LC5:
	.ascii	"NRF_ERROR_NOT_FOUND\000"
	.align	2
.LC6:
	.ascii	"NRF_ERROR_NOT_SUPPORTED\000"
	.align	2
.LC7:
	.ascii	"NRF_ERROR_INVALID_PARAM\000"
	.align	2
.LC8:
	.ascii	"NRF_ERROR_INVALID_STATE\000"
	.align	2
.LC9:
	.ascii	"NRF_ERROR_INVALID_LENGTH\000"
	.align	2
.LC10:
	.ascii	"NRF_ERROR_INVALID_FLAGS\000"
	.align	2
.LC11:
	.ascii	"NRF_ERROR_INVALID_DATA\000"
	.align	2
.LC12:
	.ascii	"NRF_ERROR_DATA_SIZE\000"
	.align	2
.LC13:
	.ascii	"NRF_ERROR_TIMEOUT\000"
	.align	2
.LC14:
	.ascii	"NRF_ERROR_NULL\000"
	.align	2
.LC15:
	.ascii	"NRF_ERROR_FORBIDDEN\000"
	.align	2
.LC16:
	.ascii	"NRF_ERROR_INVALID_ADDR\000"
	.align	2
.LC17:
	.ascii	"NRF_ERROR_BUSY\000"
	.align	2
.LC18:
	.ascii	"NRF_ERROR_MODULE_NOT_INITIALZED\000"
	.align	2
.LC19:
	.ascii	"NRF_ERROR_MUTEX_INIT_FAILED\000"
	.align	2
.LC20:
	.ascii	"NRF_ERROR_MUTEX_LOCK_FAILED\000"
	.align	2
.LC21:
	.ascii	"NRF_ERROR_MUTEX_UNLOCK_FAILED\000"
	.align	2
.LC22:
	.ascii	"NRF_ERROR_MUTEX_COND_INIT_FAILED\000"
	.align	2
.LC23:
	.ascii	"NRF_ERROR_MODULE_ALREADY_INITIALIZED\000"
	.align	2
.LC24:
	.ascii	"NRF_ERROR_STORAGE_FULL\000"
	.align	2
.LC25:
	.ascii	"NRF_ERROR_API_NOT_IMPLEMENTED\000"
	.align	2
.LC26:
	.ascii	"NRF_ERROR_FEATURE_NOT_ENABLED\000"
	.align	2
.LC27:
	.ascii	"NRF_ERROR_DRV_TWI_ERR_OVERRUN\000"
	.align	2
.LC28:
	.ascii	"NRF_ERROR_DRV_TWI_ERR_ANACK\000"
	.align	2
.LC29:
	.ascii	"NRF_ERROR_DRV_TWI_ERR_DNACK\000"
	.section	.rodata.nrf_strerror_array,"a"
	.align	2
	.type	nrf_strerror_array, %object
	.size	nrf_strerror_array, 240
nrf_strerror_array:
	.word	0
	.word	.LC0
	.word	1
	.word	.LC1
	.word	2
	.word	.LC2
	.word	3
	.word	.LC3
	.word	4
	.word	.LC4
	.word	5
	.word	.LC5
	.word	6
	.word	.LC6
	.word	7
	.word	.LC7
	.word	8
	.word	.LC8
	.word	9
	.word	.LC9
	.word	10
	.word	.LC10
	.word	11
	.word	.LC11
	.word	12
	.word	.LC12
	.word	13
	.word	.LC13
	.word	14
	.word	.LC14
	.word	15
	.word	.LC15
	.word	16
	.word	.LC16
	.word	17
	.word	.LC17
	.word	128
	.word	.LC18
	.word	129
	.word	.LC19
	.word	130
	.word	.LC20
	.word	131
	.word	.LC21
	.word	132
	.word	.LC22
	.word	133
	.word	.LC23
	.word	134
	.word	.LC24
	.word	144
	.word	.LC25
	.word	145
	.word	.LC26
	.word	33280
	.word	.LC27
	.word	33281
	.word	.LC28
	.word	33282
	.word	.LC29
	.section	.text.nrf_strerror_get,"ax",%progbits
	.align	1
	.global	nrf_strerror_get
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_strerror_get, %function
nrf_strerror_get:
.LFB163:
	.file 1 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/components/libraries/strerror/nrf_strerror.c"
	.loc 1 116 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #20
.LCFI1:
	str	r0, [sp, #4]
	.loc 1 117 26
	ldr	r0, [sp, #4]
	bl	nrf_strerror_find
	str	r0, [sp, #12]
	.loc 1 118 44
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L2
	.loc 1 118 44 is_stmt 0 discriminator 1
	ldr	r3, [sp, #12]
	b	.L4
.L2:
	.loc 1 118 44 discriminator 2
	ldr	r3, .L5
.L4:
	.loc 1 119 1 is_stmt 1 discriminator 5
	mov	r0, r3
	add	sp, sp, #20
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.L6:
	.align	2
.L5:
	.word	m_unknown_str
.LFE163:
	.size	nrf_strerror_get, .-nrf_strerror_get
	.section	.text.nrf_strerror_find,"ax",%progbits
	.align	1
	.global	nrf_strerror_find
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_strerror_find, %function
nrf_strerror_find:
.LFB164:
	.loc 1 122 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #24
.LCFI3:
	str	r0, [sp, #4]
	.loc 1 125 13
	ldr	r3, .L13
	str	r3, [sp, #20]
	.loc 1 126 13
	ldr	r3, .L13+4
	str	r3, [sp, #16]
	.loc 1 128 11
	b	.L8
.L12:
.LBB2:
	.loc 1 130 63
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	subs	r3, r2, r3
	asrs	r3, r3, #3
	.loc 1 130 74
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	.loc 1 130 53
	lsls	r3, r3, #3
	.loc 1 130 37
	ldr	r2, [sp, #20]
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 131 20
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	str	r3, [sp, #8]
	.loc 1 132 12
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bls	.L9
	.loc 1 134 19
	ldr	r3, [sp, #12]
	str	r3, [sp, #16]
	b	.L8
.L9:
	.loc 1 136 17
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bcs	.L10
	.loc 1 138 21
	ldr	r3, [sp, #12]
	adds	r3, r3, #8
	str	r3, [sp, #20]
	b	.L8
.L10:
	.loc 1 142 25
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #4]
	b	.L11
.L8:
.LBE2:
	.loc 1 128 20
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #16]
	cmp	r2, r3
	bcc	.L12
	.loc 1 145 12
	movs	r3, #0
.L11:
	.loc 1 146 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI4:
	@ sp needed
	bx	lr
.L14:
	.align	2
.L13:
	.word	nrf_strerror_array
	.word	nrf_strerror_array+240
.LFE164:
	.size	nrf_strerror_find, .-nrf_strerror_find
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB163
	.4byte	.LFE163-.LFB163
	.byte	0x4
	.4byte	.LCFI0-.LFB163
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB164
	.4byte	.LFE164-.LFB164
	.byte	0x4
	.4byte	.LCFI3-.LFB164
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
	.text
.Letext0:
	.file 2 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/stdint.h"
	.file 3 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/util/sdk_errors.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1b2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0xc
	.4byte	.LASF21
	.4byte	.LASF22
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.4byte	0x39
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x5
	.4byte	0x32
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x2
	.byte	0xe5
	.byte	0x1c
	.4byte	0x3e
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x3
	.byte	0x9d
	.byte	0x12
	.4byte	0x61
	.uleb128 0x7
	.byte	0x8
	.byte	0x1
	.byte	0x37
	.byte	0x9
	.4byte	0xab
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x39
	.byte	0x12
	.4byte	0x7b
	.byte	0
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x3a
	.byte	0x12
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x1
	.byte	0x3b
	.byte	0x2
	.4byte	0x87
	.uleb128 0x5
	.4byte	0xab
	.uleb128 0x9
	.4byte	0x39
	.4byte	0xcc
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x12
	.byte	0
	.uleb128 0x5
	.4byte	0xbc
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x1
	.byte	0x42
	.byte	0x13
	.4byte	0xcc
	.uleb128 0x5
	.byte	0x3
	.4byte	m_unknown_str
	.uleb128 0x9
	.4byte	0xb7
	.4byte	0xf3
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1d
	.byte	0
	.uleb128 0x5
	.4byte	0xe3
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4c
	.byte	0x22
	.4byte	0xf3
	.uleb128 0x5
	.byte	0x3
	.4byte	nrf_strerror_array
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x1
	.byte	0x79
	.byte	0xe
	.4byte	0x2c
	.4byte	.LFB164
	.4byte	.LFE164-.LFB164
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17a
	.uleb128 0xd
	.4byte	.LASF10
	.byte	0x1
	.byte	0x79
	.byte	0x2b
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x7b
	.byte	0x21
	.4byte	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x1
	.byte	0x7c
	.byte	0x21
	.4byte	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xe
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0x82
	.byte	0x25
	.4byte	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0x83
	.byte	0x14
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.4byte	0xb7
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0x73
	.byte	0xe
	.4byte	0x2c
	.4byte	.LFB163
	.4byte	.LFE163-.LFB163
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF10
	.byte	0x1
	.byte	0x73
	.byte	0x2a
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x75
	.byte	0x12
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x62
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1b6
	.4byte	0xd1
	.ascii	"m_unknown_str\000"
	.4byte	0xf8
	.ascii	"nrf_strerror_array\000"
	.4byte	0x10a
	.ascii	"nrf_strerror_find\000"
	.4byte	0x180
	.ascii	"nrf_strerror_get\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xd8
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1b6
	.4byte	0x25
	.ascii	"int\000"
	.4byte	0x32
	.ascii	"char\000"
	.4byte	0x3e
	.ascii	"unsigned int\000"
	.4byte	0x45
	.ascii	"signed char\000"
	.4byte	0x4c
	.ascii	"unsigned char\000"
	.4byte	0x53
	.ascii	"short int\000"
	.4byte	0x5a
	.ascii	"short unsigned int\000"
	.4byte	0x61
	.ascii	"uint32_t\000"
	.4byte	0x6d
	.ascii	"long long int\000"
	.4byte	0x74
	.ascii	"long long unsigned int\000"
	.4byte	0x7b
	.ascii	"ret_code_t\000"
	.4byte	0xab
	.ascii	"nrf_strerror_desc_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB163
	.4byte	.LFE163-.LFB163
	.4byte	.LFB164
	.4byte	.LFE164-.LFB164
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB163
	.4byte	.LFE163
	.4byte	.LFB164
	.4byte	.LFE164
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"long long int\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF12:
	.ascii	"nrf_strerror_desc_t\000"
.LASF20:
	.ascii	"GNU C99 11.3.1 20220712 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -mfp16-format="
	.ascii	"ieee -munaligned-access -gdwarf-4 -g2 -gpubnames -f"
	.ascii	"omit-frame-pointer -fno-dwarf2-cfi-asm -ffunction-s"
	.ascii	"ections -fdata-sections -fshort-enums -fno-common\000"
.LASF14:
	.ascii	"nrf_strerror_array\000"
.LASF9:
	.ascii	"ret_code_t\000"
.LASF11:
	.ascii	"name\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF22:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"src/embedded/SEGGER Embedded Studio/thread_example/"
	.ascii	"SES\000"
.LASF16:
	.ascii	"p_end\000"
.LASF19:
	.ascii	"p_ret\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"char\000"
.LASF8:
	.ascii	"uint32_t\000"
.LASF15:
	.ascii	"p_start\000"
.LASF17:
	.ascii	"p_mid\000"
.LASF24:
	.ascii	"nrf_strerror_get\000"
.LASF13:
	.ascii	"m_unknown_str\000"
.LASF10:
	.ascii	"code\000"
.LASF2:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"nrf_strerror_find\000"
.LASF4:
	.ascii	"short int\000"
.LASF21:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"lib/nRF5_SDK_14.2.0/components/libraries/strerror/n"
	.ascii	"rf_strerror.c\000"
.LASF18:
	.ascii	"mid_c\000"
	.ident	"GCC: (based on arm-11.3.Rel1 GCC) 11.3.1 20220712"
