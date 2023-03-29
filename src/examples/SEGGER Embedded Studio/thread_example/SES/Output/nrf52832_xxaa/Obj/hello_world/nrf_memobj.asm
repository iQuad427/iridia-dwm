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
	.file	"nrf_memobj.c"
	.text
.Ltext0:
	.section	.text.nrf_atomic_u32_add,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_atomic_u32_add, %function
nrf_atomic_u32_add:
.LFB173:
	.file 1 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/atomic/nrf_atomic.h"
	.loc 1 361 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
.LCFI0:
	sub	sp, sp, #28
.LCFI1:
	str	r0, [sp, #4]
	str	r1, [sp]
.LBB2:
	.loc 1 368 5
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	.syntax unified
@ 368 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/atomic/nrf_atomic.h" 1
	1:     ldrex   r4, [r3]
add r0, r4, r2
       strex   r1, r0, [r3]
       teq     r1, #0
       bne.n     1b
@ 0 "" 2
	.thumb
	.syntax unified
	str	r4, [sp, #20]
	str	r0, [sp, #16]
	str	r1, [sp, #12]
.LBE2:
	.loc 1 371 12
	ldr	r3, [sp, #16]
	.loc 1 379 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI2:
	@ sp needed
	ldr	r4, [sp], #4
.LCFI3:
	bx	lr
.LFE173:
	.size	nrf_atomic_u32_add, .-nrf_atomic_u32_add
	.section	.text.nrf_atomic_u32_sub,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_atomic_u32_sub, %function
nrf_atomic_u32_sub:
.LFB175:
	.loc 1 419 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
.LCFI4:
	sub	sp, sp, #28
.LCFI5:
	str	r0, [sp, #4]
	str	r1, [sp]
.LBB3:
	.loc 1 426 5
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	.syntax unified
@ 426 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/atomic/nrf_atomic.h" 1
	1:     ldrex   r4, [r3]
sub r0, r4, r2
       strex   r1, r0, [r3]
       teq     r1, #0
       bne.n     1b
@ 0 "" 2
	.thumb
	.syntax unified
	str	r4, [sp, #20]
	str	r0, [sp, #16]
	str	r1, [sp, #12]
.LBE3:
	.loc 1 429 12
	ldr	r3, [sp, #16]
	.loc 1 437 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI6:
	@ sp needed
	ldr	r4, [sp], #4
.LCFI7:
	bx	lr
.LFE175:
	.size	nrf_atomic_u32_sub, .-nrf_atomic_u32_sub
	.section	.text.nrf_memobj_pool_init,"ax",%progbits
	.align	1
	.global	nrf_memobj_pool_init
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_memobj_pool_init, %function
nrf_memobj_pool_init:
.LFB180:
	.file 2 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/components/libraries/experimental_memobj/nrf_memobj.c"
	.loc 2 84 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI8:
	sub	sp, sp, #12
.LCFI9:
	str	r0, [sp, #4]
	.loc 2 85 12
	ldr	r0, [sp, #4]
	bl	nrf_balloc_init
	mov	r3, r0
	.loc 2 86 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI10:
	@ sp needed
	ldr	pc, [sp], #4
.LFE180:
	.size	nrf_memobj_pool_init, .-nrf_memobj_pool_init
	.section	.text.nrf_memobj_alloc,"ax",%progbits
	.align	1
	.global	nrf_memobj_alloc
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_memobj_alloc, %function
nrf_memobj_alloc:
.LFB181:
	.loc 2 90 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI11:
	sub	sp, sp, #44
.LCFI12:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 2 91 32
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #16]
	.loc 2 91 14
	subs	r3, r3, #4
	str	r3, [sp, #28]
	.loc 2 92 38
	ldr	r2, [sp]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	adds	r2, r3, #3
	ldr	r3, [sp, #28]
	udiv	r3, r2, r3
	.loc 2 92 13
	strb	r3, [sp, #27]
	.loc 2 94 30
	ldr	r0, [sp, #4]
	bl	nrf_balloc_alloc
	str	r0, [sp, #20]
	.loc 2 95 8
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L8
	.loc 2 97 16
	movs	r3, #0
	b	.L9
.L8:
	.loc 2 99 46
	ldr	r3, [sp, #20]
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 2 100 47
	ldr	r3, [sp, #20]
	movs	r2, #1
	strb	r2, [r3, #5]
	.loc 2 101 48
	ldr	r3, [sp, #28]
	uxth	r2, r3
	ldr	r3, [sp, #20]
	strh	r2, [r3, #6]	@ movhi
	.loc 2 103 23
	ldr	r3, [sp, #20]
	str	r3, [sp, #36]
	.loc 2 106 28
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	.loc 2 106 14
	subs	r3, r3, #1
	str	r3, [sp, #16]
	.loc 2 108 20
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 2 109 12
	movs	r3, #0
	str	r3, [sp, #32]
	.loc 2 109 5
	b	.L10
.L13:
	.loc 2 111 37
	ldr	r0, [sp, #4]
	bl	nrf_balloc_alloc
	str	r0, [sp, #12]
	.loc 2 112 12
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L11
	.loc 2 114 45
	ldr	r3, [sp, #20]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	.loc 2 114 56
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [sp, #20]
	strb	r2, [r3, #5]
	.loc 2 115 28
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #12]
	str	r2, [r3]
	.loc 2 116 28
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #4]
	str	r2, [r3]
	.loc 2 117 20
	ldr	r3, [sp, #12]
	str	r3, [sp, #36]
	b	.L14
.L11:
	.loc 2 122 13
	ldr	r0, [sp, #20]
	bl	nrf_memobj_free
	.loc 2 123 20
	movs	r3, #0
	b	.L9
.L14:
	.loc 2 109 35 discriminator 2
	ldr	r3, [sp, #32]
	adds	r3, r3, #1
	str	r3, [sp, #32]
.L10:
	.loc 2 109 19 discriminator 1
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #16]
	cmp	r2, r3
	bcc	.L13
	.loc 2 126 12
	ldr	r3, [sp, #20]
.L9:
	.loc 2 127 1
	mov	r0, r3
	add	sp, sp, #44
.LCFI13:
	@ sp needed
	ldr	pc, [sp], #4
.LFE181:
	.size	nrf_memobj_alloc, .-nrf_memobj_alloc
	.section	.text.nrf_memobj_free,"ax",%progbits
	.align	1
	.global	nrf_memobj_free
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_memobj_free, %function
nrf_memobj_free:
.LFB182:
	.loc 2 130 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI14:
	sub	sp, sp, #44
.LCFI15:
	str	r0, [sp, #4]
	.loc 2 131 21
	ldr	r3, [sp, #4]
	str	r3, [sp, #28]
	.loc 2 132 13
	ldr	r3, [sp, #28]
	ldrb	r3, [r3, #5]
	strb	r3, [sp, #27]
	.loc 2 134 23
	ldr	r3, [sp, #4]
	str	r3, [sp, #32]
	.loc 2 136 28
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	.loc 2 136 14
	subs	r3, r3, #1
	str	r3, [sp, #20]
	.loc 2 138 12
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 2 138 5
	b	.L16
.L17:
	.loc 2 140 16 discriminator 3
	ldr	r3, [sp, #32]
	ldr	r3, [r3]
	str	r3, [sp, #32]
	.loc 2 138 35 discriminator 3
	ldr	r3, [sp, #36]
	adds	r3, r3, #1
	str	r3, [sp, #36]
.L16:
	.loc 2 138 19 discriminator 1
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	bcc	.L17
	.loc 2 142 26
	ldr	r3, [sp, #32]
	ldr	r3, [r3]
	str	r3, [sp, #16]
	.loc 2 144 12
	ldr	r3, [sp, #4]
	str	r3, [sp, #32]
	.loc 2 145 12
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 2 145 5
	b	.L18
.L19:
	.loc 2 147 16 discriminator 3
	ldr	r3, [sp, #32]
	ldr	r3, [r3]
	str	r3, [sp, #12]
	.loc 2 148 9 discriminator 3
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #16]
	bl	nrf_balloc_free
	.loc 2 149 16 discriminator 3
	ldr	r3, [sp, #12]
	str	r3, [sp, #32]
	.loc 2 145 33 discriminator 3
	ldr	r3, [sp, #36]
	adds	r3, r3, #1
	str	r3, [sp, #36]
.L18:
	.loc 2 145 19 discriminator 1
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	ldr	r2, [sp, #36]
	cmp	r2, r3
	bcc	.L19
	.loc 2 151 1
	nop
	nop
	add	sp, sp, #44
.LCFI16:
	@ sp needed
	ldr	pc, [sp], #4
.LFE182:
	.size	nrf_memobj_free, .-nrf_memobj_free
	.section	.text.nrf_memobj_get,"ax",%progbits
	.align	1
	.global	nrf_memobj_get
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_memobj_get, %function
nrf_memobj_get:
.LFB183:
	.loc 2 154 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI17:
	sub	sp, sp, #20
.LCFI18:
	str	r0, [sp, #4]
	.loc 2 155 21
	ldr	r3, [sp, #4]
	str	r3, [sp, #12]
	.loc 2 156 11
	ldr	r3, [sp, #12]
	adds	r3, r3, #4
	movs	r1, #1
	mov	r0, r3
	bl	nrf_atomic_u32_add
	.loc 2 157 1
	nop
	add	sp, sp, #20
.LCFI19:
	@ sp needed
	ldr	pc, [sp], #4
.LFE183:
	.size	nrf_memobj_get, .-nrf_memobj_get
	.section	.text.nrf_memobj_put,"ax",%progbits
	.align	1
	.global	nrf_memobj_put
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_memobj_put, %function
nrf_memobj_put:
.LFB184:
	.loc 2 160 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI20:
	sub	sp, sp, #28
.LCFI21:
	str	r0, [sp, #4]
	.loc 2 161 21
	ldr	r3, [sp, #4]
	str	r3, [sp, #20]
	.loc 2 162 25
	ldr	r3, [sp, #20]
	adds	r3, r3, #4
	movs	r1, #1
	mov	r0, r3
	bl	nrf_atomic_u32_sub
	mov	r3, r0
	.loc 2 162 14
	str	r3, [sp, #12]
	.loc 2 163 35
	add	r3, sp, #12
	str	r3, [sp, #16]
	.loc 2 164 17
	ldr	r3, [sp, #16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 2 164 8
	cmp	r3, #0
	bne	.L23
	.loc 2 166 9
	ldr	r0, [sp, #4]
	bl	nrf_memobj_free
.L23:
	.loc 2 168 1
	nop
	add	sp, sp, #28
.LCFI22:
	@ sp needed
	ldr	pc, [sp], #4
.LFE184:
	.size	nrf_memobj_put, .-nrf_memobj_put
	.section	.text.memobj_op,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	memobj_op, %function
memobj_op:
.LFB185:
	.loc 2 175 1
	@ args = 4, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI23:
	sub	sp, sp, #52
.LCFI24:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 2 177 21
	ldr	r3, [sp, #12]
	str	r3, [sp, #24]
	.loc 2 178 62
	ldr	r3, [sp, #24]
	ldrh	r3, [r3, #6]
	.loc 2 178 14
	str	r3, [sp, #20]
	.loc 2 179 21
	ldr	r3, [sp, #12]
	str	r3, [sp, #44]
	.loc 2 180 34
	ldr	r3, [sp]
	adds	r2, r3, #4
	.loc 2 180 14
	ldr	r3, [sp, #20]
	udiv	r3, r2, r3
	str	r3, [sp, #40]
	.loc 2 181 37
	ldr	r3, [sp]
	adds	r3, r3, #4
	.loc 2 181 14
	ldr	r2, [sp, #20]
	udiv	r2, r3, r2
	ldr	r1, [sp, #20]
	mul	r2, r1, r2
	subs	r3, r3, r2
	str	r3, [sp, #36]
	.loc 2 183 31
	ldr	r2, [sp]
	ldr	r3, [sp, #4]
	add	r2, r2, r3
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	adds	r2, r3, #3
	ldr	r3, [sp, #20]
	udiv	r3, r2, r3
	.loc 2 183 13
	strb	r3, [sp, #19]
	.loc 2 188 11
	b	.L25
.L26:
	.loc 2 190 22
	ldr	r3, [sp, #44]
	ldr	r3, [r3]
	str	r3, [sp, #44]
	.loc 2 191 18
	ldr	r3, [sp, #40]
	subs	r3, r3, #1
	str	r3, [sp, #40]
.L25:
	.loc 2 188 22
	ldr	r3, [sp, #40]
	cmp	r3, #0
	bne	.L26
	.loc 2 194 14
	movs	r3, #0
	str	r3, [sp, #32]
	.loc 2 195 14
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #36]
	subs	r3, r2, r3
	str	r3, [sp, #28]
	.loc 2 196 19
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
	.loc 2 198 11
	b	.L27
.L30:
	.loc 2 200 12
	ldrb	r3, [sp, #56]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L28
	.loc 2 202 13
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #32]
	adds	r0, r2, r3
	.loc 2 202 54
	ldr	r2, [sp, #44]
	ldr	r3, [sp, #36]
	add	r3, r3, r2
	adds	r3, r3, #4
	.loc 2 202 13
	ldr	r2, [sp, #28]
	mov	r1, r3
	bl	memcpy
	b	.L29
.L28:
	.loc 2 206 20
	ldr	r2, [sp, #44]
	ldr	r3, [sp, #36]
	add	r3, r3, r2
	adds	r0, r3, #4
	.loc 2 206 13
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #32]
	add	r3, r3, r2
	ldr	r2, [sp, #28]
	mov	r1, r3
	bl	memcpy
.L29:
	.loc 2 208 22
	movs	r3, #0
	str	r3, [sp, #36]
	.loc 2 209 22
	ldr	r3, [sp, #44]
	ldr	r3, [r3]
	str	r3, [sp, #44]
	.loc 2 210 13
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #28]
	subs	r3, r2, r3
	str	r3, [sp, #4]
	.loc 2 211 20
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #32]
	.loc 2 212 23
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #4]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	str	r3, [sp, #28]
.L27:
	.loc 2 198 12
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L30
	.loc 2 214 1
	nop
	nop
	add	sp, sp, #52
.LCFI25:
	@ sp needed
	ldr	pc, [sp], #4
.LFE185:
	.size	memobj_op, .-memobj_op
	.section	.text.nrf_memobj_write,"ax",%progbits
	.align	1
	.global	nrf_memobj_write
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_memobj_write, %function
nrf_memobj_write:
.LFB186:
	.loc 2 220 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI26:
	sub	sp, sp, #28
.LCFI27:
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	.loc 2 222 5
	movs	r3, #0
	str	r3, [sp]
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #16]
	ldr	r0, [sp, #20]
	bl	memobj_op
	.loc 2 223 1
	nop
	add	sp, sp, #28
.LCFI28:
	@ sp needed
	ldr	pc, [sp], #4
.LFE186:
	.size	nrf_memobj_write, .-nrf_memobj_write
	.section	.text.nrf_memobj_read,"ax",%progbits
	.align	1
	.global	nrf_memobj_read
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_memobj_read, %function
nrf_memobj_read:
.LFB187:
	.loc 2 229 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI29:
	sub	sp, sp, #28
.LCFI30:
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	.loc 2 230 5
	movs	r3, #1
	str	r3, [sp]
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #12]
	ldr	r1, [sp, #16]
	ldr	r0, [sp, #20]
	bl	memobj_op
	.loc 2 231 1
	nop
	add	sp, sp, #28
.LCFI31:
	@ sp needed
	ldr	pc, [sp], #4
.LFE187:
	.size	nrf_memobj_read, .-nrf_memobj_read
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
	.4byte	.LFB173
	.4byte	.LFE173-.LFB173
	.byte	0x4
	.4byte	.LCFI0-.LFB173
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB175
	.4byte	.LFE175-.LFB175
	.byte	0x4
	.4byte	.LCFI4-.LFB175
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xc4
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB180
	.4byte	.LFE180-.LFB180
	.byte	0x4
	.4byte	.LCFI8-.LFB180
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB181
	.4byte	.LFE181-.LFB181
	.byte	0x4
	.4byte	.LCFI11-.LFB181
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB182
	.4byte	.LFE182-.LFB182
	.byte	0x4
	.4byte	.LCFI14-.LFB182
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB183
	.4byte	.LFE183-.LFB183
	.byte	0x4
	.4byte	.LCFI17-.LFB183
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.byte	0x4
	.4byte	.LCFI20-.LFB184
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB185
	.4byte	.LFE185-.LFB185
	.byte	0x4
	.4byte	.LCFI23-.LFB185
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB186
	.4byte	.LFE186-.LFB186
	.byte	0x4
	.4byte	.LCFI26-.LFB186
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB187
	.4byte	.LFE187-.LFB187
	.byte	0x4
	.4byte	.LCFI29-.LFB187
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE18:
	.text
.Letext0:
	.file 3 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/stdint.h"
	.file 4 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/stdlib.h"
	.file 5 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/util/sdk_errors.h"
	.file 6 "../../../../../lib/nRF5_SDK_14.2.0/components/libraries/balloc/nrf_balloc.h"
	.file 7 "/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/lib/nRF5_SDK_14.2.0/components/libraries/experimental_memobj/nrf_memobj.h"
	.file 8 "/Applications/SEGGER Embedded Studio for ARM 6.40/include/string.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x788
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0xc
	.4byte	.LASF79
	.4byte	.LASF80
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
	.byte	0x3
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
	.byte	0x3
	.byte	0xe3
	.byte	0x1c
	.4byte	0x67
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x3
	.byte	0xe5
	.byte	0x1c
	.4byte	0x33
	.uleb128 0x5
	.4byte	0x6e
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
	.byte	0x4
	.byte	0x27
	.byte	0x1d
	.4byte	0x33
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x5
	.byte	0x9d
	.byte	0x12
	.4byte	0x6e
	.uleb128 0x6
	.byte	0x4
	.4byte	0x41
	.uleb128 0x7
	.byte	0x8
	.byte	0x6
	.byte	0x5b
	.byte	0x9
	.4byte	0xd6
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x6
	.byte	0x5d
	.byte	0xf
	.4byte	0xac
	.byte	0
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x6
	.byte	0x5e
	.byte	0xf
	.4byte	0x41
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x6
	.byte	0x5f
	.byte	0x3
	.4byte	0xb2
	.uleb128 0x7
	.byte	0x14
	.byte	0x6
	.byte	0x62
	.byte	0x9
	.4byte	0x12d
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x6
	.byte	0x64
	.byte	0x17
	.4byte	0x12d
	.byte	0
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x6
	.byte	0x65
	.byte	0x17
	.4byte	0xac
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x6
	.byte	0x69
	.byte	0x17
	.4byte	0xac
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x6
	.byte	0x6a
	.byte	0x17
	.4byte	0x133
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x6
	.byte	0x76
	.byte	0x17
	.4byte	0x5b
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xd6
	.uleb128 0x9
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x6
	.byte	0x7b
	.byte	0x3
	.4byte	0xe2
	.uleb128 0xa
	.4byte	0x135
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x7
	.byte	0x5d
	.byte	0x16
	.4byte	0x135
	.uleb128 0xa
	.4byte	0x146
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x7
	.byte	0x62
	.byte	0x10
	.4byte	0x133
	.uleb128 0xa
	.4byte	0x157
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x1
	.byte	0x4a
	.byte	0x1b
	.4byte	0x7a
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x2
	.byte	0x2d
	.byte	0x1e
	.4byte	0x180
	.uleb128 0xb
	.4byte	.LASF81
	.byte	0x8
	.byte	0x2
	.byte	0x4d
	.byte	0x8
	.4byte	0x1a8
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x2
	.byte	0x4f
	.byte	0x16
	.4byte	0x1c5
	.byte	0
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x2
	.byte	0x50
	.byte	0x16
	.4byte	0x284
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.byte	0x2
	.byte	0x2f
	.byte	0x9
	.4byte	0x1bf
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x2
	.byte	0x31
	.byte	0x15
	.4byte	0x1bf
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x174
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x2
	.byte	0x32
	.byte	0x3
	.4byte	0x1a8
	.uleb128 0x7
	.byte	0x4
	.byte	0x2
	.byte	0x34
	.byte	0x9
	.4byte	0x202
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x2
	.byte	0x36
	.byte	0xe
	.4byte	0x41
	.byte	0
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x2
	.byte	0x37
	.byte	0xe
	.4byte	0x41
	.byte	0x1
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x2
	.byte	0x38
	.byte	0xe
	.4byte	0x5b
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.4byte	.LASF34
	.byte	0x2
	.byte	0x39
	.byte	0x3
	.4byte	0x1d1
	.uleb128 0xc
	.byte	0x4
	.byte	0x2
	.byte	0x3d
	.byte	0x5
	.4byte	0x230
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x2
	.byte	0x3f
	.byte	0x25
	.4byte	0x168
	.uleb128 0xd
	.4byte	.LASF36
	.byte	0x2
	.byte	0x40
	.byte	0x25
	.4byte	0x202
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.byte	0x2
	.byte	0x3b
	.byte	0x9
	.4byte	0x247
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x2
	.byte	0x41
	.byte	0x7
	.4byte	0x20e
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0x2
	.byte	0x42
	.byte	0x3
	.4byte	0x230
	.uleb128 0x7
	.byte	0xc
	.byte	0x2
	.byte	0x44
	.byte	0x9
	.4byte	0x284
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x2
	.byte	0x46
	.byte	0x1a
	.4byte	0x1c5
	.byte	0
	.uleb128 0x8
	.4byte	.LASF38
	.byte	0x2
	.byte	0x47
	.byte	0x1a
	.4byte	0x247
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x2
	.byte	0x48
	.byte	0x1a
	.4byte	0x284
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.4byte	0x41
	.4byte	0x294
	.uleb128 0xf
	.4byte	0x33
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x2
	.byte	0x49
	.byte	0x3
	.4byte	0x253
	.uleb128 0x10
	.4byte	.LASF40
	.byte	0x8
	.byte	0x38
	.byte	0xb
	.4byte	0x133
	.4byte	0x2c0
	.uleb128 0x11
	.4byte	0x133
	.uleb128 0x11
	.4byte	0x2c0
	.uleb128 0x11
	.4byte	0x8d
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2c6
	.uleb128 0x12
	.uleb128 0x13
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x11e
	.byte	0x6
	.4byte	0x2df
	.uleb128 0x11
	.4byte	0x2df
	.uleb128 0x11
	.4byte	0x133
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x141
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0x6
	.2byte	0x117
	.byte	0x8
	.4byte	0x133
	.4byte	0x2fc
	.uleb128 0x11
	.4byte	0x2df
	.byte	0
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x6
	.2byte	0x10d
	.byte	0xc
	.4byte	0xa0
	.4byte	0x313
	.uleb128 0x11
	.4byte	0x2df
	.byte	0
	.uleb128 0x15
	.4byte	.LASF46
	.byte	0x2
	.byte	0xe1
	.byte	0x6
	.4byte	.LFB187
	.4byte	.LFE187-.LFB187
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x366
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0x2
	.byte	0xe1
	.byte	0x25
	.4byte	0x366
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x2
	.byte	0xe2
	.byte	0x1d
	.4byte	0x133
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.ascii	"len\000"
	.byte	0x2
	.byte	0xe3
	.byte	0x1f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF45
	.byte	0x2
	.byte	0xe4
	.byte	0x1f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x157
	.uleb128 0x15
	.4byte	.LASF47
	.byte	0x2
	.byte	0xd8
	.byte	0x6
	.4byte	.LFB186
	.4byte	.LFE186-.LFB186
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3bf
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0x2
	.byte	0xd8
	.byte	0x26
	.4byte	0x366
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x2
	.byte	0xd9
	.byte	0x1e
	.4byte	0x133
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.ascii	"len\000"
	.byte	0x2
	.byte	0xda
	.byte	0x20
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF45
	.byte	0x2
	.byte	0xdb
	.byte	0x20
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.4byte	.LASF76
	.byte	0x2
	.byte	0xaa
	.byte	0xd
	.4byte	.LFB185
	.4byte	.LFE185-.LFB185
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x499
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0x2
	.byte	0xaa
	.byte	0x26
	.4byte	0x366
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x2
	.byte	0xab
	.byte	0x1e
	.4byte	0x133
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x17
	.ascii	"len\000"
	.byte	0x2
	.byte	0xac
	.byte	0x20
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.4byte	.LASF45
	.byte	0x2
	.byte	0xad
	.byte	0x20
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.4byte	.LASF48
	.byte	0x2
	.byte	0xae
	.byte	0x1c
	.4byte	0x499
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF49
	.byte	0x2
	.byte	0xb1
	.byte	0x15
	.4byte	0x4a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.4byte	.LASF50
	.byte	0x2
	.byte	0xb2
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.4byte	.LASF51
	.byte	0x2
	.byte	0xb3
	.byte	0x15
	.4byte	0x1bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF52
	.byte	0x2
	.byte	0xb4
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF53
	.byte	0x2
	.byte	0xb5
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF54
	.byte	0x2
	.byte	0xb7
	.byte	0xd
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0x19
	.4byte	.LASF55
	.byte	0x2
	.byte	0xc2
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF56
	.byte	0x2
	.byte	0xc3
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.4byte	.LASF57
	.uleb128 0x6
	.byte	0x4
	.4byte	0x294
	.uleb128 0x15
	.4byte	.LASF58
	.byte	0x2
	.byte	0x9f
	.byte	0x6
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f9
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0x2
	.byte	0x9f
	.byte	0x24
	.4byte	0x366
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LASF49
	.byte	0x2
	.byte	0xa1
	.byte	0x15
	.4byte	0x4a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF31
	.byte	0x2
	.byte	0xa2
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF59
	.byte	0x2
	.byte	0xa3
	.byte	0x23
	.4byte	0x4f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x202
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x2
	.byte	0x99
	.byte	0x6
	.4byte	.LFB183
	.4byte	.LFE183-.LFB183
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x534
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0x2
	.byte	0x99
	.byte	0x2a
	.4byte	0x534
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF49
	.byte	0x2
	.byte	0x9b
	.byte	0x15
	.4byte	0x4a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x163
	.uleb128 0x15
	.4byte	.LASF61
	.byte	0x2
	.byte	0x81
	.byte	0x6
	.4byte	.LFB182
	.4byte	.LFE182-.LFB182
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c7
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0x2
	.byte	0x81
	.byte	0x25
	.4byte	0x366
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.4byte	.LASF49
	.byte	0x2
	.byte	0x83
	.byte	0x15
	.4byte	0x4a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF32
	.byte	0x2
	.byte	0x84
	.byte	0xd
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x2
	.byte	0x85
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF62
	.byte	0x2
	.byte	0x86
	.byte	0x17
	.4byte	0x5c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF29
	.byte	0x2
	.byte	0x87
	.byte	0x17
	.4byte	0x5c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.4byte	.LASF63
	.byte	0x2
	.byte	0x88
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LASF64
	.byte	0x2
	.byte	0x8e
	.byte	0x1a
	.4byte	0x2df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1c5
	.uleb128 0x1b
	.4byte	.LASF70
	.byte	0x2
	.byte	0x58
	.byte	0x10
	.4byte	0x366
	.4byte	.LFB181
	.4byte	.LFE181-.LFB181
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x66d
	.uleb128 0x16
	.4byte	.LASF65
	.byte	0x2
	.byte	0x58
	.byte	0x3b
	.4byte	0x66d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.4byte	.LASF66
	.byte	0x2
	.byte	0x59
	.byte	0x28
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.4byte	.LASF67
	.byte	0x2
	.byte	0x5b
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF68
	.byte	0x2
	.byte	0x5c
	.byte	0xd
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x19
	.4byte	.LASF49
	.byte	0x2
	.byte	0x5e
	.byte	0x15
	.4byte	0x4a0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LASF69
	.byte	0x2
	.byte	0x67
	.byte	0x17
	.4byte	0x5c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF62
	.byte	0x2
	.byte	0x68
	.byte	0x17
	.4byte	0x5c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x2
	.byte	0x69
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF63
	.byte	0x2
	.byte	0x6a
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x152
	.uleb128 0x1b
	.4byte	.LASF71
	.byte	0x2
	.byte	0x53
	.byte	0xc
	.4byte	0xa0
	.4byte	.LFB180
	.4byte	.LFE180-.LFB180
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x69d
	.uleb128 0x16
	.4byte	.LASF65
	.byte	0x2
	.byte	0x53
	.byte	0x3b
	.4byte	0x66d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x1a2
	.byte	0x18
	.4byte	0x6e
	.4byte	.LFB175
	.4byte	.LFE175-.LFB175
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x713
	.uleb128 0x1d
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x1a2
	.byte	0x3e
	.4byte	0x713
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x1a2
	.byte	0x4f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x1a7
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x1a8
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1e
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x1aa
	.byte	0x5
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x168
	.uleb128 0x20
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x168
	.byte	0x18
	.4byte	0x6e
	.4byte	.LFB173
	.4byte	.LFE173-.LFB173
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x168
	.byte	0x3e
	.4byte	0x713
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1d
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x168
	.byte	0x4f
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x16d
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x16e
	.byte	0xe
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1e
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x170
	.byte	0x5
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x17
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
	.uleb128 0xd
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
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x5
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x34
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x123
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x78c
	.4byte	0x2a0
	.ascii	"memcpy\000"
	.4byte	0x2c7
	.ascii	"nrf_balloc_free\000"
	.4byte	0x2e5
	.ascii	"nrf_balloc_alloc\000"
	.4byte	0x2fc
	.ascii	"nrf_balloc_init\000"
	.4byte	0x313
	.ascii	"nrf_memobj_read\000"
	.4byte	0x36c
	.ascii	"nrf_memobj_write\000"
	.4byte	0x3bf
	.ascii	"memobj_op\000"
	.4byte	0x4a6
	.ascii	"nrf_memobj_put\000"
	.4byte	0x4ff
	.ascii	"nrf_memobj_get\000"
	.4byte	0x53a
	.ascii	"nrf_memobj_free\000"
	.4byte	0x5cd
	.ascii	"nrf_memobj_alloc\000"
	.4byte	0x673
	.ascii	"nrf_memobj_pool_init\000"
	.4byte	0x69d
	.ascii	"nrf_atomic_u32_sub\000"
	.4byte	0x719
	.ascii	"nrf_atomic_u32_add\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1df
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x78c
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
	.4byte	0x7f
	.ascii	"long long int\000"
	.4byte	0x86
	.ascii	"long long unsigned int\000"
	.4byte	0x8d
	.ascii	"size_t\000"
	.4byte	0x99
	.ascii	"long int\000"
	.4byte	0xa0
	.ascii	"ret_code_t\000"
	.4byte	0xd6
	.ascii	"nrf_balloc_cb_t\000"
	.4byte	0x135
	.ascii	"nrf_balloc_t\000"
	.4byte	0x146
	.ascii	"nrf_memobj_pool_t\000"
	.4byte	0x157
	.ascii	"nrf_memobj_t\000"
	.4byte	0x168
	.ascii	"nrf_atomic_u32_t\000"
	.4byte	0x174
	.ascii	"memobj_elem_t\000"
	.4byte	0x1c5
	.ascii	"memobj_header_t\000"
	.4byte	0x202
	.ascii	"memobj_head_header_fields_t\000"
	.4byte	0x247
	.ascii	"memobj_head_header_t\000"
	.4byte	0x294
	.ascii	"memobj_head_t\000"
	.4byte	0x180
	.ascii	"memobj_elem_s\000"
	.4byte	0x499
	.ascii	"_Bool\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x64
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB173
	.4byte	.LFE173-.LFB173
	.4byte	.LFB175
	.4byte	.LFE175-.LFB175
	.4byte	.LFB180
	.4byte	.LFE180-.LFB180
	.4byte	.LFB181
	.4byte	.LFE181-.LFB181
	.4byte	.LFB182
	.4byte	.LFE182-.LFB182
	.4byte	.LFB183
	.4byte	.LFE183-.LFB183
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.4byte	.LFB185
	.4byte	.LFE185-.LFB185
	.4byte	.LFB186
	.4byte	.LFE186-.LFB186
	.4byte	.LFB187
	.4byte	.LFE187-.LFB187
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB173
	.4byte	.LFE173
	.4byte	.LFB175
	.4byte	.LFE175
	.4byte	.LFB180
	.4byte	.LFE180
	.4byte	.LFB181
	.4byte	.LFE181
	.4byte	.LFB182
	.4byte	.LFE182
	.4byte	.LFB183
	.4byte	.LFE183
	.4byte	.LFB184
	.4byte	.LFE184
	.4byte	.LFB185
	.4byte	.LFE185
	.4byte	.LFB186
	.4byte	.LFE186
	.4byte	.LFB187
	.4byte	.LFE187
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF50:
	.ascii	"space_in_chunk\000"
.LASF27:
	.ascii	"header\000"
.LASF15:
	.ascii	"max_utilization\000"
.LASF74:
	.ascii	"new_val\000"
.LASF21:
	.ascii	"block_size\000"
.LASF31:
	.ascii	"user_cnt\000"
.LASF41:
	.ascii	"nrf_balloc_alloc\000"
.LASF4:
	.ascii	"short int\000"
.LASF11:
	.ascii	"size_t\000"
.LASF65:
	.ascii	"p_pool\000"
.LASF69:
	.ascii	"p_prev\000"
.LASF20:
	.ascii	"p_memory_begin\000"
.LASF55:
	.ascii	"src_offset\000"
.LASF70:
	.ascii	"nrf_memobj_alloc\000"
.LASF32:
	.ascii	"chunk_cnt\000"
.LASF40:
	.ascii	"memcpy\000"
.LASF61:
	.ascii	"nrf_memobj_free\000"
.LASF59:
	.ascii	"p_fields\000"
.LASF54:
	.ascii	"chunks_expected\000"
.LASF29:
	.ascii	"p_next\000"
.LASF18:
	.ascii	"p_stack_base\000"
.LASF72:
	.ascii	"value\000"
.LASF34:
	.ascii	"memobj_head_header_fields_t\000"
.LASF22:
	.ascii	"nrf_balloc_t\000"
.LASF71:
	.ascii	"nrf_memobj_pool_init\000"
.LASF5:
	.ascii	"uint8_t\000"
.LASF58:
	.ascii	"nrf_memobj_put\000"
.LASF83:
	.ascii	"nrf_atomic_u32_sub\000"
.LASF81:
	.ascii	"memobj_elem_s\000"
.LASF26:
	.ascii	"memobj_elem_t\000"
.LASF48:
	.ascii	"read\000"
.LASF9:
	.ascii	"long long int\000"
.LASF64:
	.ascii	"p_pool2\000"
.LASF73:
	.ascii	"old_val\000"
.LASF37:
	.ascii	"memobj_head_header_t\000"
.LASF12:
	.ascii	"long int\000"
.LASF35:
	.ascii	"atomic_user_cnt\000"
.LASF80:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"src/embedded/SEGGER Embedded Studio/thread_example/"
	.ascii	"SES\000"
.LASF45:
	.ascii	"offset\000"
.LASF78:
	.ascii	"GNU C99 11.3.1 20220712 -fmessage-length=0 -std=gnu"
	.ascii	"99 -mcpu=cortex-m4 -mlittle-endian -mfloat-abi=hard"
	.ascii	" -mfpu=fpv4-sp-d16 -mthumb -mtp=soft -mfp16-format="
	.ascii	"ieee -munaligned-access -gdwarf-4 -g2 -gpubnames -f"
	.ascii	"omit-frame-pointer -fno-dwarf2-cfi-asm -ffunction-s"
	.ascii	"ections -fdata-sections -fshort-enums -fno-common\000"
.LASF49:
	.ascii	"p_head\000"
.LASF75:
	.ascii	"str_res\000"
.LASF53:
	.ascii	"chunk_offset\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF30:
	.ascii	"memobj_header_t\000"
.LASF17:
	.ascii	"p_cb\000"
.LASF2:
	.ascii	"signed char\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF76:
	.ascii	"memobj_op\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"uint16_t\000"
.LASF14:
	.ascii	"p_stack_pointer\000"
.LASF56:
	.ascii	"curr_cpy_size\000"
.LASF68:
	.ascii	"num_of_chunks\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF25:
	.ascii	"nrf_atomic_u32_t\000"
.LASF19:
	.ascii	"p_stack_limit\000"
.LASF67:
	.ascii	"bsize\000"
.LASF0:
	.ascii	"char\000"
.LASF82:
	.ascii	"nrf_balloc_free\000"
.LASF60:
	.ascii	"nrf_memobj_get\000"
.LASF43:
	.ascii	"p_obj\000"
.LASF57:
	.ascii	"_Bool\000"
.LASF39:
	.ascii	"memobj_head_t\000"
.LASF46:
	.ascii	"nrf_memobj_read\000"
.LASF51:
	.ascii	"p_curr_chunk\000"
.LASF28:
	.ascii	"data\000"
.LASF16:
	.ascii	"nrf_balloc_cb_t\000"
.LASF8:
	.ascii	"uint32_t\000"
.LASF23:
	.ascii	"nrf_memobj_pool_t\000"
.LASF38:
	.ascii	"head_header\000"
.LASF36:
	.ascii	"fields\000"
.LASF66:
	.ascii	"size\000"
.LASF24:
	.ascii	"nrf_memobj_t\000"
.LASF77:
	.ascii	"nrf_atomic_u32_add\000"
.LASF33:
	.ascii	"chunk_size\000"
.LASF47:
	.ascii	"nrf_memobj_write\000"
.LASF62:
	.ascii	"p_curr\000"
.LASF42:
	.ascii	"nrf_balloc_init\000"
.LASF63:
	.ascii	"chunk_less1\000"
.LASF44:
	.ascii	"p_data\000"
.LASF52:
	.ascii	"chunk_idx\000"
.LASF79:
	.ascii	"/Users/quentin/Desktop/Oui./uwb_project/iridia-dwm/"
	.ascii	"lib/nRF5_SDK_14.2.0/components/libraries/experiment"
	.ascii	"al_memobj/nrf_memobj.c\000"
.LASF13:
	.ascii	"ret_code_t\000"
	.ident	"GCC: (based on arm-11.3.Rel1 GCC) 11.3.1 20220712"
