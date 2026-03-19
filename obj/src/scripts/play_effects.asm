;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module play_effects
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _delay
	.globl b_play_attack_animation
	.globl _play_attack_animation
	.globl b_play_walk_animation
	.globl _play_walk_animation
	.globl b_play_heal_animation
	.globl _play_heal_animation
	.globl b_play_hit_animation
	.globl _play_hit_animation
	.globl b_play_explosion_animation
	.globl _play_explosion_animation
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
;src/scripts/play_effects.c:8: void play_attack_animation(uint8_t dir) BANKED {
;	---------------------------------
; Function play_attack_animation
; ---------------------------------
	b_play_attack_animation	= 1
_play_attack_animation::
;src/scripts/play_effects.c:12: switch (dir) {
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
	jp	Z, 00104$
	jp	00105$
;src/scripts/play_effects.c:13: case 1:
00101$:
;src/scripts/play_effects.c:14: set_sprite_data(114, 8, MC_attack_up);
	ld	de, #_MC_attack_up
	push	de
	ld	hl, #0x872
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:15: set_sprite_data(122, 2, SwordUp);
	ld	de, #_SwordUp
	push	de
	ld	hl, #0x27a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:16: move_sprite(3, x+8, y-8);
	ld	a, (_y)
	add	a, #0xf8
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;src/scripts/play_effects.c:17: break;
	jp	00105$
;src/scripts/play_effects.c:18: case 2:
00102$:
;src/scripts/play_effects.c:19: set_sprite_data(114, 8, MC_attack_right);
	ld	de, #_MC_attack_right
	push	de
	ld	hl, #0x872
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:20: set_sprite_data(122, 2, SwordRight);
	ld	de, #_SwordRight
	push	de
	ld	hl, #0x27a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:21: move_sprite(3, x+16, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	add	a, #0x10
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;src/scripts/play_effects.c:22: break;
	jr	00105$
;src/scripts/play_effects.c:23: case 4:
00103$:
;src/scripts/play_effects.c:24: set_sprite_data(114, 8, MC_attack_down);
	ld	de, #_MC_attack_down
	push	de
	ld	hl, #0x872
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:25: set_sprite_data(122, 2, SwordDown);
	ld	de, #_SwordDown
	push	de
	ld	hl, #0x27a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:26: move_sprite(3, x, y+16);
	ld	a, (_y)
	add	a, #0x10
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;src/scripts/play_effects.c:27: break;
	jr	00105$
;src/scripts/play_effects.c:28: case 8:
00104$:
;src/scripts/play_effects.c:29: set_sprite_data(114, 8, MC_attack_left);
	ld	de, #_MC_attack_left
	push	de
	ld	hl, #0x872
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:30: set_sprite_data(122, 2, SwordLeft);
	ld	de, #_SwordLeft
	push	de
	ld	hl, #0x27a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:31: move_sprite(3, x-8, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	add	a, #0xf8
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;src/scripts/play_effects.c:33: }
00105$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7a
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x72
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x73
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x74
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x75
;src/scripts/play_effects.c:39: delay(200);
	ld	de, #0x00c8
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7b
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x76
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x77
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x78
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x79
;src/scripts/play_effects.c:45: delay(100);
	ld	de, #0x0064
;src/scripts/play_effects.c:46: return;
;src/scripts/play_effects.c:47: }
	jp	_delay
