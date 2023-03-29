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
	.file	"nrf_balloc.c"
	.text
.Ltext0:
	.section	.text.nrf_balloc_idx2block,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_balloc_idx2block, %function
nrf_balloc_idx2block:
.LFB164:
	.file 1 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/components/libraries/balloc/nrf_balloc.c"
	.loc 1 174 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI0:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 176 30
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #12]
	.loc 1 176 51
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	.loc 1 176 73
	ldr	r1, [sp, #4]
	ldrh	r1, [r1, #16]
	.loc 1 176 65
	mul	r3, r1, r3
	.loc 1 176 48
	add	r3, r3, r2
	.loc 1 177 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI1:
	@ sp needed
	bx	lr
.LFE164:
	.size	nrf_balloc_idx2block, .-nrf_balloc_idx2block
	.section	.text.nrf_balloc_block2idx,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_balloc_block2idx, %function
nrf_balloc_block2idx:
.LFB165:
	.loc 1 187 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI2:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 189 13
	ldr	r3, [sp]
	.loc 1 189 48
	ldr	r2, [sp, #4]
	ldr	r2, [r2, #12]
	.loc 1 189 31
	subs	r3, r3, r2
	.loc 1 189 75
	ldr	r2, [sp, #4]
	ldrh	r2, [r2, #16]
	.loc 1 189 67
	udiv	r3, r3, r2
	uxtb	r3, r3
	.loc 1 190 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI3:
	@ sp needed
	bx	lr
.LFE165:
	.size	nrf_balloc_block2idx, .-nrf_balloc_block2idx
	.section	.text.nrf_balloc_init,"ax",%progbits
	.align	1
	.global	nrf_balloc_init
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_balloc_init, %function
nrf_balloc_init:
.LFB166:
	.loc 1 193 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI4:
	str	r0, [sp, #4]
	.loc 1 196 5
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L6
	.loc 1 196 5 is_stmt 0 discriminator 1
	movs	r3, #14
	b	.L7
.L6:
	.loc 1 204 29 is_stmt 1
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	.loc 1 204 53
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 204 45
	subs	r3, r2, r3
	.loc 1 204 21
	strb	r3, [sp, #15]
	.loc 1 223 11
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 223 43
	ldr	r2, [sp, #4]
	ldr	r2, [r2, #4]
	.loc 1 223 35
	str	r2, [r3]
	.loc 1 224 11
	b	.L8
.L9:
	.loc 1 226 17
	ldr	r3, [sp, #4]
	ldr	r2, [r3]
	.loc 1 226 23
	ldr	r3, [r2]
	.loc 1 226 41
	adds	r1, r3, #1
	str	r1, [r2]
	.loc 1 226 44
	ldrb	r2, [sp, #15]
	strb	r2, [r3]
.L8:
	.loc 1 224 21
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	subs	r2, r3, #1
	strb	r2, [sp, #15]
	.loc 1 224 12
	cmp	r3, #0
	bne	.L9
	.loc 1 229 11
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 229 35
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 1 231 12
	movs	r3, #0
.L7:
	.loc 1 232 1
	mov	r0, r3
	add	sp, sp, #16
.LCFI5:
	@ sp needed
	bx	lr
.LFE166:
	.size	nrf_balloc_init, .-nrf_balloc_init
	.section	.text.nrf_balloc_alloc,"ax",%progbits
	.align	1
	.global	nrf_balloc_alloc
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_balloc_alloc, %function
nrf_balloc_alloc:
.LFB167:
	.loc 1 235 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI6:
	sub	sp, sp, #20
.LCFI7:
	str	r0, [sp, #4]
	.loc 1 238 12
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 240 5
	movs	r0, #0
	bl	app_util_critical_region_enter
	.loc 1 242 15
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 242 21
	ldr	r2, [r3]
	.loc 1 242 47
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	.loc 1 242 8
	cmp	r2, r3
	bls	.L11
.LBB2:
	.loc 1 245 58
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 245 64
	ldr	r2, [r3]
	.loc 1 245 49
	subs	r2, r2, #1
	.loc 1 245 17
	str	r2, [r3]
	.loc 1 245 64
	ldr	r3, [r3]
	.loc 1 245 19
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	nrf_balloc_idx2block
	str	r0, [sp, #12]
	.loc 1 248 37
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #8]
	.loc 1 248 61
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 248 67
	ldr	r3, [r3]
	.loc 1 248 53
	subs	r3, r2, r3
	.loc 1 248 17
	strb	r3, [sp, #11]
	.loc 1 249 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 249 25
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	.loc 1 249 12
	ldrb	r2, [sp, #11]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L11
	.loc 1 251 19
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 251 43
	ldrb	r2, [sp, #11]
	strb	r2, [r3, #4]
.L11:
.LBE2:
	.loc 1 255 5
	movs	r0, #0
	bl	app_util_critical_region_exit
	.loc 1 267 12
	ldr	r3, [sp, #12]
	.loc 1 268 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI8:
	@ sp needed
	ldr	pc, [sp], #4
.LFE167:
	.size	nrf_balloc_alloc, .-nrf_balloc_alloc
	.section	.text.nrf_balloc_free,"ax",%progbits
	.align	1
	.global	nrf_balloc_free
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_balloc_free, %function
nrf_balloc_free:
.LFB168:
	.loc 1 271 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 304 12
	ldr	r3, [sp]
	str	r3, [sp, #12]
	.loc 1 307 5
	movs	r0, #0
	bl	app_util_critical_region_enter
	.loc 1 338 13
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 338 19
	ldr	r4, [r3]
	.loc 1 338 37
	adds	r2, r4, #1
	str	r2, [r3]
	.loc 1 338 42
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #4]
	bl	nrf_balloc_block2idx
	mov	r3, r0
	.loc 1 338 40
	strb	r3, [r4]
	.loc 1 340 5
	movs	r0, #0
	bl	app_util_critical_region_exit
	.loc 1 341 1
	nop
	add	sp, sp, #16
.LCFI11:
	@ sp needed
	pop	{r4, pc}
.LFE168:
	.size	nrf_balloc_free, .-nrf_balloc_free
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
	.4byte	.LFB164
	.4byte	.LFE164-.LFB164
	.byte	0x4
	.4byte	.LCFI0-.LFB164
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB165
	.4byte	.LFE165-.LFB165
	.byte	0x4
	.4byte	.LCFI2-.LFB165
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB166
	.4byte	.LFE166-.LFB166
	.byte	0x4
	.4byte	.LCFI4-.LFB166
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB167
	.4byte	.LFE167-.LFB167
	.byte	0x4
	.4byte	.LCFI6-.LFB167
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB168
	.4byte	.LFE168-.LFB168
	.byte	0x4
	.4byte	.LCFI9-.LFB168
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE8:
	.text
.Letext0:
	.file 2 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/stdint.h"
	.file 3 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/string.h"
	.file 4 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/util/sdk_errors.h"
	.file 5 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/components/libraries/balloc/nrf_balloc.h"
	.file 6 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/util/app_util_platform.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2b0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0xc
	.4byte	.LASF33
	.4byte	.LASF34
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0xe0
	.byte	0x1c
	.4byte	0x4d
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0xe3
	.byte	0x1c
	.4byte	0x67
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0xe5
	.byte	0x1c
	.4byte	0x33
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x2e
	.byte	0x1d
	.4byte	0x33
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x4
	.byte	0x9d
	.byte	0x12
	.4byte	0x6e
	.uleb128 0x5
	.byte	0x4
	.4byte	0x41
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.byte	0x5b
	.byte	0x9
	.4byte	0xd1
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x5
	.byte	0x5d
	.byte	0xf
	.4byte	0xa0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x5
	.byte	0x5e
	.byte	0xf
	.4byte	0x41
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x5
	.byte	0x5f
	.byte	0x3
	.4byte	0xad
	.uleb128 0x6
	.byte	0x14
	.byte	0x5
	.byte	0x62
	.byte	0x9
	.4byte	0x128
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x5
	.byte	0x64
	.byte	0x17
	.4byte	0x128
	.byte	0
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x5
	.byte	0x65
	.byte	0x17
	.4byte	0xa0
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x5
	.byte	0x69
	.byte	0x17
	.4byte	0xa0
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x5
	.byte	0x6a
	.byte	0x17
	.4byte	0x12e
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x5
	.byte	0x76
	.byte	0x17
	.4byte	0x5b
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0xd1
	.uleb128 0x8
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x5
	.byte	0x7b
	.byte	0x3
	.4byte	0xdd
	.uleb128 0x9
	.4byte	0x130
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x6
	.byte	0x9f
	.byte	0x6
	.4byte	0x153
	.uleb128 0xb
	.4byte	0x41
	.byte	0
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x6
	.byte	0x9e
	.byte	0x6
	.4byte	0x165
	.uleb128 0xb
	.4byte	0xa0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x10e
	.byte	0x6
	.4byte	.LFB168
	.4byte	.LFE168-.LFB168
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ad
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x10e
	.byte	0x2b
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x10e
	.byte	0x3a
	.4byte	0x12e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x130
	.byte	0xc
	.4byte	0x12e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x13c
	.uleb128 0xf
	.4byte	.LASF29
	.byte	0x1
	.byte	0xea
	.byte	0x8
	.4byte	0x12e
	.4byte	.LFB167
	.4byte	.LFE167-.LFB167
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x205
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0xea
	.byte	0x2e
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0xee
	.byte	0xc
	.4byte	0x12e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0xf8
	.byte	0x11
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF30
	.byte	0x1
	.byte	0xc0
	.byte	0xc
	.4byte	0x94
	.4byte	.LFB166
	.4byte	.LFE166-.LFB166
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23e
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0xc0
	.byte	0x31
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0xc2
	.byte	0xd
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -1
	.byte	0
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.byte	0xba
	.byte	0x10
	.4byte	0x41
	.4byte	.LFB165
	.4byte	.LFE165-.LFB165
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x277
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0xba
	.byte	0x3a
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x10
	.4byte	.LASF27
	.byte	0x1
	.byte	0xba
	.byte	0x4f
	.4byte	0x277
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x27d
	.uleb128 0x15
	.uleb128 0x16
	.4byte	.LASF37
	.byte	0x1
	.byte	0xad
	.byte	0xf
	.4byte	0x12e
	.4byte	.LFB164
	.4byte	.LFE164-.LFB164
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0xad
	.byte	0x39
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x17
	.ascii	"idx\000"
	.byte	0x1
	.byte	0xad
	.byte	0x49
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -5
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
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
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x15
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
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
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xc2
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2b4
	.4byte	0x141
	.ascii	"app_util_critical_region_exit\000"
	.4byte	0x153
	.ascii	"app_util_critical_region_enter\000"
	.4byte	0x165
	.ascii	"nrf_balloc_free\000"
	.4byte	0x1b3
	.ascii	"nrf_balloc_alloc\000"
	.4byte	0x205
	.ascii	"nrf_balloc_init\000"
	.4byte	0x23e
	.ascii	"nrf_balloc_block2idx\000"
	.4byte	0x27e
	.ascii	"nrf_balloc_idx2block\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x116
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2b4
	.4byte	0x25
	.ascii	"int\000"
	.4byte	0x2c
	.ascii	"char\000"
	.4byte	0x33
	.ascii	"unsigned int\000"
	.4byte	0x3a
	.ascii	"signed char\000"
	.4byte	0x4d
	.ascii	"unsigned char\000"
	.4byte	0x41
	.ascii	"uint8_t\000"
	.4byte	0x54
	.ascii	"short int\000"
	.4byte	0x67
	.ascii	"short unsigned int\000"
	.4byte	0x5b
	.ascii	"uint16_t\000"
	.4byte	0x6e
	.ascii	"uint32_t\000"
	.4byte	0x7a
	.ascii	"long long int\000"
	.4byte	0x81
	.ascii	"long long unsigned int\000"
	.4byte	0x88
	.ascii	"size_t\000"
	.4byte	0x94
	.ascii	"ret_code_t\000"
	.4byte	0xa6
	.ascii	"long int\000"
	.4byte	0xd1
	.ascii	"nrf_balloc_cb_t\000"
	.4byte	0x130
	.ascii	"nrf_balloc_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB164
	.4byte	.LFE164-.LFB164
	.4byte	.LFB165
	.4byte	.LFE165-.LFB165
	.4byte	.LFB166
	.4byte	.LFE166-.LFB166
	.4byte	.LFB167
	.4byte	.LFE167-.LFB167
	.4byte	.LFB168
	.4byte	.LFE168-.LFB168
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB164
	.4byte	.LFE164
	.4byte	.LFB165
	.4byte	.LFE165
	.4byte	.LFB166
	.4byte	.LFE166
	.4byte	.LFB167
	.4byte	.LFE167
	.4byte	.LFB168
	.4byte	.LFE168
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF11:
	.ascii	"size_t\000"
.LASF30:
	.ascii	"nrf_balloc_init\000"
.LASF17:
	.ascii	"p_cb\000"
.LASF19:
	.ascii	"p_stack_limit\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF31:
	.ascii	"pool_size\000"
.LASF12:
	.ascii	"ret_code_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF28:
	.ascii	"utilization\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF21:
	.ascii	"block_size\000"
.LASF16:
	.ascii	"nrf_balloc_cb_t\000"
.LASF27:
	.ascii	"p_block\000"
.LASF14:
	.ascii	"p_stack_pointer\000"
.LASF15:
	.ascii	"max_utilization\000"
.LASF4:
	.ascii	"short int\000"
.LASF25:
	.ascii	"p_pool\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF0:
	.ascii	"char\000"
.LASF5:
	.ascii	"uint8_t\000"
.LASF35:
	.ascii	"nrf_balloc_free\000"
.LASF24:
	.ascii	"app_util_critical_region_enter\000"
.LASF9:
	.ascii	"long long int\000"
.LASF32:
	.ascii	"GNU C99 11.3.1 20220712 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -mfp16-format="
	.ascii	"ieee -munaligned-access -gdwarf-4 -g2 -gpubnames -f"
	.ascii	"omit-frame-pointer -fno-dwarf2-cfi-asm -ffunction-s"
	.ascii	"ections -fdata-sections -fshort-enums -fno-common\000"
.LASF33:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"lib/nRF5_SDK_14.2.0/components/libraries/balloc/nrf"
	.ascii	"_balloc.c\000"
.LASF18:
	.ascii	"p_stack_base\000"
.LASF6:
	.ascii	"uint16_t\000"
.LASF34:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"src/embedded/SEGGER Embedded Studio/thread_example/"
	.ascii	"SES\000"
.LASF8:
	.ascii	"uint32_t\000"
.LASF13:
	.ascii	"long int\000"
.LASF37:
	.ascii	"nrf_balloc_idx2block\000"
.LASF29:
	.ascii	"nrf_balloc_alloc\000"
.LASF22:
	.ascii	"nrf_balloc_t\000"
.LASF2:
	.ascii	"signed char\000"
.LASF36:
	.ascii	"nrf_balloc_block2idx\000"
.LASF26:
	.ascii	"p_element\000"
.LASF20:
	.ascii	"p_memory_begin\000"
.LASF23:
	.ascii	"app_util_critical_region_exit\000"
	.ident	"GCC: (based on arm-11.3.Rel1 GCC) 11.3.1 20220712"
