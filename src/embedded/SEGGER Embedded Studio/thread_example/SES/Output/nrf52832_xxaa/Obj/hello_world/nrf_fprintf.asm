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
	.file	"nrf_fprintf.c"
	.text
.Ltext0:
	.section	.text.nrf_fprintf_buffer_flush,"ax",%progbits
	.align	1
	.global	nrf_fprintf_buffer_flush
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_fprintf_buffer_flush, %function
nrf_fprintf_buffer_flush:
.LFB163:
	.file 1 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/external/fprintf/nrf_fprintf.c"
	.loc 1 48 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI0:
	sub	sp, sp, #12
.LCFI1:
	str	r0, [sp, #4]
	.loc 1 51 14
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #8]
	.loc 1 51 8
	cmp	r3, #0
	beq	.L4
	.loc 1 56 10
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #20]
	.loc 1 56 24
	ldr	r2, [sp, #4]
	ldr	r0, [r2, #16]
	.loc 1 57 24
	ldr	r2, [sp, #4]
	ldr	r1, [r2]
	.loc 1 56 5
	ldr	r2, [sp, #4]
	ldr	r2, [r2, #8]
	blx	r3
.LVL0:
	.loc 1 59 26
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	b	.L1
.L4:
	.loc 1 53 9
	nop
.L1:
	.loc 1 60 1
	add	sp, sp, #12
.LCFI2:
	@ sp needed
	ldr	pc, [sp], #4
.LFE163:
	.size	nrf_fprintf_buffer_flush, .-nrf_fprintf_buffer_flush
	.section	.text.nrf_fprintf,"ax",%progbits
	.align	1
	.global	nrf_fprintf
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_fprintf, %function
nrf_fprintf:
.LFB164:
	.loc 1 65 1
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
.LCFI3:
	push	{lr}
.LCFI4:
	sub	sp, sp, #16
.LCFI5:
	str	r0, [sp, #4]
	.loc 1 71 8
	ldr	r3, [sp, #20]
	cmp	r3, #0
	beq	.L8
	.loc 1 76 13
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 77 5
	add	r3, sp, #24
	str	r3, [sp, #12]
	.loc 1 79 5
	add	r3, sp, #12
	mov	r2, r3
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #4]
	bl	nrf_fprintf_fmt
	b	.L5
.L8:
	.loc 1 73 9
	nop
.L5:
	.loc 1 82 1
	add	sp, sp, #16
.LCFI6:
	@ sp needed
	ldr	lr, [sp], #4
.LCFI7:
	add	sp, sp, #12
.LCFI8:
	bx	lr
.LFE164:
	.size	nrf_fprintf, .-nrf_fprintf
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
	.uleb128 0x10
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
	.uleb128 0xc
	.byte	0x81
	.uleb128 0x3
	.byte	0x82
	.uleb128 0x2
	.byte	0x83
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xce
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xc3
	.byte	0xc2
	.byte	0xc1
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
	.text
.Letext0:
	.file 2 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/stdint.h"
	.file 3 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/string.h"
	.file 4 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/stdarg.h"
	.file 5 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/external/fprintf/nrf_fprintf.h"
	.file 6 "<built-in>"
	.file 7 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/external/fprintf/nrf_fprintf_format.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x202
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0xc
	.4byte	.LASF25
	.4byte	.LASF26
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
	.uleb128 0x3
	.byte	0x4
	.4byte	0x32
	.uleb128 0x5
	.4byte	0x45
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x2
	.byte	0xe0
	.byte	0x1c
	.4byte	0x63
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x6
	.4byte	.LASF6
	.byte	0x2
	.byte	0xe3
	.byte	0x1c
	.4byte	0x7d
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x3
	.byte	0x2e
	.byte	0x1d
	.4byte	0x3e
	.uleb128 0x5
	.4byte	0x92
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x4
	.byte	0x1d
	.byte	0x1e
	.4byte	0xaf
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x4
	.byte	0x6
	.byte	0
	.4byte	0xc6
	.uleb128 0x8
	.4byte	.LASF28
	.4byte	0xc6
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x5
	.byte	0x32
	.byte	0x11
	.4byte	0xdb
	.uleb128 0x3
	.byte	0x4
	.4byte	0xe1
	.uleb128 0xa
	.4byte	0xf6
	.uleb128 0xb
	.4byte	0xf6
	.uleb128 0xb
	.4byte	0x2c
	.uleb128 0xb
	.4byte	0x92
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.4byte	0x101
	.uleb128 0x5
	.4byte	0xf6
	.uleb128 0xc
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x18
	.byte	0x5
	.byte	0x37
	.byte	0x10
	.4byte	0x15e
	.uleb128 0xe
	.4byte	.LASF14
	.byte	0x5
	.byte	0x39
	.byte	0x12
	.4byte	0x4b
	.byte	0
	.uleb128 0xe
	.4byte	.LASF15
	.byte	0x5
	.byte	0x3a
	.byte	0x12
	.4byte	0x9e
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF16
	.byte	0x5
	.byte	0x3b
	.byte	0xc
	.4byte	0x92
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF17
	.byte	0x5
	.byte	0x3c
	.byte	0xa
	.4byte	0x15e
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x5
	.byte	0x3e
	.byte	0x18
	.4byte	0xfc
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x5
	.byte	0x40
	.byte	0x18
	.4byte	0xcf
	.byte	0x14
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x2
	.4byte	.LASF20
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x5
	.byte	0x41
	.byte	0x3
	.4byte	0x102
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x7
	.byte	0x4c
	.byte	0x6
	.4byte	0x18d
	.uleb128 0xb
	.4byte	0x193
	.uleb128 0xb
	.4byte	0x2c
	.uleb128 0xb
	.4byte	0x198
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.4byte	0x165
	.uleb128 0x5
	.4byte	0x18d
	.uleb128 0x3
	.byte	0x4
	.4byte	0xa3
	.uleb128 0x10
	.4byte	.LASF31
	.byte	0x1
	.byte	0x3e
	.byte	0x6
	.4byte	.LFB164
	.4byte	.LFE164-.LFB164
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e3
	.uleb128 0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x3e
	.byte	0x2c
	.4byte	0x193
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF23
	.byte	0x1
	.byte	0x3f
	.byte	0x2c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.uleb128 0x13
	.4byte	.LASF32
	.byte	0x1
	.byte	0x4c
	.byte	0xd
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x1
	.byte	0x2f
	.byte	0x6
	.4byte	.LFB163
	.4byte	.LFE163-.LFB163
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x2f
	.byte	0x39
	.4byte	0x193
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
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xe
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.4byte	0x4f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x206
	.4byte	0x171
	.ascii	"nrf_fprintf_fmt\000"
	.4byte	0x19e
	.ascii	"nrf_fprintf\000"
	.4byte	0x1e3
	.ascii	"nrf_fprintf_buffer_flush\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x13a
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x206
	.4byte	0x25
	.ascii	"int\000"
	.4byte	0x32
	.ascii	"char\000"
	.4byte	0x3e
	.ascii	"unsigned int\000"
	.4byte	0x50
	.ascii	"signed char\000"
	.4byte	0x63
	.ascii	"unsigned char\000"
	.4byte	0x57
	.ascii	"uint8_t\000"
	.4byte	0x6a
	.ascii	"short int\000"
	.4byte	0x7d
	.ascii	"short unsigned int\000"
	.4byte	0x71
	.ascii	"uint16_t\000"
	.4byte	0x84
	.ascii	"long long int\000"
	.4byte	0x8b
	.ascii	"long long unsigned int\000"
	.4byte	0x92
	.ascii	"size_t\000"
	.4byte	0xaf
	.ascii	"__va_list\000"
	.4byte	0xa3
	.ascii	"va_list\000"
	.4byte	0xc8
	.ascii	"long int\000"
	.4byte	0xcf
	.ascii	"nrf_fprintf_fwrite\000"
	.4byte	0x15e
	.ascii	"_Bool\000"
	.4byte	0x102
	.ascii	"nrf_fprintf_ctx\000"
	.4byte	0x165
	.ascii	"nrf_fprintf_ctx_t\000"
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
.LASF19:
	.ascii	"fwrite\000"
.LASF10:
	.ascii	"size_t\000"
.LASF15:
	.ascii	"io_buffer_size\000"
.LASF17:
	.ascii	"auto_flush\000"
.LASF18:
	.ascii	"p_user_ctx\000"
.LASF16:
	.ascii	"io_buffer_cnt\000"
.LASF11:
	.ascii	"va_list\000"
.LASF13:
	.ascii	"nrf_fprintf_fwrite\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF14:
	.ascii	"p_io_buffer\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF21:
	.ascii	"nrf_fprintf_ctx_t\000"
.LASF23:
	.ascii	"p_fmt\000"
.LASF29:
	.ascii	"nrf_fprintf_ctx\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF0:
	.ascii	"char\000"
.LASF5:
	.ascii	"uint8_t\000"
.LASF28:
	.ascii	"__ap\000"
.LASF31:
	.ascii	"nrf_fprintf\000"
.LASF27:
	.ascii	"__va_list\000"
.LASF8:
	.ascii	"long long int\000"
.LASF24:
	.ascii	"GNU C99 11.3.1 20220712 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -mfp16-format="
	.ascii	"ieee -munaligned-access -gdwarf-4 -g2 -gpubnames -f"
	.ascii	"omit-frame-pointer -fno-dwarf2-cfi-asm -ffunction-s"
	.ascii	"ections -fdata-sections -fshort-enums -fno-common\000"
.LASF4:
	.ascii	"short int\000"
.LASF32:
	.ascii	"args\000"
.LASF6:
	.ascii	"uint16_t\000"
.LASF26:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"src/embedded/SEGGER Embedded Studio/thread_example/"
	.ascii	"SES\000"
.LASF22:
	.ascii	"p_ctx\000"
.LASF30:
	.ascii	"nrf_fprintf_fmt\000"
.LASF12:
	.ascii	"long int\000"
.LASF25:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"lib/nRF5_SDK_14.2.0/external/fprintf/nrf_fprintf.c\000"
.LASF2:
	.ascii	"signed char\000"
.LASF33:
	.ascii	"nrf_fprintf_buffer_flush\000"
.LASF20:
	.ascii	"_Bool\000"
.LASF9:
	.ascii	"long long unsigned int\000"
	.ident	"GCC: (based on arm-11.3.Rel1 GCC) 11.3.1 20220712"
