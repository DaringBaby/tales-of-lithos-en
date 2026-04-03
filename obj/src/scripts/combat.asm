;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module combat
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_play_ending
	.globl _play_ending
	.globl _set_textbox
	.globl b_set_room_tiles
	.globl _set_room_tiles
	.globl b_save_game
	.globl _save_game
	.globl _check_terrain
	.globl b_play_explosion_animation
	.globl _play_explosion_animation
	.globl b_play_heal_animation
	.globl _play_heal_animation
	.globl b_set_character_sprite
	.globl _set_character_sprite
	.globl b_enemy_death_sfx
	.globl _enemy_death_sfx
	.globl b_hit_sfx
	.globl _hit_sfx
	.globl b_arrow_sfx
	.globl _arrow_sfx
	.globl _play_song
	.globl b_show_number
	.globl _show_number
	.globl _enemy_death
	.globl b_boss_death
	.globl _boss_death
	.globl _set_bkg_tiles
	.globl _wait_vbl_done
	.globl _reset
	.globl _player_attack
	.globl _shoot_arrow
	.globl _heal_player
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
;src/scripts/combat.c:3: void player_attack(uint8_t wpn, uint8_t index) {
;	---------------------------------
; Function player_attack
; ---------------------------------
_player_attack::
	add	sp, #-10
	ld	c, a
	ldhl	sp,	#9
	ld	(hl), e
;src/scripts/combat.c:4: hit_sfx();
	push	bc
	ld	e, #b_hit_sfx
	ld	hl, #_hit_sfx
	call	___sdcc_bcall_ehl
	pop	bc
;src/scripts/combat.c:7: if (wpn == 0) { // spada
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;src/scripts/combat.c:8: atk_stat = attack;
	ld	a, (#_attack)
	ldhl	sp,	#8
	ld	(hl), a
	jr	00103$
00102$:
;src/scripts/combat.c:11: atk_stat = arrow_damage;
	ld	a, (#_arrow_damage)
	ldhl	sp,	#8
	ld	(hl), a
00103$:
;src/scripts/combat.c:13: if (index == 2) {
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ, 00116$
;src/scripts/combat.c:14: if (atk_stat > boss.def) {
	ld	hl, #_boss + 6
	ld	c, (hl)
	ld	a, c
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NC, 00105$
;src/scripts/combat.c:15: damage = atk_stat - boss.def;
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	jr	00106$
00105$:
;src/scripts/combat.c:18: damage = 1;
	ldhl	sp,	#8
	ld	(hl), #0x01
00106$:
;src/scripts/combat.c:20: show_number(damage, 0, 1, index);
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	b, a
	ld	c, #0x01
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_show_number
	ld	hl, #_show_number
	call	___sdcc_bcall_ehl
	add	sp, #4
;src/scripts/combat.c:21: if (damage < boss.hp) {
	ld	de, #(_boss + 3)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl-)
	dec	hl
	ld	c, a
	ld	b, #0x00
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00108$
;src/scripts/combat.c:22: boss.hp -= damage;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
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
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_boss + 3)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00109$
00108$:
;src/scripts/combat.c:25: boss.hp = 0;
	ld	hl, #(_boss + 3)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00109$:
;src/scripts/combat.c:27: if (boss.hp == 0) {
	ld	hl, #(_boss + 3)
	ld	a, (hl+)
	or	a, (hl)
	jp	NZ, 00125$
;src/scripts/combat.c:28: enemy_death_sfx();
	ld	e, #b_enemy_death_sfx
	ld	hl, #_enemy_death_sfx
	call	___sdcc_bcall_ehl
;src/scripts/combat.c:29: uint8_t b_x = boss.x;
	ld	hl, #_boss + 1
	ld	c, (hl)
;src/scripts/combat.c:30: uint8_t b_y = boss.y;
	ld	hl, #_boss + 2
	ld	b, (hl)
;src/scripts/combat.c:31: boss_death(&boss);
	push	bc
	ld	de, #_boss
	push	de
	ld	e, #b_boss_death
	ld	hl, #_boss_death
	call	___sdcc_bcall_ehl
	pop	hl
;src/scripts/combat.c:32: set_character_sprite(last_direction);
	ld	a, (_last_direction)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	pop	bc
;src/scripts/combat.c:33: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/combat.c:34: play_explosion_animation(b_x, b_y);
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	e, #b_play_explosion_animation
	ld	hl, #_play_explosion_animation
	call	___sdcc_bcall_ehl
	pop	hl
;src/scripts/combat.c:35: boss_floor_defeated = 1;
	ld	hl, #_boss_floor_defeated
	ld	(hl), #0x01
;src/scripts/combat.c:36: boss_battle = 0;
	xor	a, a
	ld	(#_boss_battle),a
;src/scripts/combat.c:37: enemies_defeated++;
	ld	hl, #_enemies_defeated
	inc	(hl)
;src/scripts/combat.c:38: experience += boss.exp_reward;
	ld	hl, #(_boss + 7)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_experience
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;src/scripts/combat.c:39: obt_exp += boss.exp_reward;
	ld	a, (#(_boss + 7) + 0)
	ld	hl, #_obt_exp
	add	a, (hl)
	ld	(hl), a
;src/scripts/combat.c:40: minerals+=2;
	ld	a, (_minerals)
	add	a, #0x02
	ld	(#_minerals),a
;src/scripts/combat.c:41: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;src/scripts/combat.c:42: if (current_floor != 25) {
	ld	a, (#_current_floor)
	sub	a, #0x19
	jr	Z, 00111$
;src/scripts/combat.c:43: play_song(1);
	ld	a, #0x01
	call	_play_song
;src/scripts/combat.c:44: set_textbox(3);
	ld	a, #0x03
	call	_set_textbox
;src/scripts/combat.c:45: uint8_t door = doors[player_coords.x][player_coords.y];
	ld	bc, #_doors+0
	ld	a, (#_player_coords + 0)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #_player_coords + 1
	ld	a, (bc)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
;src/scripts/combat.c:47: set_room_tiles(door, room_ptr, player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	c, (hl)
	push	bc
	ldhl	sp,	#2
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	push	de
	inc	sp
	ld	e, #b_set_room_tiles
	ld	hl, #_set_room_tiles
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/combat.c:48: set_bkg_tiles(2, 2, 2, 2, stairs);
	ld	de, #_stairs
	push	de
	ld	hl, #0x202
	push	hl
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/combat.c:49: play_song(3);
	ld	a, #0x03
	call	_play_song
	jp	00125$
00111$:
;src/scripts/combat.c:52: play_song(7);
	ld	a, #0x07
	call	_play_song
;src/scripts/combat.c:53: play_ending();
	ld	e, #b_play_ending
	ld	hl, #_play_ending
	call	___sdcc_bcall_ehl
;src/scripts/combat.c:54: save_game();
	ld	e, #b_save_game
	ld	hl, #_save_game
	call	___sdcc_bcall_ehl
;src/scripts/combat.c:55: reset();
	call	_reset
;src/scripts/combat.c:58: return;
	jp	00125$
00116$:
;src/scripts/combat.c:62: if (atk_stat > current_enemies[index].def) {
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc, #_current_enemies
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
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NC, 00118$
;src/scripts/combat.c:63: damage = atk_stat - current_enemies[index].def;
	ld	a, (hl)
	sub	a, c
	ldhl	sp,	#4
	ld	(hl), a
	jr	00119$
00118$:
;src/scripts/combat.c:66: damage = 1;
	ldhl	sp,	#4
	ld	(hl), #0x01
00119$:
;src/scripts/combat.c:68: show_number(damage, 0, 1, index);
	ldhl	sp,	#9
	ld	h, (hl)
	ld	l, #0x01
	push	hl
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_show_number
	ld	hl, #_show_number
	call	___sdcc_bcall_ehl
	add	sp, #4
;src/scripts/combat.c:69: if (damage < current_enemies[index].hp) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#7
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00121$
;src/scripts/combat.c:70: current_enemies[index].hp -= damage;
	ldhl	sp,	#4
	ld	c, (hl)
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	b, (hl)
	ld	e, #0x00
	sub	a, c
	ld	c, a
	ld	a, b
	sbc	a, e
	ld	b, a
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00122$
00121$:
;src/scripts/combat.c:73: current_enemies[index].hp = 0;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/combat.c:74: current_enemies[index].alive = 0;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
00122$:
;src/scripts/combat.c:76: if (current_enemies[index].hp == 0) {
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	or	a, (hl)
	jp	NZ, 00125$
;src/scripts/combat.c:77: uint8_t e_x = current_enemies[index].x;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/combat.c:78: uint8_t e_y = current_enemies[index].y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
;src/scripts/combat.c:79: set_character_sprite(last_direction);
	ld	a, (_last_direction)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;src/scripts/combat.c:80: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/combat.c:81: enemy_death(&current_enemies[index]);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_death
;src/scripts/combat.c:82: enemy_death_sfx();
	ld	e, #b_enemy_death_sfx
	ld	hl, #_enemy_death_sfx
	call	___sdcc_bcall_ehl
;src/scripts/combat.c:83: play_explosion_animation(e_x, e_y);
	ldhl	sp,	#8
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl)
	ld	c, a
	push	bc
	ld	e, #b_play_explosion_animation
	ld	hl, #_play_explosion_animation
	call	___sdcc_bcall_ehl
	pop	hl
;src/scripts/combat.c:84: enemies_defeated++;
	ld	hl, #_enemies_defeated
	inc	(hl)
;src/scripts/combat.c:85: experience += current_enemies[index].exp_reward;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_experience
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_experience
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/scripts/combat.c:86: obt_exp += current_enemies[index].exp_reward;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_obt_exp
	add	a, (hl)
	ld	(hl), a
00125$:
;src/scripts/combat.c:88: }
	add	sp, #10
	ret
;src/scripts/combat.c:92: void shoot_arrow() {
;	---------------------------------
; Function shoot_arrow
; ---------------------------------
_shoot_arrow::
	add	sp, #-3
;src/scripts/combat.c:93: arrow_sfx();
	ld	e, #b_arrow_sfx
	ld	hl, #_arrow_sfx
	call	___sdcc_bcall_ehl
;src/scripts/combat.c:94: uint8_t arrow_x = x;
	ld	a, (_x)
	ld	c, a
;src/scripts/combat.c:95: uint8_t arrow_y = y;
	ld	a, (_y)
	ld	b, a
;src/scripts/combat.c:96: switch (last_direction) {
	ld	a, (#_last_direction)
	dec	a
	jr	Z, 00101$
	ld	a, (#_last_direction)
	sub	a, #0x02
	jr	Z, 00102$
	ld	a, (#_last_direction)
	sub	a, #0x04
	jr	Z, 00103$
	ld	a, (#_last_direction)
	sub	a, #0x08
	jr	Z, 00104$
	jr	00127$
;src/scripts/combat.c:97: case 1:
00101$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/combat.c:100: break;
	jr	00127$
;src/scripts/combat.c:101: case 2:
00102$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x51
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/combat.c:104: break;
	jr	00127$
;src/scripts/combat.c:105: case 4:
00103$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x40
;src/scripts/combat.c:108: break;
	jr	00127$
;src/scripts/combat.c:109: case 8:
00104$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x51
	ld	(hl+), a
	ld	(hl), #0x20
;src/scripts/combat.c:114: while (1) {
00127$:
;src/scripts/combat.c:115: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/combat.c:118: arrow_y-=2;
	ld	e, b
;src/scripts/combat.c:116: switch (last_direction) {
	ld	a, (#_last_direction)
	dec	a
	jr	Z, 00106$
;src/scripts/combat.c:121: arrow_x+=2;
	ld	d, c
;src/scripts/combat.c:116: switch (last_direction) {
	ld	a, (#_last_direction)
	sub	a, #0x02
	jr	Z, 00107$
	ld	a, (#_last_direction)
	sub	a, #0x04
	jr	Z, 00108$
	ld	a, (#_last_direction)
	sub	a, #0x08
	jr	Z, 00109$
	jr	00110$
;src/scripts/combat.c:117: case 1:
00106$:
;src/scripts/combat.c:118: arrow_y-=2;
	ld	b, e
	dec	b
	dec	b
;src/scripts/combat.c:119: break;
	jr	00110$
;src/scripts/combat.c:120: case 2:
00107$:
;src/scripts/combat.c:121: arrow_x+=2;
	ld	c, d
	inc	c
	inc	c
;src/scripts/combat.c:122: break;
	jr	00110$
;src/scripts/combat.c:123: case 4:
00108$:
;src/scripts/combat.c:124: arrow_y+=2;
	ld	b, e
	inc	b
	inc	b
;src/scripts/combat.c:125: break;
	jr	00110$
;src/scripts/combat.c:126: case 8:
00109$:
;src/scripts/combat.c:127: arrow_x-=2;
	ld	c, d
	dec	c
	dec	c
;src/scripts/combat.c:129: }
00110$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 156)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/combat.c:131: if (arrow_x < 1 || arrow_x > 168 || arrow_y > 144 || arrow_y < 8 || !check_terrain(arrow_x, arrow_y)) { // pulu
	ld	a, c
	sub	a, #0x01
	jr	C, 00111$
	ld	a, #0xa8
	sub	a, c
	jr	C, 00111$
	ld	a, #0x90
	sub	a, b
	jr	C, 00111$
	ld	a, b
	sub	a, #0x08
	jr	C, 00111$
	push	bc
	ld	e, b
	ld	a, c
	call	_check_terrain
	pop	bc
	or	a, a
	jr	NZ, 00112$
00111$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
	ld	(hl), #0x32
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	dec	hl
	dec	hl
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;src/scripts/combat.c:134: return;
	jp	00147$
00112$:
;src/scripts/combat.c:136: for (int i=0; i<2; i++) {
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
00145$:
	ldhl	sp,	#1
	ld	a, (hl+)
	sub	a, #0x02
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00120$
;src/scripts/combat.c:137: uint8_t enemy_x = current_enemies[i].x;
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #_current_enemies
	add	hl, de
;src/scripts/combat.c:138: uint8_t enemy_y = current_enemies[i].y;
	ld	a, (hl+)
	ld	e, (hl)
;src/scripts/combat.c:139: if (arrow_x == enemy_x && arrow_y == enemy_y) {
	sub	a, c
	jr	NZ, 00146$
	ld	a, b
	sub	a, e
	jr	NZ, 00146$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;src/scripts/combat.c:141: move_sprite(39, x, y);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x32
	ld	(hl-), a
	dec	hl
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/combat.c:142: player_attack(1, i); // arrow atk
	ldhl	sp,	#0
	ld	e, (hl)
	ld	a, #0x01
	call	_player_attack
;src/scripts/combat.c:143: return;
	jr	00147$
00146$:
;src/scripts/combat.c:136: for (int i=0; i<2; i++) {
	ldhl	sp,	#1
	inc	(hl)
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(hl), a
	jr	00145$
00120$:
;src/scripts/combat.c:146: if ((arrow_x == boss.x || arrow_x == boss.x+16) && (arrow_y == boss.y || arrow_y == boss.y + 16)) {
	ld	a, (#(_boss + 1) + 0)
	cp	a, c
	jr	Z, 00125$
	ld	h, #0x00
	ld	l, a
	ld	de, #0x0010
	add	hl, de
	ld	e, c
	ld	d, #0x00
	ld	a, l
	sub	a, e
	jp	NZ, 00127$
	ld	a, h
	sub	a, d
	jp	NZ, 00127$
00125$:
	ld	a, (#(_boss + 2) + 0)
	cp	a, b
	jr	Z, 00121$
	ld	h, #0x00
	ld	l, a
	ld	de, #0x0010
	add	hl, de
	ld	e, b
	ld	d, #0x00
	ld	a, l
	sub	a, e
	jp	NZ, 00127$
	ld	a, h
	sub	a, d
	jp	NZ, 00127$
00121$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;src/scripts/combat.c:148: move_sprite(39, x, y);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x32
	ld	(hl-), a
	dec	hl
	ld	a, (_y)
	ld	c, a
	ld	a, (_x)
	ld	b, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/combat.c:149: player_attack(1, 2);
	ld	e, #0x02
	ld	a, #0x01
	call	_player_attack
;src/scripts/combat.c:150: return;
00147$:
;src/scripts/combat.c:153: }
	add	sp, #3
	ret
;src/scripts/combat.c:155: void heal_player() {
;	---------------------------------
; Function heal_player
; ---------------------------------
_heal_player::
;src/scripts/combat.c:156: uint8_t heal = heal_quantity;
	ld	a, (_heal_quantity)
	ld	b, a
;src/scripts/combat.c:157: current_hp += heal;
	ld	hl, #_current_hp
	ld	a, (hl)
	add	a, b
;src/scripts/combat.c:158: if (current_hp >= max_hp) {
	ld	(hl), a
	ld	hl, #_max_hp
	sub	a, (hl)
	jr	C, 00102$
;src/scripts/combat.c:159: heal = heal_quantity - (current_hp - max_hp);
	ld	a, (#_current_hp)
	ld	hl, #_max_hp
	sub	a, (hl)
	ld	c, a
	ld	a, (#_heal_quantity)
	sub	a, c
	ld	b, a
;src/scripts/combat.c:160: current_hp = max_hp;
	ld	a, (#_max_hp)
	ld	(#_current_hp),a
00102$:
;src/scripts/combat.c:162: play_heal_animation();
	push	bc
	ld	e, #b_play_heal_animation
	ld	hl, #_play_heal_animation
	call	___sdcc_bcall_ehl
	pop	bc
;src/scripts/combat.c:163: show_number(heal, 1, 0, 0);
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	e, #b_show_number
	ld	hl, #_show_number
	call	___sdcc_bcall_ehl
	add	sp, #4
;src/scripts/combat.c:164: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
