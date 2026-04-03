;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
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
	add	sp, #-12
;src/scripts/boss.c:9: for (uint8_t i = 0; i < 16; i++) {
	ld	c, #0x00
00129$:
	ld	a, c
	sub	a, #0x10
	jr	NC, 00101$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x32
;src/scripts/boss.c:11: move_sprite(8+i, 0, 0);
	ld	a, c
	add	a, #0x08
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
;src/scripts/boss.c:9: for (uint8_t i = 0; i < 16; i++) {
	inc	c
	jr	00129$
00101$:
;src/scripts/boss.c:15: boss->id = 1;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
;src/scripts/boss.c:16: boss->hp = 80;
	ld	hl, #0x0003
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;src/scripts/boss.c:17: boss->atk = 15;
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/boss.c:18: boss->def = 6;
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/boss.c:19: boss->exp_reward = 80;
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/boss.c:20: boss->x = 72;
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;src/scripts/boss.c:21: boss->y = 64;
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
;src/scripts/boss.c:22: boss->defeated = 0;
	ld	hl, #0x0009
	add	hl, bc
	ld	c, l
	ld	b, h
;src/scripts/boss.c:13: switch (current_floor) {
	ld	a, (#_current_floor)
	sub	a, #0x05
	jr	Z, 00102$
	ld	a, (#_current_floor)
	sub	a, #0x0a
	jr	Z, 00103$
	ld	a, (#_current_floor)
	sub	a, #0x0f
	jp	Z, 00104$
	ld	a, (#_current_floor)
	sub	a, #0x14
	jp	Z, 00105$
	ld	a, (#_current_floor)
	sub	a, #0x19
	jp	Z, 00106$
	jp	00144$
;src/scripts/boss.c:14: case 5:
00102$:
;src/scripts/boss.c:15: boss->id = 1;
	ld	a, #0x01
	ld	(de), a
;src/scripts/boss.c:16: boss->hp = 80;
	pop	hl
	push	hl
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/boss.c:17: boss->atk = 15;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0f
;src/scripts/boss.c:18: boss->def = 6;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x06
;src/scripts/boss.c:19: boss->exp_reward = 80;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/boss.c:20: boss->x = 72;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x48
;src/scripts/boss.c:21: boss->y = 64;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x40
;src/scripts/boss.c:22: boss->defeated = 0;
	xor	a, a
	ld	(bc), a
;src/scripts/boss.c:23: set_sprite_data(98, 16, EyeBoss);
	ld	de, #_EyeBoss
	push	de
	ld	hl, #0x1062
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/boss.c:24: break;
	jp	00144$
;src/scripts/boss.c:25: case 10:
00103$:
;src/scripts/boss.c:26: boss->id = 2;
	ld	a, #0x02
	ld	(de), a
;src/scripts/boss.c:27: boss->hp = 180;
	pop	hl
	push	hl
	ld	a, #0xb4
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/boss.c:28: boss->atk = 28;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x1c
;src/scripts/boss.c:29: boss->def = 14;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0e
;src/scripts/boss.c:30: boss->exp_reward = 250;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xfa
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/boss.c:31: boss->x = 72;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x48
;src/scripts/boss.c:32: boss->y = 64;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x40
;src/scripts/boss.c:33: boss->defeated = 0;
	xor	a, a
	ld	(bc), a
;src/scripts/boss.c:34: set_sprite_data(98, 16, BossMantis);
	ld	de, #_BossMantis
	push	de
	ld	hl, #0x1062
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/boss.c:35: break;
	jp	00144$
;src/scripts/boss.c:36: case 15:
00104$:
;src/scripts/boss.c:37: boss->id = 3;
	ld	a, #0x03
	ld	(de), a
;src/scripts/boss.c:38: boss->hp = 400;
	pop	hl
	push	hl
	ld	a, #0x90
	ld	(hl+), a
	ld	(hl), #0x01
;src/scripts/boss.c:39: boss->atk = 50;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x32
;src/scripts/boss.c:40: boss->def = 30;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x1e
;src/scripts/boss.c:41: boss->exp_reward = 600;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), #0x02
;src/scripts/boss.c:42: boss->x = 72;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x48
;src/scripts/boss.c:43: boss->y = 64;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x40
;src/scripts/boss.c:44: boss->defeated = 0;
	xor	a, a
	ld	(bc), a
;src/scripts/boss.c:45: set_sprite_data(98, 16, BossOrb);
	ld	de, #_BossOrb
	push	de
	ld	hl, #0x1062
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/boss.c:46: break;
	jp	00144$
;src/scripts/boss.c:47: case 20:
00105$:
;src/scripts/boss.c:48: boss->id = 4;
	ld	a, #0x04
	ld	(de), a
;src/scripts/boss.c:49: boss->hp = 800;
	pop	hl
	push	hl
	ld	a, #0x20
	ld	(hl+), a
	ld	(hl), #0x03
;src/scripts/boss.c:50: boss->atk = 100;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x64
;src/scripts/boss.c:51: boss->def = 65;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x41
;src/scripts/boss.c:52: boss->exp_reward = 1500;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xdc
	ld	(hl+), a
	ld	(hl), #0x05
;src/scripts/boss.c:53: boss->x = 72;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x48
;src/scripts/boss.c:54: boss->y = 64;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x40
;src/scripts/boss.c:55: boss->defeated = 0;
	xor	a, a
	ld	(bc), a
;src/scripts/boss.c:56: set_sprite_data(98, 16, BossArmored);
	ld	de, #_BossArmored
	push	de
	ld	hl, #0x1062
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/boss.c:57: break;
	jr	00144$
;src/scripts/boss.c:58: case 25:
00106$:
;src/scripts/boss.c:59: boss->id = 5;
	ld	a, #0x05
	ld	(de), a
;src/scripts/boss.c:60: boss->hp = 2000;
	pop	hl
	push	hl
	ld	a, #0xd0
	ld	(hl+), a
	ld	(hl), #0x07
;src/scripts/boss.c:61: boss->atk = 220;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xdc
;src/scripts/boss.c:62: boss->def = 120;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x78
;src/scripts/boss.c:63: boss->exp_reward = 9999;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x27
;src/scripts/boss.c:64: boss->x = 72;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x48
;src/scripts/boss.c:65: boss->y = 64;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x40
;src/scripts/boss.c:66: boss->defeated = 0;
	xor	a, a
	ld	(bc), a
;src/scripts/boss.c:67: set_sprite_data(98, 16, BossDragon);
	ld	de, #_BossDragon
	push	de
	ld	hl, #0x1062
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/boss.c:77: for (uint8_t i=0; i<16; i++) {
00144$:
	ld	c, #0x00
00132$:
	ld	a, c
	sub	a, #0x10
	jr	NC, 00108$
;src/scripts/boss.c:78: set_sprite_tile(8+i, 98+i);
	ld	e, c
	ld	a, e
	add	a, #0x62
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, e
	add	a, #0x08
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
	ld	e, l
	ld	d, h
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(de), a
;src/scripts/boss.c:77: for (uint8_t i=0; i<16; i++) {
	inc	c
	jr	00132$
00108$:
;src/scripts/boss.c:80: move_sprite(8, boss->x, boss->y);
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	inc	bc
	ld	a, (bc)
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#13
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:81: move_sprite(9, boss->x+8, boss->y);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (bc)
	add	a, #0x08
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#13
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:82: move_sprite(10, boss->x+16, boss->y);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (bc)
	add	a, #0x10
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#13
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:83: move_sprite(11, boss->x+24, boss->y);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (bc)
	add	a, #0x18
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#13
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:84: move_sprite(12, boss->x, boss->y+8);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:85: move_sprite(13, boss->x+8, boss->y+8);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	add	a, #0x08
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:86: move_sprite(14, boss->x+16, boss->y+8);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	add	a, #0x10
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:87: move_sprite(15, boss->x+24, boss->y+8);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	add	a, #0x18
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:88: move_sprite(16, boss->x, boss->y+16);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	e, a
	ld	a, (bc)
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 64)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:89: move_sprite(17, boss->x+8, boss->y+16);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	e, a
	ld	a, (bc)
	add	a, #0x08
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 68)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:90: move_sprite(18, boss->x+16, boss->y+16);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	e, a
	ld	a, (bc)
	add	a, #0x10
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 72)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:91: move_sprite(19, boss->x+24, boss->y+16);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	e, a
	ld	a, (bc)
	add	a, #0x18
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 76)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:92: move_sprite(20, boss->x, boss->y+24);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	e, a
	ld	a, (bc)
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 80)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:93: move_sprite(21, boss->x+8, boss->y+24);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	e, a
	ld	a, (bc)
	add	a, #0x08
	ld	d, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/boss.c:94: move_sprite(22, boss->x+16, boss->y+24);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	d, a
	ld	a, (bc)
	add	a, #0x10
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 88)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:95: move_sprite(23, boss->x+24, boss->y+24);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x18
	ld	e, a
	ld	a, (bc)
	add	a, #0x18
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 92)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;src/scripts/boss.c:95: move_sprite(23, boss->x+24, boss->y+24);
;src/scripts/boss.c:96: }
	add	sp, #12
	ret
;src/scripts/boss.c:98: void move_boss(Boss *boss) BANKED {
;	---------------------------------
; Function move_boss
; ---------------------------------
	b_move_boss	= 3
_move_boss::
	add	sp, #-8
;src/scripts/boss.c:99: if (boss->defeated) {
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
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
;src/scripts/boss.c:100: return;
	jp	NZ, 00134$
;src/scripts/boss.c:106: dx = boss_check_distance_x(boss);
	pop	de
	push	de
	call	_boss_check_distance_x
	ld	e, a
;src/scripts/boss.c:107: dy = boss_check_distance_y(boss);
	push	de
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_boss_check_distance_y
	pop	de
;src/scripts/boss.c:111: if (dx == 0 && dy == -16 || dx == 16 && dy == -16 || dx == 32 && dy == 0 || dx == 32 && dy == 16 || dx == 16 && dy == 32 || dx == 0 && dy == 32 || dx == -16 && dy == 16 || dx == -16 && dy == 0) {
	ld	c, a
	sub	a, #0xf0
	ld	a, #0x01
	jr	Z, 00223$
	xor	a, a
00223$:
	ld	b, a
	ld	a, e
	or	a, a
	jr	NZ, 00107$
	or	a, b
	jr	NZ, 00103$
00107$:
	ld	a, e
	sub	a, #0x10
	ld	a, #0x01
	jr	Z, 00225$
	xor	a, a
00225$:
	ld	d, a
	or	a, a
	jr	Z, 00109$
	ld	a, b
	or	a, a
	jr	NZ, 00103$
00109$:
	ld	a, e
	sub	a, #0x20
	ld	a, #0x01
	jr	Z, 00227$
	xor	a, a
00227$:
	ld	l, a
	or	a, a
	jr	Z, 00111$
	ld	a, c
	or	a, a
	jr	Z, 00103$
00111$:
	ld	a, c
	sub	a, #0x10
	ld	a, #0x01
	jr	Z, 00229$
	xor	a, a
00229$:
	ld	b, a
	ld	a, l
	or	a, a
	jr	Z, 00113$
	ld	a, b
	or	a, a
	jr	NZ, 00103$
00113$:
	ld	a, c
	sub	a, #0x20
	ld	a, #0x01
	jr	Z, 00231$
	xor	a, a
00231$:
	inc	d
	dec	d
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
	ld	a, e
	sub	a, #0xf0
	ld	a, #0x01
	jr	Z, 00233$
	xor	a, a
00233$:
	or	a, a
	jr	Z, 00119$
	inc	b
	dec	b
	jr	NZ, 00103$
00119$:
	or	a, a
	jr	Z, 00104$
	ld	a, c
	or	a, a
	jr	NZ, 00104$
00103$:
;src/scripts/boss.c:112: boss_attack(boss);
	pop	de
	push	de
	call	_boss_attack
;src/scripts/boss.c:113: return;
	jp	00134$
00104$:
;src/scripts/boss.c:119: int16_t diff_x = boss_check_distance_x(boss);
	pop	de
	push	de
	call	_boss_check_distance_x
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/boss.c:120: int16_t diff_y = boss_check_distance_y(boss);
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_boss_check_distance_y
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/boss.c:123: if (x > boss->x) {
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
;src/scripts/boss.c:131: if (y > boss->y) {
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
;src/scripts/boss.c:123: if (x > boss->x) {
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
;src/scripts/boss.c:131: if (y > boss->y) {
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;src/scripts/boss.c:122: if (diff_x > diff_y) {
	ldhl	sp,	#3
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00127$
;src/scripts/boss.c:123: if (x > boss->x) {
	ld	a, c
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00121$
;src/scripts/boss.c:124: direction = 1;
	ld	e, #0x01
	jr	00128$
00121$:
;src/scripts/boss.c:127: direction = 3;
	ld	e, #0x03
	jr	00128$
00127$:
;src/scripts/boss.c:131: if (y > boss->y) {
	ld	a, b
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00124$
;src/scripts/boss.c:132: direction = 2;
	ld	e, #0x02
	jr	00128$
00124$:
;src/scripts/boss.c:135: direction = 0;
	ld	e, #0x00
00128$:
;src/scripts/boss.c:139: uint8_t next_x = boss->x;
;src/scripts/boss.c:140: uint8_t next_y = boss->y;
;src/scripts/boss.c:143: next_y -= 16;
	ldhl	sp,	#3
	ld	(hl), b
;src/scripts/boss.c:146: next_x += 16;
	ld	d, c
;src/scripts/boss.c:141: switch (direction) {
	push	de
	ld	d, #0x00
	ld	hl, #00234$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	pop	de
	jp	(hl)
00234$:
	.dw	00129$
	.dw	00130$
	.dw	00131$
	.dw	00132$
;src/scripts/boss.c:142: case 0:
00129$:
;src/scripts/boss.c:143: next_y -= 16;
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0xf0
	ld	b, a
;src/scripts/boss.c:144: break;
	jr	00133$
;src/scripts/boss.c:145: case 1:
00130$:
;src/scripts/boss.c:146: next_x += 16;
	ld	a, d
	add	a, #0x10
	ld	c, a
;src/scripts/boss.c:147: break;
	jr	00133$
;src/scripts/boss.c:148: case 2:
00131$:
;src/scripts/boss.c:149: next_y += 16;
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x10
	ld	b, a
;src/scripts/boss.c:150: break;
	jr	00133$
;src/scripts/boss.c:151: case 3:
00132$:
;src/scripts/boss.c:152: next_x -= 16;
	ld	a, d
	add	a, #0xf0
	ld	c, a
;src/scripts/boss.c:154: }
00133$:
;src/scripts/boss.c:155: boss_smooth_movement(boss, direction);
	push	bc
	ld	a, e
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_boss_smooth_movement
	pop	bc
;src/scripts/boss.c:156: boss->x = next_x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/scripts/boss.c:157: boss->y = next_y;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;src/scripts/boss.c:158: return;
00134$:
;src/scripts/boss.c:159: }
	add	sp, #8
	ret
;src/scripts/boss.c:161: uint8_t boss_check_distance_x(Boss* boss) {
;	---------------------------------
; Function boss_check_distance_x
; ---------------------------------
_boss_check_distance_x::
;src/scripts/boss.c:162: return x - boss->x;
	inc	de
	ld	a, (de)
	ld	c, a
	ld	a, (#_x)
	sub	a, c
;src/scripts/boss.c:163: }
	ret
;src/scripts/boss.c:165: uint8_t boss_check_distance_y(Boss* boss) {
;	---------------------------------
; Function boss_check_distance_y
; ---------------------------------
_boss_check_distance_y::
;src/scripts/boss.c:166: return y - boss->y;
	inc	de
	inc	de
	ld	a, (de)
	ld	c, a
	ld	a, (#_y)
	sub	a, c
;src/scripts/boss.c:167: }
	ret
;src/scripts/boss.c:169: void boss_attack(Boss* boss) {
;	---------------------------------
; Function boss_attack
; ---------------------------------
_boss_attack::
;src/scripts/boss.c:170: hit_sfx();
	push	de
	ld	e, #b_hit_sfx
	ld	hl, #_hit_sfx
	call	___sdcc_bcall_ehl
	pop	de
;src/scripts/boss.c:172: if (boss->atk > defense) {
	ld	hl, #0x0005
	add	hl, de
	ld	c, (hl)
	ld	hl, #_defense
	ld	a, (hl)
	sub	a, c
	jr	NC, 00102$
;src/scripts/boss.c:173: damage = boss->atk - defense;
	ld	a, c
	sub	a, (hl)
	ld	b, a
	jr	00103$
00102$:
;src/scripts/boss.c:176: damage = 1;
	ld	b, #0x01
00103$:
;src/scripts/boss.c:179: if (damage < current_hp) {
	ld	a, b
	ld	hl, #_current_hp
	sub	a, (hl)
	jr	NC, 00105$
;src/scripts/boss.c:180: current_hp -= damage;
	ld	a, (hl)
	sub	a, b
	ld	(hl), a
	jr	00106$
00105$:
;src/scripts/boss.c:183: current_hp = 0;
	xor	a, a
	ld	(#_current_hp),a
00106$:
;src/scripts/boss.c:185: play_hit_animation();
	push	bc
	ld	e, #b_play_hit_animation
	ld	hl, #_play_hit_animation
	call	___sdcc_bcall_ehl
	pop	bc
;src/scripts/boss.c:186: show_number(damage, 0, 0, 0);
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
;src/scripts/boss.c:188: }
	ret
;src/scripts/boss.c:190: void boss_smooth_movement(Boss* boss, uint8_t dir) {
;	---------------------------------
; Function boss_smooth_movement
; ---------------------------------
_boss_smooth_movement::
	add	sp, #-8
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/boss.c:193: mov_x = boss->x;
	ld	c, e
	ld	b, d
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#0
;src/scripts/boss.c:194: mov_y = boss->y;
	ld	(hl+), a
	inc	de
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/scripts/boss.c:195: while (frame < 8) {
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
;src/scripts/boss.c:196: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/boss.c:197: switch (dir) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;src/scripts/boss.c:199: mov_y-=2;
	dec	hl
	ld	c, (hl)
;src/scripts/boss.c:202: mov_x+=2;
	dec	hl
	ld	b, (hl)
;src/scripts/boss.c:197: switch (dir) {
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
;src/scripts/boss.c:198: case 0:
00101$:
;src/scripts/boss.c:199: mov_y-=2;
	ld	a, c
	add	a, #0xfe
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/boss.c:200: break;
	jr	00105$
;src/scripts/boss.c:201: case 1:
00102$:
;src/scripts/boss.c:202: mov_x+=2;
	ld	a, b
	add	a, #0x02
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/boss.c:203: break;
	jr	00105$
;src/scripts/boss.c:204: case 2:
00103$:
;src/scripts/boss.c:205: mov_y+=2;
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/boss.c:206: break;
	jr	00105$
;src/scripts/boss.c:207: case 3:
00104$:
;src/scripts/boss.c:208: mov_x-=2;
	ld	a, b
	add	a, #0xfe
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/boss.c:210: }
00105$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 32)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/scripts/boss.c:212: move_sprite(9, mov_x+8, mov_y);
	ld	b, (hl)
	ld	a, b
	add	a, #0x08
	ldhl	sp,	#3
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl-)
	dec	hl
	ld	c, a
	ld	de, #(_shadow_OAM + 36)
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;src/scripts/boss.c:213: move_sprite(10, mov_x+16, mov_y);
	ld	a, b
	add	a, #0x10
	ld	c, a
	ld	e, c
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#3
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/scripts/boss.c:214: move_sprite(11, mov_x+24, mov_y);
	ld	a, b
	add	a, #0x18
	ldhl	sp,	#4
	ld	(hl), a
	ld	b, (hl)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 44)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;src/scripts/boss.c:215: move_sprite(12, mov_x, mov_y+8);
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
	ld	e, b
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 49)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 52)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(de), a
	inc	de
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 60)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(de), a
	inc	de
	ldhl	sp,	#4
;src/scripts/boss.c:219: move_sprite(16, mov_x, mov_y+16);
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl)
	add	a, #0x10
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	e, a
	ld	hl, #(_shadow_OAM + 64)
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 68)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	push	hl
	ldhl	sp,	#5
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 72)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 76)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 77)
	ldhl	sp,	#4
;src/scripts/boss.c:223: move_sprite(20, mov_x, mov_y+24);
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl)
	add	a, #0x18
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	de, #(_shadow_OAM + 80)
	ld	(de), a
	inc	de
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #(_shadow_OAM + 84)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	inc	de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	ld	de, #(_shadow_OAM + 88)
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	de, #(_shadow_OAM + 92)
	ld	a, (hl-)
	ld	(de), a
	ld	de, #(_shadow_OAM + 93)
	ld	a, (hl)
	ld	(de), a
;src/scripts/boss.c:227: frame++;
	ldhl	sp,	#7
	inc	(hl)
	jp	00106$
00125$:
;src/scripts/boss.c:229: }
	add	sp, #8
	ret
;src/scripts/boss.c:231: void boss_death(Boss* boss) BANKED {
;	---------------------------------
; Function boss_death
; ---------------------------------
	b_boss_death	= 3
_boss_death::
;src/scripts/boss.c:234: boss->hp = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	inc	de
	ld	(de), a
;src/scripts/boss.c:235: boss->defeated = 1;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x01
;src/scripts/boss.c:236: boss->x = 0;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x00
;src/scripts/boss.c:237: boss->y = 0;
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;src/scripts/boss.c:238: for (uint8_t i = 0; i < 16; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x10
	ret	NC
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x32
;src/scripts/boss.c:240: move_sprite(8+i, 0, 0);
	ld	a, c
	add	a, #0x08
	ld	b, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/boss.c:238: for (uint8_t i = 0; i < 16; i++) {
	inc	c
;src/scripts/boss.c:242: }
	jr	00105$
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
