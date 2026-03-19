;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module boss
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_hit_sfx
	.globl _hit_sfx
	.globl b_play_hit_animation
	.globl _play_hit_animation
	.globl b_show_number
	.globl _show_number
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl b_spawn_boss
	.globl _spawn_boss
	.globl b_move_boss
	.globl _move_boss
	.globl _boss_check_distance_x
	.globl _boss_check_distance_y
	.globl _boss_attack
	.globl _boss_smooth_movement
	.globl b_boss_death
	.globl _boss_death
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
;src/scripts/boss.c:8: void spawn_boss(Boss *boss) BANKED {
;	---------------------------------
; Function spawn_boss
; ---------------------------------
	b_spawn_boss	= 3
_spawn_boss::
	add	sp, #-4
;src/scripts/boss.c:9: for (uint8_t i = 0; i < 16; i++) {
	ld	c, #0x00
00123$:
	ld	a, c
	sub	a, #0x10
	jr	NC, 00101$
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x32
;src/scripts/boss.c:11: move_sprite(8+i, 0, 0);
	ld	a, c
	add	a, #0x08
	ld	e, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/boss.c:9: for (uint8_t i = 0; i < 16; i++) {
	inc	c
	jr	00123$
00101$:
;src/scripts/boss.c:14: boss->id = 1;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x01
	ld	(bc), a
;src/scripts/boss.c:15: boss->hp = 1;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
;src/scripts/boss.c:16: boss->atk = 20;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x14
;src/scripts/boss.c:17: boss->def = 23;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x17
;src/scripts/boss.c:18: boss->exp_reward = 25;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x19
;src/scripts/boss.c:19: boss->x = 72;
	ld	l, c
	ld	h, b
	inc	hl
	inc	sp
	inc	sp
	ld	(hl), #0x48
	push	hl
;src/scripts/boss.c:20: boss->y = 64;
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x40
;src/scripts/boss.c:21: boss->defeated = 0;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x00
;src/scripts/boss.c:22: set_sprite_data(98, 16, EyeBoss);
	ld	de, #_EyeBoss
	push	de
	ld	hl, #0x1062
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/boss.c:23: for (uint8_t i=0; i<16; i++) {
	ld	c, #0x00
00126$:
	ld	a, c
	sub	a, #0x10
	jr	NC, 00102$
;src/scripts/boss.c:24: set_sprite_tile(8+i, 98+i);
	ld	b, c
	ld	a, b
	add	a, #0x62
	ld	e, a
	ld	a, b
	add	a, #0x08
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/scripts/boss.c:23: for (uint8_t i=0; i<16; i++) {
	inc	c
	jr	00126$
00102$:
;src/scripts/boss.c:26: move_sprite(8, boss->x, boss->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:27: move_sprite(9, boss->x+8, boss->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:28: move_sprite(10, boss->x+16, boss->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x10
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:29: move_sprite(11, boss->x+24, boss->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x18
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:30: move_sprite(12, boss->x, boss->y+8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:31: move_sprite(13, boss->x+8, boss->y+8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:32: move_sprite(14, boss->x+16, boss->y+8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x10
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:33: move_sprite(15, boss->x+24, boss->y+8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x18
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:34: move_sprite(16, boss->x, boss->y+16);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 64)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:35: move_sprite(17, boss->x+8, boss->y+16);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 68)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:36: move_sprite(18, boss->x+16, boss->y+16);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x10
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 72)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:37: move_sprite(19, boss->x+24, boss->y+16);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x18
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 76)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:38: move_sprite(20, boss->x, boss->y+24);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 80)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:39: move_sprite(21, boss->x+8, boss->y+24);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:40: move_sprite(22, boss->x+16, boss->y+24);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x10
	ld	e, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 88)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:41: move_sprite(23, boss->x+24, boss->y+24);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x18
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 92)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/boss.c:41: move_sprite(23, boss->x+24, boss->y+24);
;src/scripts/boss.c:42: }
	add	sp, #4
	ret
;src/scripts/boss.c:44: void move_boss(Boss *boss) BANKED {
;	---------------------------------
; Function move_boss
; ---------------------------------
	b_move_boss	= 3
_move_boss::
	add	sp, #-8
;src/scripts/boss.c:45: if (boss->defeated) {
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
;src/scripts/boss.c:46: return;
	jp	NZ, 00132$
;src/scripts/boss.c:52: dx = boss_check_distance_x(boss);
	pop	de
	push	de
	call	_boss_check_distance_x
	ld	e, a
;src/scripts/boss.c:53: dy = boss_check_distance_y(boss);
	push	de
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_boss_check_distance_y
	ld	c, a
	pop	de
;src/scripts/boss.c:57: if (dx == 0 && dy == 16 || dx == 16 && dy == 16 || dx == 32 && dy == 0 || dx == 32 && dy == 16 || dx == 16 && dy == 32 || dx == 0 && dy == 32 || dx == 16 && dy == 0) {
	ld	a, c
	sub	a, #0x10
	ld	a, #0x01
	jr	Z, 00214$
	xor	a, a
00214$:
	ld	d, a
	ld	a, e
	or	a, a
	jr	NZ, 00107$
	or	a, d
	jr	NZ, 00103$
00107$:
	ld	a, e
	sub	a, #0x10
	ld	a, #0x01
	jr	Z, 00216$
	xor	a, a
00216$:
	ld	b, a
	or	a, a
	jr	Z, 00109$
	ld	a, d
	or	a, a
	jr	NZ, 00103$
00109$:
	ld	a, e
	sub	a, #0x20
	ld	a, #0x01
	jr	Z, 00218$
	xor	a, a
00218$:
	or	a, a
	jr	Z, 00111$
	inc	c
	dec	c
	jr	Z, 00103$
00111$:
	or	a, a
	jr	Z, 00113$
	ld	a, d
	or	a, a
	jr	NZ, 00103$
00113$:
	ld	a, c
	sub	a, #0x20
	ld	a, #0x01
	jr	Z, 00220$
	xor	a, a
00220$:
	inc	b
	dec	b
	jr	Z, 00115$
	or	a, a
	jr	NZ, 00103$
00115$:
	inc	e
	dec	e
	jr	NZ, 00117$
	or	a, a
	jr	NZ, 00103$
00117$:
	ld	a, b
	or	a, a
	jr	Z, 00104$
	ld	a, c
	or	a, a
	jr	NZ, 00104$
00103$:
;src/scripts/boss.c:58: boss_attack(boss);
	pop	de
	push	de
	call	_boss_attack
;src/scripts/boss.c:59: return; 
	jp	00132$
00104$:
;src/scripts/boss.c:65: int16_t diff_x = boss_check_distance_x(boss);
	pop	de
	push	de
	call	_boss_check_distance_x
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/boss.c:66: int16_t diff_y = boss_check_distance_y(boss);
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_boss_check_distance_y
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/boss.c:69: if (x > boss->x) {
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/boss.c:77: if (y > boss->y) {
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
;src/scripts/boss.c:69: if (x > boss->x) {
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
;src/scripts/boss.c:77: if (y > boss->y) {
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;src/scripts/boss.c:68: if (diff_x > diff_y) {
	ldhl	sp,	#3
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00125$
;src/scripts/boss.c:69: if (x > boss->x) {
	ld	a, c
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00119$
;src/scripts/boss.c:70: direction = 1;
	ld	e, #0x01
	jr	00126$
00119$:
;src/scripts/boss.c:73: direction = 3;
	ld	e, #0x03
	jr	00126$
00125$:
;src/scripts/boss.c:77: if (y > boss->y) {
	ld	a, b
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00122$
;src/scripts/boss.c:78: direction = 2;
	ld	e, #0x02
	jr	00126$
00122$:
;src/scripts/boss.c:81: direction = 0;
	ld	e, #0x00
00126$:
;src/scripts/boss.c:85: uint8_t next_x = boss->x;
;src/scripts/boss.c:86: uint8_t next_y = boss->y;
;src/scripts/boss.c:89: next_y -= 16;
	ldhl	sp,	#3
	ld	(hl), b
;src/scripts/boss.c:92: next_x += 16;
	ld	d, c
;src/scripts/boss.c:87: switch (direction) {
	push	de
	ld	d, #0x00
	ld	hl, #00221$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	pop	de
	jp	(hl)
00221$:
	.dw	00127$
	.dw	00128$
	.dw	00129$
	.dw	00130$
;src/scripts/boss.c:88: case 0:
00127$:
;src/scripts/boss.c:89: next_y -= 16;
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0xf0
	ld	b, a
;src/scripts/boss.c:90: break;
	jr	00131$
;src/scripts/boss.c:91: case 1:
00128$:
;src/scripts/boss.c:92: next_x += 16;
	ld	a, d
	add	a, #0x10
	ld	c, a
;src/scripts/boss.c:93: break;
	jr	00131$
;src/scripts/boss.c:94: case 2:
00129$:
;src/scripts/boss.c:95: next_y += 16;
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x10
	ld	b, a
;src/scripts/boss.c:96: break;
	jr	00131$
;src/scripts/boss.c:97: case 3:
00130$:
;src/scripts/boss.c:98: next_x -= 16;
	ld	a, d
	add	a, #0xf0
	ld	c, a
;src/scripts/boss.c:100: }
00131$:
;src/scripts/boss.c:101: boss_smooth_movement(boss, direction);
	push	bc
	ld	a, e
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_boss_smooth_movement
	pop	bc
;src/scripts/boss.c:102: boss->x = next_x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/scripts/boss.c:103: boss->y = next_y;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;src/scripts/boss.c:104: return;
00132$:
;src/scripts/boss.c:105: }
	add	sp, #8
	ret
;src/scripts/boss.c:107: uint8_t boss_check_distance_x(Boss* boss) {
;	---------------------------------
; Function boss_check_distance_x
; ---------------------------------
_boss_check_distance_x::
;src/scripts/boss.c:108: if (x > boss->x) {
	inc	de
	ld	a, (de)
	ld	c, a
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00102$
;src/scripts/boss.c:109: return(x - boss->x);
	ld	a, (hl)
	sub	a, c
	ret
00102$:
;src/scripts/boss.c:112: return(boss->x - x);
	ld	a, c
	ld	hl, #_x
	sub	a, (hl)
;src/scripts/boss.c:114: }
	ret
;src/scripts/boss.c:116: uint8_t boss_check_distance_y(Boss* boss) {
;	---------------------------------
; Function boss_check_distance_y
; ---------------------------------
_boss_check_distance_y::
;src/scripts/boss.c:117: if (y > boss->y) {
	inc	de
	inc	de
	ld	a, (de)
	ld	c, a
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00102$
;src/scripts/boss.c:118: return(y - boss->y);
	ld	a, (hl)
	sub	a, c
	ret
00102$:
;src/scripts/boss.c:121: return(boss->y - y);
	ld	a, c
	ld	hl, #_y
	sub	a, (hl)
;src/scripts/boss.c:123: }
	ret
;src/scripts/boss.c:125: void boss_attack(Boss* boss) {
;	---------------------------------
; Function boss_attack
; ---------------------------------
_boss_attack::
;src/scripts/boss.c:126: hit_sfx();
	push	de
	ld	e, #b_hit_sfx
	ld	hl, #_hit_sfx
	call	___sdcc_bcall_ehl
	pop	de
;src/scripts/boss.c:128: if (boss->atk > defense) {
	ld	hl, #0x0004
	add	hl, de
	ld	c, (hl)
	ld	hl, #_defense
	ld	a, (hl)
	sub	a, c
	jr	NC, 00102$
;src/scripts/boss.c:129: damage = boss->atk - defense;
	ld	a, c
	sub	a, (hl)
	ld	b, a
	jr	00103$
00102$:
;src/scripts/boss.c:132: damage = 1;
	ld	b, #0x01
00103$:
;src/scripts/boss.c:135: if (damage < current_hp) {
	ld	a, b
	ld	hl, #_current_hp
	sub	a, (hl)
	jr	NC, 00105$
;src/scripts/boss.c:136: current_hp -= damage;
	ld	a, (hl)
	sub	a, b
	ld	(hl), a
	jr	00106$
00105$:
;src/scripts/boss.c:139: current_hp = 0;
	xor	a, a
	ld	(#_current_hp),a
00106$:
;src/scripts/boss.c:141: play_hit_animation();
	push	bc
	ld	e, #b_play_hit_animation
	ld	hl, #_play_hit_animation
	call	___sdcc_bcall_ehl
	pop	bc
;src/scripts/boss.c:142: show_number(damage, 0, 0, 0);
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
;src/scripts/boss.c:144: }
	ret
;src/scripts/boss.c:146: void boss_smooth_movement(Boss* boss, uint8_t dir) {
;	---------------------------------
; Function boss_smooth_movement
; ---------------------------------
_boss_smooth_movement::
	add	sp, #-8
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/boss.c:149: mov_x = boss->x;
	ld	c, e
	ld	b, d
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#0
;src/scripts/boss.c:150: mov_y = boss->y;
	ld	(hl+), a
	inc	de
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/scripts/boss.c:151: while (frame < 8) {
	ld	a, #0x03
	ldhl	sp,	#6
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	(hl), #0x00
00106$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x08
	jp	NC, 00125$
;src/scripts/boss.c:152: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/boss.c:153: switch (dir) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;src/scripts/boss.c:155: mov_y-=2;
	dec	hl
	ld	c, (hl)
;src/scripts/boss.c:158: mov_x+=2;
	dec	hl
	ld	b, (hl)
;src/scripts/boss.c:153: switch (dir) {
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00149$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	jp	(hl)
00149$:
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00104$
;src/scripts/boss.c:154: case 0:
00101$:
;src/scripts/boss.c:155: mov_y-=2;
	ld	a, c
	add	a, #0xfe
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/boss.c:156: break;
	jr	00105$
;src/scripts/boss.c:157: case 1:
00102$:
;src/scripts/boss.c:158: mov_x+=2;
	ld	a, b
	add	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/boss.c:159: break;
	jr	00105$
;src/scripts/boss.c:160: case 2:
00103$:
;src/scripts/boss.c:161: mov_y+=2;
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/boss.c:162: break;
	jr	00105$
;src/scripts/boss.c:163: case 3:
00104$:
;src/scripts/boss.c:164: mov_x-=2;
	ld	a, b
	add	a, #0xfe
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/boss.c:166: }
00105$:
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 32)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/scripts/boss.c:168: move_sprite(9, mov_x+8, mov_y);
	ld	b, (hl)
	ld	a, b
	add	a, #0x08
	ldhl	sp,	#3
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl-)
	dec	hl
	ld	c, a
	ld	de, #(_shadow_OAM + 36)
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;src/scripts/boss.c:169: move_sprite(10, mov_x+16, mov_y);
	ld	a, b
	add	a, #0x10
	ld	c, a
	ld	e, c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#3
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:170: move_sprite(11, mov_x+24, mov_y);
	ld	a, b
	add	a, #0x18
	ldhl	sp,	#4
	ld	(hl), a
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 44)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;src/scripts/boss.c:171: move_sprite(12, mov_x, mov_y+8);
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
	ld	e, b
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 49)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 52)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(de), a
	inc	de
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 60)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(de), a
	inc	de
	ldhl	sp,	#4
;src/scripts/boss.c:175: move_sprite(16, mov_x, mov_y+16);
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl)
	add	a, #0x10
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	e, a
	ld	hl, #(_shadow_OAM + 64)
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 68)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 72)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 76)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 77)
	ldhl	sp,	#4
;src/scripts/boss.c:179: move_sprite(20, mov_x, mov_y+24);
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl)
	add	a, #0x18
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	de, #(_shadow_OAM + 80)
	ld	(de), a
	inc	de
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 84)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	inc	de
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	ld	de, #(_shadow_OAM + 88)
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	de, #(_shadow_OAM + 92)
	ld	a, (hl-)
	ld	(de), a
	ld	de, #(_shadow_OAM + 93)
	ld	a, (hl)
	ld	(de), a
;src/scripts/boss.c:183: frame++;
	ldhl	sp,	#7
	inc	(hl)
	jp	00106$
00125$:
;src/scripts/boss.c:185: }
	add	sp, #8
	ret
;src/scripts/boss.c:187: void boss_death(Boss* boss) BANKED {
;	---------------------------------
; Function boss_death
; ---------------------------------
	b_boss_death	= 3
_boss_death::
;src/scripts/boss.c:190: boss->hp = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;src/scripts/boss.c:191: boss->defeated = 1;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x01
;src/scripts/boss.c:192: boss->x = 0;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x00
;src/scripts/boss.c:193: boss->y = 0;
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;src/scripts/boss.c:194: for (uint8_t i = 0; i < 16; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x10
	ret	NC
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x32
;src/scripts/boss.c:196: move_sprite(8+i, 0, 0);
	ld	a, c
	add	a, #0x08
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/boss.c:194: for (uint8_t i = 0; i < 16; i++) {
	inc	c
;src/scripts/boss.c:198: }
	jr	00105$
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
