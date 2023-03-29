from device import DWM1001
import sys

"""
A (...25AB) : /dev/tty.usbmodem0007601000461
D (...02C9) : /dev/tty.usbmodem0007601183531
"""


if len(sys.argv) != 2:
    port = '/dev/tty.usbmodem0007601000461'
else:
    port = sys.argv[1]

device = DWM1001(port)

while True:
    output = device.get_output()
    if output != '':
        with open('led_color', 'w') as led_color:
            print(output)
            led_color.write(output)
