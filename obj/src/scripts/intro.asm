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
	.globl _display_off
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
;src/scripts/intro.c:8: void start_intro() BANKED {
;	---------------------------------
; Function start_intro
; ---------------------------------
	b_start_intro	= 6
_start_intro::
;src/scripts/intro.c:9: set_bkg_data(0, 235, Slide1);
	ld	de, #_Slide1
	push	de
	ld	hl, #0xeb00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:10: set_bkg_tiles(0, 0, 20, 18, IntroSlide1);
	ld	de, #_IntroSlide1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:11: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:12: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:13: uint8_t next = 0;
	ld	c, #0x00
;src/scripts/intro.c:14: while (!next) {
00103$:
	ld	a, c
	or	a, a
	jr	NZ, 00105$
;src/scripts/intro.c:15: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00103$
;src/scripts/intro.c:16: next = 1;
	ld	c, #0x01
	jr	00103$
00105$:
;src/scripts/intro.c:19: DISPLAY_OFF;
	call	_display_off
;src/scripts/intro.c:20: set_bkg_data(0, 177, Slide2);
	ld	de, #_Slide2
	push	de
	ld	hl, #0xb100
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:21: set_bkg_tiles(0, 0, 20, 18, IntroSlide2);
	ld	de, #_IntroSlide2
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:22: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:23: next = 0;
	ld	c, #0x00
;src/scripts/intro.c:24: while (!next) {
00108$:
	ld	a, c
	or	a, a
	ret	NZ
;src/scripts/intro.c:25: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00108$
;src/scripts/intro.c:26: next = 1;
	ld	c, #0x01
;src/scripts/intro.c:29: }
	jr	00108$
	.area _CODE_6
	.area _INITIALIZER
	.area _CABS (ABS)
