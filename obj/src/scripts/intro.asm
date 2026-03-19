;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module intro
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_start_intro
	.globl _start_intro
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _joypad
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_6
;src/scripts/intro.c:6: void start_intro() BANKED {
;	---------------------------------
; Function start_intro
; ---------------------------------
	b_start_intro	= 6
_start_intro::
;src/scripts/intro.c:7: set_bkg_data(0, 235, Slide1);
	ld	de, #_Slide1
	push	de
	ld	hl, #0xeb00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:8: set_bkg_tiles(0, 0, 20, 18, IntroSlide1);
	ld	de, #_IntroSlide1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:9: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:10: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:11: while (1) {
00104$:
;src/scripts/intro.c:12: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00104$
;src/scripts/intro.c:13: return;
;src/scripts/intro.c:16: }
	ret
	.area _CODE_6
	.area _INITIALIZER
	.area _CABS (ABS)
