;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module enemy
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_hit_sfx
	.globl _hit_sfx
	.globl b_play_hit_animation
	.globl _play_hit_animation
	.globl _spawn_drop
	.globl b_show_number
	.globl _show_number
	.globl _check_terrain
	.globl _wait_vbl_done
	.globl _move_enemy
	.globl _set_enemy_position
	.globl _set_enemy_stats
	.globl _check_distance_x
	.globl _check_distance_y
	.globl _enemy_attack
	.globl _enemy_death
	.globl _enemy_smooth_movement
	.globl _is_enemy_at
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
	.area _CODE
;src/scripts/enemy.c:4: void move_enemy(Enemy *e) {
;	---------------------------------
; Function move_enemy
; ---------------------------------
_move_enemy::
	add	sp, #-13
	ldhl	sp,	#11
	ld	a, e
	ld	(hl+), a
;src/scripts/enemy.c:6: if (!e->alive) {
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
;src/scripts/enemy.c:7: return;
	jp	Z, 00153$
;src/scripts/enemy.c:11: dx = check_distance_x(e);
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_check_distance_x
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/enemy.c:12: dy = check_distance_y(e);
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_check_distance_y
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/enemy.c:16: if (dx == 16 && dy == 0 || dx == 0 && dy == 16) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x10
	ld	a, #0x01
	jr	Z, 00300$
	xor	a, a
00300$:
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/enemy.c:18: e->targeting = 1;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
;src/scripts/enemy.c:16: if (dx == 16 && dy == 0 || dx == 0 && dy == 16) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00103$
00107$:
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
	inc	hl
	ld	a, (hl)
	sub	a, #0x10
	jr	NZ, 00104$
00103$:
;src/scripts/enemy.c:17: enemy_attack(e);
	push	bc
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_attack
	pop	bc
;src/scripts/enemy.c:18: e->targeting = 1;
	ld	a, #0x01
	ld	(bc), a
;src/scripts/enemy.c:19: return; 
	jp	00153$
00104$:
;src/scripts/enemy.c:22: uint8_t moved = 0;
	ldhl	sp,	#3
	ld	(hl), #0x00
;src/scripts/enemy.c:23: if (e->targeting) {
	ld	a, (bc)
	ld	c, a
;src/scripts/enemy.c:37: if (y > e->y) {
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
;src/scripts/enemy.c:23: if (e->targeting) {
	ld	a, c
	or	a, a
	jp	Z, 00172$
;src/scripts/enemy.c:25: int16_t diff_x = check_distance_x(e);
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_check_distance_x
	ld	c, a
;src/scripts/enemy.c:26: int16_t diff_y = check_distance_y(e);
	push	bc
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_check_distance_y
	pop	bc
	ld	b, a
;src/scripts/enemy.c:29: if (x > e->x) {
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/scripts/enemy.c:37: if (y > e->y) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/enemy.c:28: if (diff_x > diff_y) {
	ld	a, b
	sub	a, c
	jr	NC, 00115$
;src/scripts/enemy.c:29: if (x > e->x) {
	dec	hl
	ld	a, (hl)
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00109$
;src/scripts/enemy.c:30: direction = 1;
	ldhl	sp,	#8
	ld	(hl), #0x01
	jr	00116$
00109$:
;src/scripts/enemy.c:33: direction = 3;
	ldhl	sp,	#8
	ld	(hl), #0x03
	jr	00116$
00115$:
;src/scripts/enemy.c:37: if (y > e->y) {
	ldhl	sp,	#7
	ld	a, (hl)
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00112$
;src/scripts/enemy.c:38: direction = 2;
	ldhl	sp,	#8
	ld	(hl), #0x02
	jr	00116$
00112$:
;src/scripts/enemy.c:41: direction = 0;
	ldhl	sp,	#8
	ld	(hl), #0x00
00116$:
;src/scripts/enemy.c:45: uint8_t next_x = e->x;
	ldhl	sp,	#6
	ld	c, (hl)
;src/scripts/enemy.c:46: uint8_t next_y = e->y;
	inc	hl
	ld	b, (hl)
;src/scripts/enemy.c:49: next_y -= 16;
;src/scripts/enemy.c:52: next_x += 16;
;src/scripts/enemy.c:47: switch (direction) {
	inc	hl
	ld	e, b
	ld	d, c
	push	de
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00303$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	pop	de
	jp	(hl)
00303$:
	.dw	00117$
	.dw	00118$
	.dw	00119$
	.dw	00120$
;src/scripts/enemy.c:48: case 0:
00117$:
;src/scripts/enemy.c:49: next_y -= 16;
	ld	a, e
	add	a, #0xf0
	ld	b, a
;src/scripts/enemy.c:50: break;
	jr	00121$
;src/scripts/enemy.c:51: case 1:
00118$:
;src/scripts/enemy.c:52: next_x += 16;
	ld	a, d
	add	a, #0x10
	ld	c, a
;src/scripts/enemy.c:53: break;
	jr	00121$
;src/scripts/enemy.c:54: case 2:
00119$:
;src/scripts/enemy.c:55: next_y += 16;
	ld	a, e
	add	a, #0x10
	ld	b, a
;src/scripts/enemy.c:56: break;
	jr	00121$
;src/scripts/enemy.c:57: case 3:
00120$:
;src/scripts/enemy.c:58: next_x -= 16;
	ld	a, d
	add	a, #0xf0
	ld	c, a
;src/scripts/enemy.c:60: }
00121$:
;src/scripts/enemy.c:61: if (check_terrain(next_x + 8, next_y + 8) && !is_enemy_at(next_x, next_y, e)) {
	ld	a, b
	add	a, #0x08
	ld	e, a
	ld	a, c
	add	a, #0x08
	push	bc
	call	_check_terrain
	pop	bc
	or	a, a
	jp	Z, 00153$
	push	bc
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	e, b
	ld	a, c
	call	_is_enemy_at
	pop	bc
	or	a, a
	jp	NZ, 00153$
;src/scripts/enemy.c:62: enemy_smooth_movement(e, direction);
	push	bc
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#13
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_enemy_smooth_movement
	pop	bc
;src/scripts/enemy.c:63: e->x = next_x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/scripts/enemy.c:64: e->y = next_y;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;src/scripts/enemy.c:66: return;
	jp	00153$
;src/scripts/enemy.c:68: while (!moved){
00172$:
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
00145$:
	ldhl	sp,	#3
	ld	a, (hl)
;src/scripts/enemy.c:69: moved = 0;
	or	a, a
	jp	NZ, 00147$
	ld	(hl), a
;src/scripts/enemy.c:70: uint8_t next_x = e->x;
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
;src/scripts/enemy.c:71: uint8_t next_y = e->y;
	ld	(hl+), a
	ld	a, (bc)
;src/scripts/enemy.c:72: uint8_t direction = (uint8_t)(DIV_REG & 3);
	ld	(hl+), a
	ldh	a, (_DIV_REG + 0)
	and	a, #0x03
;src/scripts/enemy.c:76: next_y -= 16;
	ld	(hl-), a
	ld	e, (hl)
;src/scripts/enemy.c:81: next_x += 16;
	dec	hl
	ld	d, (hl)
;src/scripts/enemy.c:73: switch (direction) {
	inc	hl
	inc	hl
	push	de
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00304$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	pop	de
	jp	(hl)
00304$:
	.dw	00127$
	.dw	00130$
	.dw	00133$
	.dw	00136$
;src/scripts/enemy.c:74: case 0:
00127$:
;src/scripts/enemy.c:75: if (next_y > 32) {
	ld	a, #0x20
	ldhl	sp,	#9
	sub	a, (hl)
	jr	NC, 00139$
;src/scripts/enemy.c:76: next_y -= 16;
	ld	a, e
	add	a, #0xf0
	ld	(hl), a
;src/scripts/enemy.c:78: break;
	jr	00139$
;src/scripts/enemy.c:79: case 1:
00130$:
;src/scripts/enemy.c:80: if (next_x < 144) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x90
	jr	NC, 00139$
;src/scripts/enemy.c:81: next_x += 16;
	ld	a, d
	add	a, #0x10
	ld	(hl), a
;src/scripts/enemy.c:83: break;
	jr	00139$
;src/scripts/enemy.c:84: case 2:
00133$:
;src/scripts/enemy.c:85: if (next_y < 128) {
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x80
	jr	NC, 00139$
;src/scripts/enemy.c:86: next_y += 16;
	ld	a, e
	add	a, #0x10
	ld	(hl), a
;src/scripts/enemy.c:88: break;
	jr	00139$
;src/scripts/enemy.c:89: case 3:
00136$:
;src/scripts/enemy.c:90: if (next_x > 24) {
	ld	a, #0x18
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NC, 00139$
;src/scripts/enemy.c:91: next_x -= 16;
	ld	a, d
	add	a, #0xf0
	ld	(hl), a
;src/scripts/enemy.c:94: }
00139$:
;src/scripts/enemy.c:95: if ((next_x != e->x || next_y != e->y) && check_terrain(next_x + 8, next_y + 8) && !is_enemy_at(next_x, next_y, e)) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	sub	a, (hl)
	jr	NZ, 00143$
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	sub	a, (hl)
	jp	Z, 00145$
00143$:
	ldhl	sp,	#9
	ld	a, (hl-)
	add	a, #0x08
	ld	e, a
	ld	a, (hl)
	add	a, #0x08
	push	bc
	call	_check_terrain
	pop	bc
	or	a, a
	jp	Z, 00145$
	push	bc
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#13
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	call	_is_enemy_at
	pop	bc
	or	a, a
	jp	NZ, 00145$
;src/scripts/enemy.c:96: enemy_smooth_movement(e, direction);
	push	bc
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_enemy_smooth_movement
	pop	bc
;src/scripts/enemy.c:97: e->x = next_x;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;src/scripts/enemy.c:98: e->y = next_y;
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;src/scripts/enemy.c:99: moved = 1;
	ldhl	sp,	#3
	ld	(hl), #0x01
	jp	00145$
00147$:
;src/scripts/enemy.c:104: if (dx == 16 && dx == 0 || dx == 0 && dy == 16) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00152$
	dec	hl
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00148$
00152$:
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00153$
	inc	hl
	ld	a, (hl)
	sub	a, #0x10
	jr	NZ, 00153$
00148$:
;src/scripts/enemy.c:105: e->targeting = 1;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	a, #0x01
	ld	(hl), a
00153$:
;src/scripts/enemy.c:107: }
	add	sp, #13
	ret
;src/scripts/enemy.c:109: void set_enemy_position(Enemy *e, uint8_t x, uint8_t y) {
;	---------------------------------
; Function set_enemy_position
; ---------------------------------
_set_enemy_position::
	add	sp, #-6
	ld	c, e
	ld	b, d
;src/scripts/enemy.c:110: e->x = x;
	inc	sp
	inc	sp
	push	bc
	pop	hl
	push	hl
	ld	(hl), a
;src/scripts/enemy.c:111: e->y = y;
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;src/scripts/enemy.c:112: move_sprite(e->sprite_id, e->x, e->y);
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/scripts/enemy.c:113: move_sprite(e->sprite_id+1, e->x+8, e->y);
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	ld	d, a
	inc	d
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/enemy.c:114: move_sprite(e->sprite_id+2, e->x, e->y+8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/scripts/enemy.c:115: move_sprite(e->sprite_id+3, e->x+8, e->y+8);
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	add	a, #0x03
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	l, d
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/enemy.c:115: move_sprite(e->sprite_id+3, e->x+8, e->y+8);
;src/scripts/enemy.c:116: }
	add	sp, #6
	pop	hl
	inc	sp
	jp	(hl)
;src/scripts/enemy.c:120: void set_enemy_stats(Enemy *e, uint8_t type, uint8_t sprite_id) {
;	---------------------------------
; Function set_enemy_stats
; ---------------------------------
_set_enemy_stats::
	add	sp, #-7
	ld	c, e
	ld	b, d
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/enemy.c:123: e->hp = 10;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;src/scripts/enemy.c:124: e->atk = 7;
	ld	hl, #0x0003
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;src/scripts/enemy.c:125: e->def = 1;
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/enemy.c:126: e->type = 1;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/enemy.c:127: e->exp_reward = 1;
	ld	hl, #0x0009
	add	hl, bc
;src/scripts/enemy.c:121: switch (type) {
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	dec	a
	pop	hl
	jr	Z, 00101$
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x02
	pop	hl
	jr	Z, 00102$
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x03
	pop	hl
	jr	Z, 00103$
	jr	00104$
;src/scripts/enemy.c:122: case 1:
00101$:
;src/scripts/enemy.c:123: e->hp = 10;
	ld	a, #0x0a
	ld	(de), a
;src/scripts/enemy.c:124: e->atk = 7;
	push	hl
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x07
;src/scripts/enemy.c:125: e->def = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;src/scripts/enemy.c:126: e->type = 1;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	pop	hl
;src/scripts/enemy.c:127: e->exp_reward = 1;
	ld	(hl), #0x01
;src/scripts/enemy.c:128: break;
	jr	00104$
;src/scripts/enemy.c:129: case 2:
00102$:
;src/scripts/enemy.c:130: e->hp = 18;
	ld	a, #0x12
	ld	(de), a
;src/scripts/enemy.c:131: e->atk = 11;
	push	hl
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0b
;src/scripts/enemy.c:132: e->def = 6;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x06
;src/scripts/enemy.c:133: e->type = 2;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
	pop	hl
;src/scripts/enemy.c:134: e->exp_reward = 3;
	ld	(hl), #0x03
;src/scripts/enemy.c:135: break;
	jr	00104$
;src/scripts/enemy.c:136: case 3:
00103$:
;src/scripts/enemy.c:137: e->hp = 25;
	ld	a, #0x19
	ld	(de), a
;src/scripts/enemy.c:138: e->atk = 15;
	push	hl
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0f
;src/scripts/enemy.c:139: e->def = 14;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0e
;src/scripts/enemy.c:140: e->type = 3;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
	pop	hl
;src/scripts/enemy.c:141: e->exp_reward = 5;
	ld	(hl), #0x05
;src/scripts/enemy.c:143: }
00104$:
;src/scripts/enemy.c:144: e->sprite_id = sprite_id;
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;src/scripts/enemy.c:145: e->alive = 1; // cambiato
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x01
;src/scripts/enemy.c:146: e->targeting = 0;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;src/scripts/enemy.c:147: }
	add	sp, #7
	pop	hl
	inc	sp
	jp	(hl)
;src/scripts/enemy.c:149: uint8_t check_distance_x(Enemy* e) {
;	---------------------------------
; Function check_distance_x
; ---------------------------------
_check_distance_x::
;src/scripts/enemy.c:150: if (x > e->x) {
	ld	a, (de)
	ld	c, a
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00102$
;src/scripts/enemy.c:151: return(x - e->x);
	ld	a, (hl)
	sub	a, c
	ret
00102$:
;src/scripts/enemy.c:154: return(e->x - x);
	ld	a, c
	ld	hl, #_x
	sub	a, (hl)
;src/scripts/enemy.c:156: }
	ret
;src/scripts/enemy.c:158: uint8_t check_distance_y(Enemy* e) {
;	---------------------------------
; Function check_distance_y
; ---------------------------------
_check_distance_y::
;src/scripts/enemy.c:159: if (y > e->y) {
	inc	de
	ld	a, (de)
	ld	c, a
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00102$
;src/scripts/enemy.c:160: return(y - e->y);
	ld	a, (hl)
	sub	a, c
	ret
00102$:
;src/scripts/enemy.c:163: return(e->y - y);
	ld	a, c
	ld	hl, #_y
	sub	a, (hl)
;src/scripts/enemy.c:165: }
	ret
;src/scripts/enemy.c:167: void enemy_attack(Enemy* e) {
;	---------------------------------
; Function enemy_attack
; ---------------------------------
_enemy_attack::
;src/scripts/enemy.c:168: hit_sfx();
	push	de
	ld	e, #b_hit_sfx
	ld	hl, #_hit_sfx
	call	___sdcc_bcall_ehl
	pop	de
;src/scripts/enemy.c:170: if (e->atk > defense) {
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	c, a
	ld	hl, #_defense
	ld	a, (hl)
	sub	a, c
	jr	NC, 00102$
;src/scripts/enemy.c:171: damage = e->atk - defense;
	ld	a, c
	sub	a, (hl)
	ld	b, a
	jr	00103$
00102$:
;src/scripts/enemy.c:174: damage = 1;
	ld	b, #0x01
00103$:
;src/scripts/enemy.c:177: if (damage < current_hp) {
	ld	a, b
	ld	hl, #_current_hp
	sub	a, (hl)
	jr	NC, 00105$
;src/scripts/enemy.c:178: current_hp -= damage;
	ld	a, (hl)
	sub	a, b
	ld	(hl), a
	jr	00106$
00105$:
;src/scripts/enemy.c:181: current_hp = 0;
	xor	a, a
	ld	(#_current_hp),a
00106$:
;src/scripts/enemy.c:183: play_hit_animation();
	push	bc
	ld	e, #b_play_hit_animation
	ld	hl, #_play_hit_animation
	call	___sdcc_bcall_ehl
	pop	bc
;src/scripts/enemy.c:184: show_number(damage, 0, 0, 0);
	xor	a, a
	rrca
	push	af
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	e, #b_show_number
	ld	hl, #_show_number
	call	___sdcc_bcall_ehl
	add	sp, #4
;src/scripts/enemy.c:186: }
	ret
;src/scripts/enemy.c:188: void enemy_death(Enemy* e) {
;	---------------------------------
; Function enemy_death
; ---------------------------------
_enemy_death::
	dec	sp
	dec	sp
	ld	c, e
	ld	b, d
;src/scripts/enemy.c:189: spawn_drop(e->x, e->y);
	ld	l, c
	ld	h, b
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	l, c
	ld	h, b
	ld	d, (hl)
	push	hl
	push	bc
	ld	e, a
	ld	a, d
	call	_spawn_drop
	pop	bc
	pop	hl
;src/scripts/enemy.c:190: e->hp = 0;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;src/scripts/enemy.c:191: e->alive = 0;
	ld	a, c
	add	a, #0x06
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	xor	a, a
	ld	(de), a
;src/scripts/enemy.c:192: e->x = 0;
	ld	(hl), #0x00
;src/scripts/enemy.c:193: e->y = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
;src/scripts/enemy.c:194: move_sprite(e->sprite_id, 0, 0);
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/enemy.c:195: move_sprite(e->sprite_id + 1, 0, 0);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/enemy.c:196: move_sprite(e->sprite_id + 2, 0, 0);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/enemy.c:197: move_sprite(e->sprite_id + 3, 0, 0);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/enemy.c:198: set_sprite_tile(e->sprite_id, 50);
	ld	a, (bc)
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x32
;src/scripts/enemy.c:199: set_sprite_tile(e->sprite_id+1, 50);
	ld	a, (bc)
	ld	e, a
	inc	e
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x32
;src/scripts/enemy.c:200: set_sprite_tile(e->sprite_id+2, 50);
	ld	a, (bc)
	add	a, #0x02
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x32
;src/scripts/enemy.c:201: set_sprite_tile(e->sprite_id+3, 50);
	ld	a, (bc)
	add	a, #0x03
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x32
;src/scripts/enemy.c:201: set_sprite_tile(e->sprite_id+3, 50);
;src/scripts/enemy.c:204: }
	inc	sp
	inc	sp
	ret
;src/scripts/enemy.c:207: void enemy_smooth_movement(Enemy* e, uint8_t dir) {
;	---------------------------------
; Function enemy_smooth_movement
; ---------------------------------
_enemy_smooth_movement::
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/enemy.c:210: mov_x = e->x;
	ld	a, (de)
	ldhl	sp,	#0
;src/scripts/enemy.c:211: mov_y = e->y;
	ld	(hl+), a
	ld	c, e
	ld	b, d
	inc	bc
	ld	a, (bc)
	ld	(hl), a
;src/scripts/enemy.c:212: while (frame < 8) {
	ld	a, #0x03
	ldhl	sp,	#6
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#2
	ld	(hl), a
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, #0x00
00106$:
	ld	a, e
	sub	a, #0x08
	jp	NC, 00113$
;src/scripts/enemy.c:213: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/enemy.c:214: switch (dir) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;src/scripts/enemy.c:216: mov_y-=2;
	dec	hl
;src/scripts/enemy.c:219: mov_x+=2;
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl)
	ldhl	sp,	#5
;src/scripts/enemy.c:214: switch (dir) {
	ld	(hl+), a
	push	de
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00137$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	pop	de
	jp	(hl)
00137$:
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00104$
;src/scripts/enemy.c:215: case 0:
00101$:
;src/scripts/enemy.c:216: mov_y-=2;
	ld	a, d
	add	a, #0xfe
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/enemy.c:217: break;
	jr	00105$
;src/scripts/enemy.c:218: case 1:
00102$:
;src/scripts/enemy.c:219: mov_x+=2;
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/enemy.c:220: break;
	jr	00105$
;src/scripts/enemy.c:221: case 2:
00103$:
;src/scripts/enemy.c:222: mov_y+=2;
	ld	a, d
	add	a, #0x02
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/enemy.c:223: break;
	jr	00105$
;src/scripts/enemy.c:224: case 3:
00104$:
;src/scripts/enemy.c:225: mov_x-=2;
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, #0xfe
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/enemy.c:227: }
00105$:
;src/scripts/enemy.c:228: move_sprite(e->sprite_id, mov_x, mov_y);
	ld	a, (bc)
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#3
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;src/scripts/enemy.c:229: move_sprite(e->sprite_id+1, mov_x+8, mov_y);
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	a, (bc)
	ld	d, a
	inc	d
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#3
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;src/scripts/enemy.c:230: move_sprite(e->sprite_id+2, mov_x, mov_y+8);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ld	a, (bc)
	add	a, #0x02
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;src/scripts/enemy.c:231: move_sprite(e->sprite_id+3, mov_x+8, mov_y+8);
	ld	a, (bc)
	add	a, #0x03
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#6
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;src/scripts/enemy.c:232: frame++;
	inc	e
	jp	00106$
00113$:
;src/scripts/enemy.c:234: }
	add	sp, #7
	ret
;src/scripts/enemy.c:236: uint8_t is_enemy_at(uint8_t tx, uint8_t ty, Enemy *self) {
;	---------------------------------
; Function is_enemy_at
; ---------------------------------
_is_enemy_at::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
;src/scripts/enemy.c:237: for (uint8_t i = 0; i < 2; i++) {
	ld	b, #0x00
00109$:
	ld	a, b
	sub	a, #0x02
	jr	NC, 00107$
;src/scripts/enemy.c:238: Enemy* other = &current_enemies[i];
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_current_enemies
	add	hl, de
	ld	e, l
	ld	d, h
;src/scripts/enemy.c:239: if (other->alive && other != self) {
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00155$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00110$
00155$:
;src/scripts/enemy.c:240: if (other->x == tx && other->y == ty) {
	ld	a, (de)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NZ, 00110$
	inc	de
	ld	a, (de)
	sub	a, c
	jr	NZ, 00110$
;src/scripts/enemy.c:241: return 1;
	ld	a, #0x01
	jr	00111$
00110$:
;src/scripts/enemy.c:237: for (uint8_t i = 0; i < 2; i++) {
	inc	b
	jr	00109$
00107$:
;src/scripts/enemy.c:245: return 0;
	xor	a, a
00111$:
;src/scripts/enemy.c:246: }
	inc	sp
	pop	hl
	pop	bc
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
