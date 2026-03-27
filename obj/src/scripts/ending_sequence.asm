;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ending_sequence
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wait_next
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl b_play_ending
	.globl _play_ending
	.globl _set_slide1_data
	.globl _set_slide2_data
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
;src/scripts/ending_sequence.c:8: void play_ending() BANKED {
;	---------------------------------
; Function play_ending
; ---------------------------------
	b_play_ending	= 6
_play_ending::
;src/scripts/ending_sequence.c:9: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/scripts/ending_sequence.c:10: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/scripts/ending_sequence.c:11: DISPLAY_OFF;
	call	_display_off
;src/scripts/ending_sequence.c:12: set_bkg_data(0, 101, EndingTiles);
	ld	de, #_EndingTiles
	push	de
	ld	hl, #0x6500
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/ending_sequence.c:13: set_bkg_tiles(0, 0, 20, 18, Ending1);
	ld	de, #_Ending1
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:14: set_slide1_data();
	call	_set_slide1_data
;src/scripts/ending_sequence.c:15: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/ending_sequence.c:16: wait_next();
	call	_wait_next
;src/scripts/ending_sequence.c:17: DISPLAY_OFF;
	call	_display_off
;src/scripts/ending_sequence.c:18: set_bkg_tiles(0, 0, 20, 18, Ending2);
	ld	de, #_Ending2
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:19: set_slide2_data();
	call	_set_slide2_data
;src/scripts/ending_sequence.c:20: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/ending_sequence.c:21: wait_next();
;src/scripts/ending_sequence.c:22: return;
;src/scripts/ending_sequence.c:23: }
	jp	_wait_next
;src/scripts/ending_sequence.c:25: void set_slide1_data() {
;	---------------------------------
; Function set_slide1_data
; ---------------------------------
_set_slide1_data::
	add	sp, #-3
;src/scripts/ending_sequence.c:28: lvl[0] = level / 10 + 75;
	ld	a, (_level)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/ending_sequence.c:29: lvl[1] = level % 10 + 75;
	ld	a, (_level)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/ending_sequence.c:30: set_bkg_tiles(13, 9, 2, 1, lvl);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x90d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:31: stat = sword_lvl + 75;
	ld	a, (_sword_lvl)
	add	a, #0x4b
;src/scripts/ending_sequence.c:32: set_bkg_tiles(4, 13, 1, 1, &stat);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xd04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:33: stat = shield_lvl + 75;
	ld	a, (_shield_lvl)
	add	a, #0x4b
;src/scripts/ending_sequence.c:34: set_bkg_tiles(4, 15, 1, 1, &stat);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xf04
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:35: stat = arrow_lvl + 75;
	ld	a, (_arrow_lvl)
	add	a, #0x4b
;src/scripts/ending_sequence.c:36: set_bkg_tiles(9, 13, 1, 1, &stat);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xd09
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:37: stat = quiver_lvl + 75;
	ld	a, (_quiver_lvl)
	add	a, #0x4b
;src/scripts/ending_sequence.c:38: set_bkg_tiles(9, 15, 1, 1, &stat);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xf09
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:39: stat = potion_quant_lvl + 75;
	ld	a, (_potion_quant_lvl)
	add	a, #0x4b
;src/scripts/ending_sequence.c:40: set_bkg_tiles(14, 13, 1, 1, &stat);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xd0e
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:41: stat = potion_heal_lvl + 75;
	ld	a, (_potion_heal_lvl)
	add	a, #0x4b
;src/scripts/ending_sequence.c:42: set_bkg_tiles(14, 15, 1, 1, &stat);
	ldhl	sp,#2
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xf0e
	push	hl
	call	_set_bkg_tiles
;src/scripts/ending_sequence.c:43: }
	add	sp, #9
	ret
;src/scripts/ending_sequence.c:45: void set_slide2_data() {
;	---------------------------------
; Function set_slide2_data
; ---------------------------------
_set_slide2_data::
	add	sp, #-6
;src/scripts/ending_sequence.c:49: if (hours < 10) {
	ld	a, (#_hours)
	sub	a, #0x0a
	jr	NC, 00102$
;src/scripts/ending_sequence.c:50: hr[0] = 16;
	ldhl	sp,	#0
	ld	(hl), #0x10
	jr	00103$
00102$:
;src/scripts/ending_sequence.c:53: hr[0] = hours / 10 + 75;
	ld	a, (_hours)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#0
	ld	(hl), a
00103$:
;src/scripts/ending_sequence.c:55: hr[1] = hours % 10 + 75;
	ld	a, (_hours)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/ending_sequence.c:56: mn[0] = minutes / 10 + 75;
	ld	a, (_minutes)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/ending_sequence.c:57: mn[1] = minutes % 10 + 75;
	ld	a, (_minutes)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/ending_sequence.c:58: sc[0] = seconds / 10 + 75;
	ld	a, (_seconds)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/ending_sequence.c:59: sc[1] = seconds % 10 + 75;
	ld	a, (_seconds)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x4b
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/ending_sequence.c:60: set_bkg_tiles(10, 14, 2, 1, hr);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xe0a
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:61: set_bkg_tiles(13, 14, 2, 1, mn);
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xe0d
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/ending_sequence.c:62: set_bkg_tiles(16, 14, 2, 1, sc);
	ld	hl, #4
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xe10
	push	hl
	call	_set_bkg_tiles
;src/scripts/ending_sequence.c:63: }
	add	sp, #12
	ret
	.area _CODE_6
	.area _INITIALIZER
	.area _CABS (ABS)
