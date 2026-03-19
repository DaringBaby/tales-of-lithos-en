;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module titlescreen
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _initrand
	.globl _set_bkg_tiles
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl b_set_titlescreen
	.globl _set_titlescreen
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
	.area _CODE_3
;src/scripts/titlescreen.c:12: uint8_t set_titlescreen() BANKED {
;	---------------------------------
; Function set_titlescreen
; ---------------------------------
	b_set_titlescreen	= 3
_set_titlescreen::
	add	sp, #-28
;src/scripts/titlescreen.c:13: uint8_t press_start[] = {241, 242, 243, 244, 245, 1, 1, 246, 247, 248, 242, 247};
	ldhl	sp,	#0
	ld	a, #0xf1
	ld	(hl+), a
	ld	a, #0xf2
	ld	(hl+), a
	ld	a, #0xf3
	ld	(hl+), a
	ld	a, #0xf4
	ld	(hl+), a
	ld	a, #0xf5
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a, #0xf6
	ld	(hl+), a
	ld	a, #0xf7
	ld	(hl+), a
	ld	a, #0xf8
	ld	(hl+), a
	ld	a, #0xf2
	ld	(hl+), a
;src/scripts/titlescreen.c:14: uint8_t empty[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	ld	a, #0xf7
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a,#0x01
	ld	(hl+),a
	ld	(hl+), a
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x01
;src/scripts/titlescreen.c:15: set_bkg_tiles(4, 16, 12, 1, press_start);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x10c
	push	hl
	ld	hl, #0x1004
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/titlescreen.c:16: uint8_t frame = 0;
	ld	c, #0x00
;src/scripts/titlescreen.c:17: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/scripts/titlescreen.c:18: while (1) {
00114$:
;src/scripts/titlescreen.c:19: seed++;
	ld	hl, #_seed
	inc	(hl)
	jr	NZ, 00160$
	inc	hl
	inc	(hl)
00160$:
;src/scripts/titlescreen.c:20: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/titlescreen.c:21: if (joypad() & J_START) {
	call	_joypad
	rlca
	jr	NC, 00104$
;src/scripts/titlescreen.c:22: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/titlescreen.c:23: DISPLAY_OFF;
	call	_display_off
;src/scripts/titlescreen.c:24: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/titlescreen.c:25: initrand(seed);
	ld	a, (_seed)
	ld	e, a
	ld	hl, #_seed + 1
	ld	d, (hl)
	push	de
	call	_initrand
	pop	hl
;src/scripts/titlescreen.c:26: return 0; // continua
	xor	a, a
	jr	00116$
00104$:
;src/scripts/titlescreen.c:28: else if (joypad() & J_SELECT) {
	call	_joypad
	bit	6, a
	jr	Z, 00105$
;src/scripts/titlescreen.c:29: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/titlescreen.c:30: DISPLAY_OFF;
	call	_display_off
;src/scripts/titlescreen.c:31: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/titlescreen.c:32: initrand(seed);
	ld	a, (_seed)
	ld	e, a
	ld	hl, #_seed + 1
	ld	d, (hl)
	push	de
	call	_initrand
	pop	hl
;src/scripts/titlescreen.c:33: return 1; // nuovo gioco
	ld	a, #0x01
	jr	00116$
00105$:
;src/scripts/titlescreen.c:35: if (frame == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00109$
;src/scripts/titlescreen.c:36: set_bkg_tiles(4, 16, 12, 1, empty);
	ld	hl, #12
	add	hl, sp
	push	hl
	ld	hl, #0x10c
	push	hl
	ld	hl, #0x1004
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00110$
00109$:
;src/scripts/titlescreen.c:38: else if (frame == 30) {
	ld	a, c
	sub	a, #0x1e
	jr	NZ, 00110$
;src/scripts/titlescreen.c:39: set_bkg_tiles(4, 16, 12, 1, press_start);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x10c
	push	hl
	ld	hl, #0x1004
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00110$:
;src/scripts/titlescreen.c:41: frame++;
	inc	c
;src/scripts/titlescreen.c:42: if (frame == 60) {
	ld	a, c
;src/scripts/titlescreen.c:43: frame = 0;
	sub	a, #0x3c
	jp	NZ, 00114$
	ld	c, a
	jp	00114$
00116$:
;src/scripts/titlescreen.c:47: }
	add	sp, #28
	ret
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
