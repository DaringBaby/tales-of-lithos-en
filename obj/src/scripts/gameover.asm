;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module gameover
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enemy_death
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _joypad
	.globl _delay
	.globl b_game_over
	.globl _game_over
	.globl _black_spiral
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
	.area _CODE_1
;src/scripts/gameover.c:8: void game_over() BANKED {
;	---------------------------------
; Function game_over
; ---------------------------------
	b_game_over	= 1
_game_over::
	add	sp, #-5
;src/scripts/gameover.c:9: enemy_death(&enemy);
	ld	de, #_enemy
	call	_enemy_death
;src/scripts/gameover.c:10: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/scripts/gameover.c:11: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/scripts/gameover.c:12: black_spiral();
	call	_black_spiral
;src/scripts/gameover.c:13: DISPLAY_OFF;
	call	_display_off
;src/scripts/gameover.c:14: delay(500);
	ld	de, #0x01f4
	call	_delay
;src/scripts/gameover.c:17: obt_m[0] = obt_mythril / 10 + 26;
	ld	a, (_obt_mythril)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x1a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gameover.c:18: obt_m[1] = obt_mythril % 10 + 26;
	ld	a, (_obt_mythril)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x1a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/gameover.c:19: obt_e[0] = obt_exp / 100 + 26;
	ld	a, (_obt_exp)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x1a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gameover.c:20: obt_e[1] = obt_exp % 100 / 10 + 26;
	ld	a, (_obt_exp)
	ld	e, #0x64
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x1a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gameover.c:21: obt_e[2] = obt_exp % 10 + 26;
	ld	a, (_obt_exp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x1a
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gameover.c:22: set_bkg_data(0, 50, GameOverText);
	ld	de, #_GameOverText
	push	de
	ld	hl, #0x3200
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/gameover.c:23: set_bkg_tiles(0, 0, 20, 18, GameOver);
	ld	de, #_GameOver
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/gameover.c:24: set_bkg_tiles(16, 8, 3, 1, obt_e);
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0x810
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/gameover.c:25: set_bkg_tiles(17, 10, 2, 1, obt_m);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xa11
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/gameover.c:26: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/gameover.c:27: uint8_t respawn = 0;
	ld	c, #0x00
;src/scripts/gameover.c:28: while (!respawn) {
00103$:
	ld	a, c
	or	a, a
	jr	NZ, 00105$
;src/scripts/gameover.c:29: if (joypad() & J_START) {
	call	_joypad
	rlca
	jr	NC, 00103$
;src/scripts/gameover.c:30: respawn = 1;
	ld	c, #0x01
	jr	00103$
00105$:
;src/scripts/gameover.c:33: DISPLAY_OFF;
	call	_display_off
;src/scripts/gameover.c:35: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gameover.c:36: current_location = 0;
	xor	a, a
	ld	(#_current_location),a
;src/scripts/gameover.c:37: current_hp = max_hp;
	ld	a, (#_max_hp)
	ld	(#_current_hp),a
;src/scripts/gameover.c:38: num_arrows = max_num_arrows;
	ld	a, (#_max_num_arrows)
	ld	(#_num_arrows),a
;src/scripts/gameover.c:39: heals = max_heals;
	ld	a, (#_max_heals)
	ld	(#_heals),a
;src/scripts/gameover.c:41: return;
;src/scripts/gameover.c:42: }
	add	sp, #5
	ret
;src/scripts/gameover.c:44: void black_spiral() {
;	---------------------------------
; Function black_spiral
; ---------------------------------
_black_spiral::
	add	sp, #-6
;src/scripts/gameover.c:49: uint8_t black = 246;
	ldhl	sp,	#0
;src/scripts/gameover.c:50: while (top <= bottom && left <= right) {
	ld	a, #0xf6
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, #0x11
	ld	(hl+), a
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
00110$:
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00223$
	bit	7, d
	jr	NZ, 00224$
	cp	a, a
	jr	00224$
00223$:
	bit	7, d
	jr	Z, 00224$
	scf
00224$:
	jp	C, 00125$
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00225$
	bit	7, d
	jr	NZ, 00226$
	cp	a, a
	jr	00226$
00225$:
	bit	7, d
	jr	Z, 00226$
	scf
00226$:
	jp	C, 00125$
;src/scripts/gameover.c:51: for (int8_t i = left; i <= right; i++) {
	ldhl	sp,	#4
	ld	b, (hl)
00114$:
	ld	e, b
	ldhl	sp,	#3
	ld	a,(hl)
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00227$
	bit	7, d
	jr	NZ, 00228$
	cp	a, a
	jr	00228$
00227$:
	bit	7, d
	jr	Z, 00228$
	scf
00228$:
	jr	C, 00101$
;src/scripts/gameover.c:52: set_bkg_tiles(i, top, 1, 1, &black);
	ldhl	sp,	#0
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/gameover.c:53: delay(5);
	push	bc
	ld	de, #0x0005
	call	_delay
	pop	bc
;src/scripts/gameover.c:51: for (int8_t i = left; i <= right; i++) {
	inc	b
	jr	00114$
00101$:
;src/scripts/gameover.c:55: top++;
	ldhl	sp,	#1
	inc	(hl)
;src/scripts/gameover.c:57: for (int8_t i = top; i <= bottom; i++) {
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
00117$:
	ldhl	sp,	#5
	ld	e, (hl)
	ldhl	sp,	#2
	ld	a,(hl)
	ld	d,a
	ldhl	sp,	#5
	sub	a, (hl)
	bit	7, e
	jr	Z, 00229$
	bit	7, d
	jr	NZ, 00230$
	cp	a, a
	jr	00230$
00229$:
	bit	7, d
	jr	Z, 00230$
	scf
00230$:
	jr	C, 00102$
;src/scripts/gameover.c:58: set_bkg_tiles(right, i, 1, 1, &black);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/gameover.c:59: delay(5);
	ld	de, #0x0005
	call	_delay
;src/scripts/gameover.c:57: for (int8_t i = top; i <= bottom; i++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00117$
00102$:
;src/scripts/gameover.c:61: right--;
	ldhl	sp,	#3
	dec	(hl)
;src/scripts/gameover.c:63: if (top <= bottom) {
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00231$
	bit	7, d
	jr	NZ, 00232$
	cp	a, a
	jr	00232$
00231$:
	bit	7, d
	jr	Z, 00232$
	scf
00232$:
	jr	C, 00105$
;src/scripts/gameover.c:64: for (int8_t i = right; i >= left; i--) {
	ldhl	sp,	#3
	ld	b, (hl)
00120$:
	ldhl	sp,	#4
	ld	e, (hl)
	ld	a,b
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00233$
	bit	7, d
	jr	NZ, 00234$
	cp	a, a
	jr	00234$
00233$:
	bit	7, d
	jr	Z, 00234$
	scf
00234$:
	jr	C, 00103$
;src/scripts/gameover.c:65: set_bkg_tiles(i, bottom, 1, 1, &black);
	ldhl	sp,	#0
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/gameover.c:66: delay(5);
	push	bc
	ld	de, #0x0005
	call	_delay
	pop	bc
;src/scripts/gameover.c:64: for (int8_t i = right; i >= left; i--) {
	dec	b
	jr	00120$
00103$:
;src/scripts/gameover.c:68: bottom--;
	ldhl	sp,	#2
	dec	(hl)
00105$:
;src/scripts/gameover.c:71: if (left <= right) {
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00235$
	bit	7, d
	jr	NZ, 00236$
	cp	a, a
	jr	00236$
00235$:
	bit	7, d
	jr	Z, 00236$
	scf
00236$:
	jp	C, 00110$
;src/scripts/gameover.c:72: for (int8_t i = bottom; i >= top; i--) {
	ldhl	sp,	#2
	ld	b, (hl)
00123$:
	ldhl	sp,	#1
	ld	e, (hl)
	ld	a,b
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00237$
	bit	7, d
	jr	NZ, 00238$
	cp	a, a
	jr	00238$
00237$:
	bit	7, d
	jr	Z, 00238$
	scf
00238$:
	jr	C, 00106$
;src/scripts/gameover.c:73: set_bkg_tiles(left, i, 1, 1, &black);
	ldhl	sp,	#0
	push	hl
	ld	hl, #0x101
	push	hl
	push	bc
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/gameover.c:74: delay(5);
	push	bc
	ld	de, #0x0005
	call	_delay
	pop	bc
;src/scripts/gameover.c:72: for (int8_t i = bottom; i >= top; i--) {
	dec	b
	jr	00123$
00106$:
;src/scripts/gameover.c:76: left++;
	ldhl	sp,	#4
	inc	(hl)
	jp	00110$
00125$:
;src/scripts/gameover.c:79: }
	add	sp, #6
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
