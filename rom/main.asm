; Assemble with xa: https://www.floodgap.com/retrotech/xa/ 

; F000 = TUTORIAL

* = $E000
	.bin 0, 0, "rom/intbasic.bin"

* = $F000
TUTORIAL_BUFFER = $4000
unpack_src = $10
unpack_dst = $12

tutorial_start:
	lda #<decomp_msg
	sta $00
	lda #>decomp_msg
	sta $01

	jsr print_string

	lda #<tutortxt_compressed
	sta unpack_src
	lda #>tutortxt_compressed
	sta unpack_src+1

	lda #<TUTORIAL_BUFFER
	sta unpack_dst
	lda #>TUTORIAL_BUFFER
	sta unpack_dst+1

	jsr unpack

	lda #<TUTORIAL_BUFFER
	sta $00
	lda #>TUTORIAL_BUFFER
	sta $01

	ldx #8

tutorial_loop:
	jsr print_string

	dex
	beq tutorial_end

	jsr wait_for_key

	jmp tutorial_loop

tutorial_end:
	jmp WOZMON_INIT

tutortxt_compressed:
	.bin 0, 0, "build/tutortxt.cmp"

WOZMON_INIT = $FF00
WOZMON_OUT = $FFEF
DSP_KBD_IN = $D010
DSP_KBD_CTRL = $D011

init_start:
	cld
	cli

	lda #<init_msg
	sta $00
	lda #>init_msg
	sta $01

	jsr print_string

done:
	jmp WOZMON_INIT

init_msg:
	.byt 13, 13
	.byt 'Welcome to my MATLAB Apple I Emulator!', 13, 13
;	.byt 'Type "FF00.FFFF" to dump the system ROM.';, 13 ; Newline not needed
	.byt 'Type "F000R" for a simple tutorial.', 13
	.byt 'Type "E000R" to enter Integer BASIC.', 13, 13
	.byt 0

decomp_msg:
	.byt 13, 13
	.byt 'Decompressing, please wait... ', 0

print_string: ; Will print a zero-terminated string pointed to by $00/$01 (low/high byte).
	ldy #0

print_string_loop:
	lda ($00),y
	beq print_string_done
	jsr WOZMON_OUT

	inc $00
	bne print_string_loop
	inc $01
	jmp print_string_loop

print_string_done:
	inc $00 ; Increment past the null byte, so that we can continue printing the next string later
	bne print_string_exit
	inc $01

print_string_exit:
	rts

wait_for_key:
	lda DSP_KBD_CTRL
	bpl wait_for_key

	lda DSP_KBD_IN
	rts

unpack:
	ldy #0						; start with the token
	lda (unpack_src),y

	beq unpack_done				; 0 marks the end of packed data

	jsr unpack_increment_src	; increment src address

	pha
	and #$7F					; mask out the high bit
	tax							; store the counter
	pla

	and #$80					; if the high bit is set, next byte is offset
	beq unpack_literals			; literals come next otherwise

	lda unpack_src				; back up the src address
	pha
	lda unpack_src+1
	pha

	lda unpack_dst				; calculate the src offset
	clc
	adc (unpack_src),y
	sta unpack_src

	lda unpack_dst+1
	adc #$FF
	sta unpack_src+1

	jsr unpack_copy				; copy the data

	pla							; restore the src address
	sta unpack_src+1
	pla
	sta unpack_src
	jsr unpack_increment_src	; increment to the next token
	jmp unpack

unpack_literals:
	jsr unpack_copy
	jmp unpack

unpack_copy:
	lda (unpack_src), y			; copy the byte
	sta (unpack_dst), y

	jsr unpack_increment_src
	jsr unpack_increment_dst

	dex
	bne unpack_copy
	rts

unpack_done:
	rts

unpack_increment_src:
	inc unpack_src
	bne unpack_increment_src_done
	inc unpack_src+1

unpack_increment_src_done:
	rts

unpack_increment_dst:
	inc unpack_dst
	bne unpack_increment_dst_done
	inc unpack_dst+1

unpack_increment_dst_done:
	rts

; PAD TO FF00

	.dsb $FF00 - *, 0

; FF00 = WOZMON

	.bin 0, 252, "rom/wozmon.bin"

	.word init_start ; 6502 entry point
	.word 0
