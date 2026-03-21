;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module intro
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wait_next
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
;src/scripts/intro.c:11: void start_intro() BANKED {
;	---------------------------------
; Function start_intro
; ---------------------------------
	b_start_intro	= 6
_start_intro::
;src/scripts/intro.c:12: set_bkg_data(0, 236, Slide1);
	ld	de, #_Slide1
	push	de
	ld	hl, #0xec00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:13: set_bkg_tiles(0, 0, 20, 18, IntroSlide1);
	ld	de, #_IntroSlide1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:14: set_bkg_tiles(1, 14, 18, 1, line1);
	ld	de, #_line1
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:15: set_bkg_tiles(1, 16, 18, 1, line2);
	ld	de, #_line2
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:16: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:17: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:18: wait_next();
	call	_wait_next
;src/scripts/intro.c:19: set_bkg_tiles(1, 14, 18, 1, line3);
	ld	de, #_line3
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:20: set_bkg_tiles(1, 16, 18, 1, line4);
	ld	de, #_line4
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:21: wait_next();
	call	_wait_next
;src/scripts/intro.c:22: DISPLAY_OFF;
	call	_display_off
;src/scripts/intro.c:23: set_bkg_data(0, 242, Slide3);
	ld	de, #_Slide3
	push	de
	ld	hl, #0xf200
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
;src/scripts/intro.c:25: set_bkg_tiles(1, 14, 18, 1, line5);
	ld	de, #_line5
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:26: set_bkg_tiles(1, 16, 18, 1, line6);
	ld	de, #_line6
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:27: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:28: wait_next();
	call	_wait_next
;src/scripts/intro.c:29: set_bkg_tiles(1, 14, 18, 1, line7);
	ld	de, #_line7
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:30: set_bkg_tiles(1, 16, 18, 1, line8);
	ld	de, #_line8
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:31: wait_next();
	call	_wait_next
;src/scripts/intro.c:32: set_bkg_tiles(1, 14, 18, 1, line9);
	ld	de, #_line9
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:33: set_bkg_tiles(1, 16, 18, 1, line10);
	ld	de, #_line10
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:34: wait_next();
	call	_wait_next
;src/scripts/intro.c:35: set_bkg_tiles(1, 14, 18, 1, line11);
	ld	de, #_line11
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:36: set_bkg_tiles(1, 16, 18, 1, line_empty);
	ld	de, #_line_empty
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:37: wait_next();
	call	_wait_next
;src/scripts/intro.c:38: DISPLAY_OFF;
	call	_display_off
;src/scripts/intro.c:39: set_bkg_data(0, 180, Slide2);
	ld	de, #_Slide2
	push	de
	ld	hl, #0xb400
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/intro.c:40: set_bkg_tiles(0, 0, 20, 18, IntroSlide2);
	ld	de, #_IntroSlide2
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:41: set_bkg_tiles(1, 14, 18, 1, line12);
	ld	de, #_line12
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:42: set_bkg_tiles(1, 16, 18, 1, line13);
	ld	de, #_line13
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:43: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/intro.c:44: wait_next();
	call	_wait_next
;src/scripts/intro.c:45: set_bkg_tiles(1, 14, 18, 1, line14);
	ld	de, #_line14
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:46: set_bkg_tiles(1, 16, 18, 1, line15);
	ld	de, #_line15
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:47: wait_next();
	call	_wait_next
;src/scripts/intro.c:48: set_bkg_tiles(1, 14, 18, 1, line16);
	ld	de, #_line16
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:49: set_bkg_tiles(1, 16, 18, 1, line17);
	ld	de, #_line17
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:50: wait_next();
	call	_wait_next
;src/scripts/intro.c:51: set_bkg_tiles(1, 14, 18, 1, line18);
	ld	de, #_line18
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:52: set_bkg_tiles(1, 16, 18, 1, line19);
	ld	de, #_line19
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:53: wait_next();
	call	_wait_next
;src/scripts/intro.c:54: set_bkg_tiles(1, 14, 18, 1, line20);
	ld	de, #_line20
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:55: set_bkg_tiles(1, 16, 18, 1, line21);
	ld	de, #_line21
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:56: wait_next();
	call	_wait_next
;src/scripts/intro.c:57: set_bkg_tiles(1, 14, 18, 1, line22);
	ld	de, #_line22
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0xe01
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:58: set_bkg_tiles(1, 16, 18, 1, line23);
	ld	de, #_line23
	push	de
	ld	hl, #0x112
	push	hl
	ld	hl, #0x1001
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/intro.c:60: while (!next) {
00103$:
;src/scripts/intro.c:61: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00103$
;src/scripts/intro.c:63: delay(50);
	ld	de, #0x0032
	call	_delay
;src/scripts/intro.c:64: DISPLAY_OFF;
;src/scripts/intro.c:65: return;
;src/scripts/intro.c:68: }
	jp	_display_off
;src/scripts/intro.c:70: void wait_next() {
;	---------------------------------
; Function wait_next
; ---------------------------------
_wait_next::
;src/scripts/intro.c:71: uint8_t next = 0;
	ld	c, #0x00
;src/scripts/intro.c:72: while (!next) {
00103$:
	ld	a, c
	or	a, a
	jr	NZ, 00105$
;src/scripts/intro.c:73: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00103$
;src/scripts/intro.c:74: next = 1;
	ld	c, #0x01
	jr	00103$
00105$:
;src/scripts/intro.c:77: delay(150);
	ld	de, #0x0096
;src/scripts/intro.c:78: }
	jp	_delay
	.area _CODE_6
	.area _INITIALIZER
	.area _CABS (ABS)