;src/scripts/play_effects.c:49: void play_walk_animation(uint8_t dir) BANKED {
;	---------------------------------
; Function play_walk_animation
; ---------------------------------
	b_play_walk_animation	= 1
_play_walk_animation::
;src/scripts/play_effects.c:50: switch (dir) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00164$
	xor	a, a
00164$:
	ld	c, a
	or	a, a
	jr	NZ, 00101$
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
;src/scripts/play_effects.c:51: case 1:
00101$:
;src/scripts/play_effects.c:52: set_sprite_data(114, 8, MC_walk_up);
	ld	de, #_MC_walk_up
	push	de
	ld	hl, #0x872
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:53: break;
	jr	00105$
;src/scripts/play_effects.c:54: case 2:
00102$:
;src/scripts/play_effects.c:55: set_sprite_data(114, 4, MC_walk_right);
	ld	de, #_MC_walk_right
	push	de
	ld	hl, #0x472
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:56: break;
	jr	00105$
;src/scripts/play_effects.c:57: case 4:
00103$:
;src/scripts/play_effects.c:58: set_sprite_data(114, 8, MC_walk_down);
	ld	de, #_MC_walk_down
	push	de
	ld	hl, #0x872
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:59: break;
	jr	00105$
;src/scripts/play_effects.c:60: case 8:
00104$:
;src/scripts/play_effects.c:61: set_sprite_data(114, 4, MC_walk_left);
	ld	de, #_MC_walk_left
	push	de
	ld	hl, #0x472
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/play_effects.c:63: }
00105$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x72
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x73
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x74
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x75
;src/scripts/play_effects.c:68: if (dir == 1 || dir == 4) {
	ld	a, c
	or	a, a
	jr	NZ, 00108$
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	ret	NZ
00108$:
;src/scripts/play_effects.c:69: walk_step = !walk_step;
	ld	hl, #_walk_step
	ld	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
;src/scripts/play_effects.c:70: if (walk_step) {
	ld	a, (hl)
	or	a, a
	ret	Z
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x76
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x77
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x78
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x79
;src/scripts/play_effects.c:74: set_sprite_tile(7, 121);
;src/scripts/play_effects.c:77: }
	ret
;src/scripts/play_effects.c:80: void play_heal_animation() BANKED {
;	---------------------------------
; Function play_heal_animation
; ---------------------------------
	b_play_heal_animation	= 1
_play_heal_animation::
;src/scripts/play_effects.c:82: set_sprite_data(124, 2, HealEff);
	ld	de, #_HealEff
	push	de
	ld	hl, #0x27c
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x7c
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x7d
;src/scripts/play_effects.c:85: move_sprite(0, x+8, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:86: move_sprite(1, x, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:87: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/play_effects.c:88: move_sprite(0, x, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:89: move_sprite(1, x+8, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:90: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/play_effects.c:91: move_sprite(0, x+8, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:92: move_sprite(1, x, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:93: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x32
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/play_effects.c:98: return;
;src/scripts/play_effects.c:99: }
	ret
;src/scripts/play_effects.c:101: void play_hit_animation() BANKED {
;	---------------------------------
; Function play_hit_animation
; ---------------------------------
	b_play_hit_animation	= 1
_play_hit_animation::
;src/scripts/play_effects.c:103: set_sprite_data(124, 3, HitEff);
	ld	de, #_HitEff
	push	de
	ld	hl, #0x37c
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x7c
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x7d
;src/scripts/play_effects.c:106: move_sprite(0, x, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:107: move_sprite(1, x+8, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:108: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x7e
;src/scripts/play_effects.c:110: move_sprite(0, x+8, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:111: move_sprite(1, x, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:112: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;src/scripts/play_effects.c:114: move_sprite(0, x, y);
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x7d
	ld	(hl-), a
	dec	hl
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:115: move_sprite(1, x+8, y+8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:116: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x32
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/play_effects.c:121: return;
;src/scripts/play_effects.c:123: }
	ret
;src/scripts/play_effects.c:125: void play_explosion_animation(uint8_t en_x, uint8_t en_y) BANKED {
;	---------------------------------
; Function play_explosion_animation
; ---------------------------------
	b_play_explosion_animation	= 1
_play_explosion_animation::
	dec	sp
;src/scripts/play_effects.c:127: set_sprite_data(114, 12, ExplosionEff);
	ld	de, #_ExplosionEff
	push	de
	ld	hl, #0xc72
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x32
;src/scripts/play_effects.c:132: move_sprite(0, en_x, en_y);
	ldhl	sp,	#8
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/play_effects.c:133: move_sprite(1, en_x+8, en_y);
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
	ld	e, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;src/scripts/play_effects.c:134: move_sprite(2, en_x, en_y+8);
	ld	a, b
	add	a, #0x08
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	e, a
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+12
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(bc), a
	inc	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;src/scripts/play_effects.c:136: wait_vbl_done();
	call	_wait_vbl_done
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x72
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x73
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x74
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x75
;src/scripts/play_effects.c:141: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x76
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x77
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x78
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x79
;src/scripts/play_effects.c:146: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x7a
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x7b
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x7c
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7d
;src/scripts/play_effects.c:151: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x32
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/play_effects.c:160: return;
;src/scripts/play_effects.c:161: }
	inc	sp
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
