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
	.globl _delay
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
;src/scripts/intro.c:10: void start_intro() BANKED {
;	---------------------------------
; Function start_intro
; ---------------------------------
	b_start_intro	= 6
_start_intro::
;src/scripts/intro.c:11: set_bkg_data(0, 235, Slide1);
	ld	de, #_Slide1
	push	de
	ld	hl, #0xeb00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:12: set_bkg_tiles(0, 0, 20, 18, IntroSlide1);
	ld	de, #_IntroSlide1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:13: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:14: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:15: uint8_t next = 0;
	ld	c, #0x00
;src/scripts/intro.c:16: while (!next) {
00103$:
	ld	a, c
	or	a, a
	jr	NZ, 00105$
;src/scripts/intro.c:17: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00103$
;src/scripts/intro.c:18: next = 1;
	ld	c, #0x01
	jr	00103$
00105$:
;src/scripts/intro.c:21: delay(50);
	ld	de, #0x0032
	call	_delay
;src/scripts/intro.c:22: DISPLAY_OFF;
	call	_display_off
;src/scripts/intro.c:23: set_bkg_data(0, 236, Slide3);
	ld	de, #_Slide3
	push	de
	ld	hl, #0xec00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:24: set_bkg_tiles(0, 0, 20, 18, IntroSlide3);
	ld	de, #_IntroSlide3
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:25: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:26: next = 0;
	ld	c, #0x00
;src/scripts/intro.c:27: while (!next) {
00108$:
	ld	a, c
	or	a, a
	jr	NZ, 00110$
;src/scripts/intro.c:28: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00108$
;src/scripts/intro.c:29: next = 1;
	ld	c, #0x01
	jr	00108$
00110$:
;src/scripts/intro.c:32: delay(50);
	ld	de, #0x0032
	call	_delay
;src/scripts/intro.c:33: DISPLAY_OFF;
	call	_display_off
;src/scripts/intro.c:34: set_bkg_data(0, 179, Slide2);
	ld	de, #_Slide2
	push	de
	ld	hl, #0xb300
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:35: set_bkg_tiles(0, 0, 20, 18, IntroSlide2);
	ld	de, #_IntroSlide2
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:36: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:38: while (!next) {
00113$:
;src/scripts/intro.c:39: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00113$
;src/scripts/intro.c:41: delay(50);
	ld	de, #0x0032
	call	_delay
;src/scripts/intro.c:42: DISPLAY_OFF;
;src/scripts/intro.c:43: return;
;src/scripts/intro.c:46: }
	jp	_display_off
	.area _CODE_6
	.area _INITIALIZER
	.area _CABS (ABS)
