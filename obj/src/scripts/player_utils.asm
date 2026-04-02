;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module player_utils
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_check_enemy
	.globl _check_enemy
	.globl b_set_character_sprite
	.globl _set_character_sprite
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
;src/scripts/player_utils.c:8: uint8_t check_enemy(uint8_t dir) BANKED {
;	---------------------------------
; Function check_enemy
; ---------------------------------
	b_check_enemy	= 3
_check_enemy::
	add	sp, #-15
;src/scripts/player_utils.c:9: for (int i=0; i<2; i++) {
	ldhl	sp,	#12
	ld	(hl), #0x00
	ldhl	sp,	#21
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00360$
	xor	a, a
00360$:
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00362$
	xor	a, a
00362$:
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00364$
	xor	a, a
00364$:
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x08
	ld	a, #0x01
	jr	Z, 00366$
	xor	a, a
00366$:
	ldhl	sp,	#3
	ld	(hl), a
	xor	a, a
	ldhl	sp,	#13
	ld	(hl+), a
	ld	(hl), a
00145$:
;src/scripts/player_utils.c:14: if (x == enemy_x && y - enemy_y == 16 && y > enemy_y) {
	ld	a, (#_y)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/player_utils.c:19: if (y == enemy_y && enemy_x - x == 16 && enemy_x > x) {
	ld	a, (#_x)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/player_utils.c:9: for (int i=0; i<2; i++) {
	ldhl	sp,	#13
	ld	a, (hl+)
	sub	a, #0x02
	ld	a, (hl)
	sbc	a, #0x00
	jp	NC, 00122$
;src/scripts/player_utils.c:10: uint8_t enemy_x = current_enemies[i].x;
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_current_enemies
	add	hl, de
	ld	a, (hl)
	push	hl
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
;src/scripts/player_utils.c:11: uint8_t enemy_y = current_enemies[i].y;
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
;src/scripts/player_utils.c:14: if (x == enemy_x && y - enemy_y == 16 && y > enemy_y) {
	ld	a, (#_x)
	ldhl	sp,	#8
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00368$
	xor	a, a
00368$:
	ld	e, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	(hl+), a
;src/scripts/player_utils.c:15: return i+1;
	xor	a, a
	ld	(hl+), a
	inc	(hl)
;src/scripts/player_utils.c:12: switch (dir) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
;src/scripts/player_utils.c:19: if (y == enemy_y && enemy_x - x == 16 && enemy_x > x) {
	ld	a, (#_y)
	ldhl	sp,	#9
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00370$
	xor	a, a
00370$:
	ld	d, a
	ldhl	sp,	#8
	ld	c, (hl)
	ld	b, #0x00
;src/scripts/player_utils.c:12: switch (dir) {
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
	jp	00146$
;src/scripts/player_utils.c:13: case 1:
00101$:
;src/scripts/player_utils.c:14: if (x == enemy_x && y - enemy_y == 16 && y > enemy_y) {
	ld	a, e
	or	a, a
	jp	Z, 00146$
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	a, e
	sub	a, #0x10
	or	a, b
	jp	NZ, 00146$
	ldhl	sp,	#9
	ld	a, (hl)
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00146$
;src/scripts/player_utils.c:15: return i+1;
	ldhl	sp,	#12
	ld	a, (hl)
	jp	00147$
;src/scripts/player_utils.c:18: case 2:
00106$:
;src/scripts/player_utils.c:19: if (y == enemy_y && enemy_x - x == 16 && enemy_x > x) {
	ld	a, d
	or	a, a
	jr	Z, 00146$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	a, e
	sub	a, #0x10
	or	a, b
	jr	NZ, 00146$
	ld	a, (#_x)
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NC, 00146$
;src/scripts/player_utils.c:20: return i+1;
	ldhl	sp,	#12
	ld	a, (hl)
	jp	00147$
;src/scripts/player_utils.c:23: case 4:
00111$:
;src/scripts/player_utils.c:24: if (x == enemy_x && enemy_y - y == 16 && enemy_y > y) {
	ld	a, e
	or	a, a
	jr	Z, 00146$
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	a, e
	sub	a, #0x10
	or	a, b
	jr	NZ, 00146$
	ld	a, (#_y)
	ldhl	sp,	#9
	sub	a, (hl)
	jr	NC, 00146$
;src/scripts/player_utils.c:25: return i+1;
	ldhl	sp,	#12
	ld	a, (hl)
	jp	00147$
;src/scripts/player_utils.c:28: case 8:
00116$:
;src/scripts/player_utils.c:29: if (y == enemy_y && x - enemy_x == 16 && x > enemy_x) {
	ld	a, d
	or	a, a
	jr	Z, 00146$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	a, e
	sub	a, #0x10
	or	a, b
	jr	NZ, 00146$
	inc	hl
	ld	a, (hl)
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00146$
;src/scripts/player_utils.c:30: return i+1;
	ldhl	sp,	#12
	ld	a, (hl)
	jp	00147$
;src/scripts/player_utils.c:33: }
00146$:
;src/scripts/player_utils.c:9: for (int i=0; i<2; i++) {
	ldhl	sp,	#13
	inc	(hl)
	ldhl	sp,	#13
	ld	a, (hl-)
	ld	(hl), a
	jp	00145$
00122$:
;src/scripts/player_utils.c:35: switch(dir) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00123$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00128$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	NZ, 00133$
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	NZ, 00138$
	jp	00143$
;src/scripts/player_utils.c:36: case 1:
00123$:
;src/scripts/player_utils.c:37: if ((x == boss.x || x == boss.x+16) && y == boss.y+32) {
	ld	a, (#(_boss + 1) + 0)
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (#_x)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	Z, 00127$
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jp	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jp	NZ, 00143$
00127$:
	ld	a, (#(_boss + 2) + 0)
	ldhl	sp,#14
	ld	(hl), a
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jp	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jp	NZ, 00143$
;src/scripts/player_utils.c:38: return 3;
	ld	a, #0x03
	jp	00147$
;src/scripts/player_utils.c:41: case 2:
00128$:
;src/scripts/player_utils.c:42: if (x == boss.x - 16 && (y == boss.y || y == boss.y + 16)) {
	ld	a, (#(_boss + 1) + 0)
	ldhl	sp,#14
	ld	(hl), a
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jp	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jp	NZ, 00143$
	ld	a, (#(_boss + 2) + 0)
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (#_y)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	Z, 00129$
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jp	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jp	NZ, 00143$
00129$:
;src/scripts/player_utils.c:43: return 3;
	ld	a, #0x03
	jp	00147$
;src/scripts/player_utils.c:46: case 4:
00133$:
;src/scripts/player_utils.c:47: if ((x == boss.x || x == boss.x + 16) && y == boss.y - 16) {
	ld	a, (#(_boss + 1) + 0)
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (#_x)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	Z, 00137$
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jp	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jp	NZ, 00143$
00137$:
	ld	a, (#(_boss + 2) + 0)
	ldhl	sp,#14
	ld	(hl), a
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jr	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jr	NZ, 00143$
;src/scripts/player_utils.c:48: return 3;
	ld	a, #0x03
	jr	00147$
;src/scripts/player_utils.c:51: case 8:
00138$:
;src/scripts/player_utils.c:52: if (x == boss.x + 32 && (y == boss.y || y == boss.y+16)) {
	ld	a, (#(_boss + 1) + 0)
	ldhl	sp,#14
	ld	(hl), a
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jr	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jr	NZ, 00143$
	ld	a, (#(_boss + 2) + 0)
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (#_y)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	Z, 00139$
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#13
	sub	a, (hl)
	jr	NZ, 00143$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jr	NZ, 00143$
00139$:
;src/scripts/player_utils.c:53: return 3;
	ld	a, #0x03
	jr	00147$
;src/scripts/player_utils.c:56: }
00143$:
;src/scripts/player_utils.c:57: return 0;
	xor	a, a
00147$:
;src/scripts/player_utils.c:58: }
	add	sp, #15
	ret
;src/scripts/player_utils.c:60: void set_character_sprite(uint8_t dir) BANKED {
;	---------------------------------
; Function set_character_sprite
; ---------------------------------
	b_set_character_sprite	= 3
_set_character_sprite::
;src/scripts/player_utils.c:61: switch (dir) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	Z, 00101$
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00102$
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00103$
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00104$
	jr	00105$
;src/scripts/player_utils.c:62: case 1:
00101$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;src/scripts/player_utils.c:67: break;
	jr	00105$
;src/scripts/player_utils.c:68: case 2:
00102$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x0b
;src/scripts/player_utils.c:73: break;
	jr	00105$
;src/scripts/player_utils.c:74: case 4:
00103$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;src/scripts/player_utils.c:79: break;
	jr	00105$
;src/scripts/player_utils.c:80: case 8:
00104$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x0d
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x0e
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x0f
;src/scripts/player_utils.c:86: }
00105$:
;src/scripts/player_utils.c:87: if (y == 144) {
	ld	a, (#_y)
	sub	a, #0x90
	jr	NZ, 00107$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x32
;src/scripts/player_utils.c:89: set_sprite_tile(7, 50);
00107$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x32
;src/scripts/player_utils.c:91: set_sprite_tile(3, 50);
;src/scripts/player_utils.c:92: }
	ret
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
