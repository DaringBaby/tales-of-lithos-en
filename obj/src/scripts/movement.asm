;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module movement
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_save_game
	.globl _save_game
	.globl _check_drops
	.globl _player_attack
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl b_game_over
	.globl _game_over
	.globl _clear_drops
	.globl _go_next_floor
	.globl _go_into_dungeon
	.globl _hide_camp_sprites
	.globl _set_camp_map
	.globl b_play_walk_animation
	.globl _play_walk_animation
	.globl b_play_attack_animation
	.globl _play_attack_animation
	.globl b_set_character_sprite
	.globl _set_character_sprite
	.globl b_check_enemy
	.globl _check_enemy
	.globl b_death_sfx
	.globl _death_sfx
	.globl b_stairs_sfx
	.globl _stairs_sfx
	.globl _play_song
	.globl _enemy_death
	.globl _move_enemy
	.globl b_boss_death
	.globl _boss_death
	.globl b_move_boss
	.globl _move_boss
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _check_input_movement
	.globl _smooth_movement
	.globl _move_character
	.globl _check_terrain
	.globl _is_sprite_at
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
;src/scripts/movement.c:4: void check_input_movement() {
;	---------------------------------
; Function check_input_movement
; ---------------------------------
_check_input_movement::
	dec	sp
;src/scripts/movement.c:5: uint8_t moved = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;src/scripts/movement.c:7: if (joypad() & J_DOWN) {
	call	_joypad
	bit	3, a
	jp	Z, 00137$
;src/scripts/movement.c:8: last_direction = 4;
	ld	hl, #_last_direction
	ld	(hl), #0x04
;src/scripts/movement.c:9: set_character_sprite(4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;src/scripts/movement.c:10: if (check_terrain(x + 8, y + 24) && !is_sprite_at(x, y + 16)) {
	ld	a, (_y)
	add	a, #0x18
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	call	_check_terrain
	or	a, a
	jp	Z, 00138$
	ld	a, (_y)
	add	a, #0x10
	ld	e, a
	ld	a, (_x)
	call	_is_sprite_at
	or	a, a
	jp	NZ, 00138$
;src/scripts/movement.c:11: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;src/scripts/movement.c:12: if (!check_enemy(4)) {
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00102$
;src/scripts/movement.c:13: smooth_movement(4);
	ld	a, #0x04
	call	_smooth_movement
	jp	00138$
00102$:
;src/scripts/movement.c:16: uint8_t enemy_idx = check_enemy(4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;src/scripts/movement.c:17: play_attack_animation(4);
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;src/scripts/movement.c:18: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;src/scripts/movement.c:19: set_character_sprite(4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	jp	00138$
00137$:
;src/scripts/movement.c:23: else if (joypad() & J_UP) {
	call	_joypad
	bit	2, a
	jp	Z, 00134$
;src/scripts/movement.c:24: set_character_sprite(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;src/scripts/movement.c:25: if (check_terrain(x + 8, y - 8) && !is_sprite_at(x, y - 16)) {
	ld	a, (_y)
	add	a, #0xf8
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	call	_check_terrain
	or	a, a
	jp	Z, 00138$
	ld	a, (_y)
	add	a, #0xf0
	ld	e, a
	ld	a, (_x)
	call	_is_sprite_at
	or	a, a
	jp	NZ, 00138$
;src/scripts/movement.c:26: last_direction = 1;
	ld	hl, #_last_direction
	ld	(hl), #0x01
;src/scripts/movement.c:27: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;src/scripts/movement.c:28: if (!check_enemy(1)) {
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00108$
;src/scripts/movement.c:29: smooth_movement(1);
	ld	a, #0x01
	call	_smooth_movement
	jr	00109$
00108$:
;src/scripts/movement.c:32: uint8_t enemy_idx = check_enemy(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;src/scripts/movement.c:33: play_attack_animation(1);
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;src/scripts/movement.c:34: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;src/scripts/movement.c:35: set_character_sprite(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
00109$:
;src/scripts/movement.c:37: if (current_location == 0 && y <= 40) {
	ld	a, (#_current_location)
	or	a, a
	jp	NZ, 00138$
	ld	a, #0x28
	ld	hl, #_y
	sub	a, (hl)
	jp	C, 00138$
;src/scripts/movement.c:38: current_location = 1;
	ld	hl, #_current_location
	ld	(hl), #0x01
;src/scripts/movement.c:39: current_floor = 1;
	ld	hl, #_current_floor
	ld	(hl), #0x01
;src/scripts/movement.c:40: obt_mythril = 0;
;src/scripts/movement.c:41: obt_exp = 0;
	xor	a, a
	ld	(#_obt_mythril), a
	ld	(#_obt_exp),a
;src/scripts/movement.c:42: boss.defeated = 1;
	ld	hl, #(_boss + 9)
	ld	(hl), #0x01
;src/scripts/movement.c:43: hide_camp_sprites();
	call	_hide_camp_sprites
;src/scripts/movement.c:44: save_game();
	ld	e, #b_save_game
	ld	hl, #_save_game
	call	___sdcc_bcall_ehl
;src/scripts/movement.c:45: go_into_dungeon();
	call	_go_into_dungeon
;src/scripts/movement.c:46: play_song(3);
	ld	a, #0x03
	call	_play_song
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;src/scripts/movement.c:51: x = 120;
	ld	hl, #_x
	ld	(hl), #0x78
;src/scripts/movement.c:52: y = 112;
	ld	hl, #_y
	ld	(hl), #0x70
;src/scripts/movement.c:53: return;
	jp	00155$
00134$:
;src/scripts/movement.c:57: else if (joypad() & J_LEFT) {
	call	_joypad
	bit	1, a
	jp	Z, 00131$
;src/scripts/movement.c:58: last_direction = 8;
	ld	hl, #_last_direction
	ld	(hl), #0x08
;src/scripts/movement.c:59: set_character_sprite(8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;src/scripts/movement.c:60: if (check_terrain(x - 8, y + 8) && !is_sprite_at(x - 16, y)) {
	ld	a, (_y)
	add	a, #0x08
	ld	e, a
	ld	a, (_x)
	add	a, #0xf8
	call	_check_terrain
	or	a, a
	jp	Z, 00138$
	ld	a, (_x)
	add	a, #0xf0
	ld	hl, #_y
	ld	e, (hl)
	call	_is_sprite_at
	or	a, a
	jp	NZ, 00138$
;src/scripts/movement.c:61: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;src/scripts/movement.c:62: if (!check_enemy(8)) {
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00117$
;src/scripts/movement.c:63: smooth_movement(8);
	ld	a, #0x08
	call	_smooth_movement
	jp	00138$
00117$:
;src/scripts/movement.c:66: uint8_t enemy_idx = check_enemy(8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;src/scripts/movement.c:67: play_attack_animation(8);
	push	de
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;src/scripts/movement.c:68: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;src/scripts/movement.c:69: set_character_sprite(8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	jp	00138$
00131$:
;src/scripts/movement.c:73: else if (joypad() & J_RIGHT) {
	call	_joypad
	rrca
	jr	NC, 00138$
;src/scripts/movement.c:74: set_character_sprite(2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;src/scripts/movement.c:75: last_direction = 2;
	ld	hl, #_last_direction
	ld	(hl), #0x02
;src/scripts/movement.c:76: if (check_terrain(x + 24, y + 8) && !is_sprite_at(x + 16, y)) {
	ld	a, (_y)
	add	a, #0x08
	ld	e, a
	ld	a, (_x)
	add	a, #0x18
	call	_check_terrain
	or	a, a
	jr	Z, 00138$
	ld	a, (_x)
	add	a, #0x10
	ld	hl, #_y
	ld	e, (hl)
	call	_is_sprite_at
	or	a, a
	jr	NZ, 00138$
;src/scripts/movement.c:77: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;src/scripts/movement.c:78: if (!check_enemy(2)) {
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00123$
;src/scripts/movement.c:79: smooth_movement(2);
	ld	a, #0x02
	call	_smooth_movement
	jr	00138$
00123$:
;src/scripts/movement.c:82: uint8_t enemy_idx = check_enemy(2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;src/scripts/movement.c:83: play_attack_animation(2);
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;src/scripts/movement.c:84: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;src/scripts/movement.c:85: set_character_sprite(2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
00138$:
;src/scripts/movement.c:90: if (moved) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	Z, 00155$
;src/scripts/movement.c:92: check_drops(x, y);
	ld	a, (_y)
	ld	e, a
	ld	a, (_x)
	call	_check_drops
;src/scripts/movement.c:93: delay(20);
	ld	de, #0x0014
	call	_delay
;src/scripts/movement.c:94: if (current_location == 1) {
	ld	a, (#_current_location)
	dec	a
	jp	NZ, 00155$
;src/scripts/movement.c:95: move_enemy(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_move_enemy
;src/scripts/movement.c:96: move_enemy(&current_enemies[1]);
	ld	de, #(_current_enemies + 12)
	call	_move_enemy
;src/scripts/movement.c:97: move_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_move_boss
	ld	hl, #_move_boss
	call	___sdcc_bcall_ehl
	pop	hl
;src/scripts/movement.c:99: if (dungeon[player_coords.x][player_coords.y] == 'E' && x <= 32 && y <= 40 && !boss_battle) {
	ld	de, #_dungeon+0
	ld	bc, #_player_coords+0
	ld	a, (bc)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	bc
	ld	a, (bc)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	sub	a, #0x45
	jr	NZ, 00140$
	ld	a, #0x20
	ld	hl, #_x
	sub	a, (hl)
	jr	C, 00140$
	ld	a, #0x28
	ld	hl, #_y
	sub	a, (hl)
	jr	C, 00140$
	ld	a, (#_boss_battle)
	or	a, a
	jr	NZ, 00140$
;src/scripts/movement.c:100: stairs_sfx();
	ld	e, #b_stairs_sfx
	ld	hl, #_stairs_sfx
	call	___sdcc_bcall_ehl
;src/scripts/movement.c:101: go_next_floor();
	call	_go_next_floor
00140$:
;src/scripts/movement.c:104: if (current_hp == 0) {
	ld	a, (#_current_hp)
	or	a, a
	jr	NZ, 00155$
;src/scripts/movement.c:105: death_sfx();
	ld	e, #b_death_sfx
	ld	hl, #_death_sfx
	call	___sdcc_bcall_ehl
;src/scripts/movement.c:106: delay(100);
	ld	de, #0x0064
	call	_delay
;src/scripts/movement.c:107: play_song(0);
	xor	a, a
	call	_play_song
;src/scripts/movement.c:108: game_over();
	ld	e, #b_game_over
	ld	hl, #_game_over
	call	___sdcc_bcall_ehl
;src/scripts/movement.c:109: enemy_death(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_enemy_death
;src/scripts/movement.c:110: enemy_death(&current_enemies[1]);
	ld	de, #(_current_enemies + 12)
	call	_enemy_death
;src/scripts/movement.c:111: boss_death(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_boss_death
	ld	hl, #_boss_death
	call	___sdcc_bcall_ehl
	pop	hl
;src/scripts/movement.c:112: clear_drops();
	call	_clear_drops
;src/scripts/movement.c:113: boss_floor_defeated = 0;
;src/scripts/movement.c:114: key_obtained = 0;
	xor	a, a
	ld	(#_boss_floor_defeated), a
	ld	(#_key_obtained),a
;src/scripts/movement.c:115: boss_battle = 0;
	xor	a, a
	ld	(#_boss_battle),a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/movement.c:117: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;src/scripts/movement.c:118: set_camp_map();
	call	_set_camp_map
;src/scripts/movement.c:119: x = 120;
	ld	hl, #_x
	ld	(hl), #0x78
;src/scripts/movement.c:120: y = 112;
	ld	hl, #_y
	ld	(hl), #0x70
;src/scripts/movement.c:121: move_character();
	call	_move_character
;src/scripts/movement.c:122: delay(100);
	ld	de, #0x0064
	call	_delay
;src/scripts/movement.c:123: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/scripts/movement.c:124: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00155$:
;src/scripts/movement.c:129: }
	inc	sp
	ret
;src/scripts/movement.c:132: void smooth_movement(uint8_t dir) {
;	---------------------------------
; Function smooth_movement
; ---------------------------------
_smooth_movement::
	add	sp, #-11
	ldhl	sp,	#9
	ld	(hl), a
;src/scripts/movement.c:134: mov_x = x;
	ld	a, (#_x)
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/movement.c:135: mov_y = y;
	ld	a, (#_y)
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/movement.c:137: switch (dir) {
	ldhl	sp,	#9
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00263$
	xor	a, a
00263$:
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00265$
	xor	a, a
00265$:
	ld	e, a
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00267$
	xor	a, a
00267$:
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x08
	ld	a, #0x01
	jr	Z, 00269$
	xor	a, a
00269$:
	ld	c, a
;src/scripts/movement.c:139: y-=16;
	ld	a, (_y)
	ld	d, a
;src/scripts/movement.c:137: switch (dir) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
;src/scripts/movement.c:142: x+=16;
	ld	a, (_x)
;src/scripts/movement.c:137: switch (dir) {
	inc	e
	dec	e
	jr	NZ, 00102$
	inc	b
	dec	b
	jr	NZ, 00103$
	inc	c
	dec	c
	jr	NZ, 00104$
	jr	00105$
;src/scripts/movement.c:138: case 1:
00101$:
;src/scripts/movement.c:139: y-=16;
	ld	a, d
	add	a, #0xf0
	ld	(#_y),a
;src/scripts/movement.c:140: break;
	jr	00105$
;src/scripts/movement.c:141: case 2:
00102$:
;src/scripts/movement.c:142: x+=16;
	add	a, #0x10
	ld	(#_x),a
;src/scripts/movement.c:143: break;
	jr	00105$
;src/scripts/movement.c:144: case 4:
00103$:
;src/scripts/movement.c:145: y+=16;
	ld	a, d
	add	a, #0x10
	ld	(#_y),a
;src/scripts/movement.c:146: break;
	jr	00105$
;src/scripts/movement.c:147: case 8:
00104$:
;src/scripts/movement.c:148: x-=16;
	add	a, #0xf0
	ld	(#_x),a
;src/scripts/movement.c:150: }
00105$:
;src/scripts/movement.c:152: play_walk_animation(dir);
	push	bc
	push	de
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_play_walk_animation
	ld	hl, #_play_walk_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
	pop	bc
;src/scripts/movement.c:154: while (frame < 16) {
	ldhl	sp,	#3
	ld	a, e
	ld	(hl+), a
	ld	a, b
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	a, e
	ld	(hl+), a
	ld	a, b
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00123$:
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, #0x10
	jp	NC, 00140$
;src/scripts/movement.c:155: if (frame > 7) {
	ld	a, #0x07
	sub	a, (hl)
	jr	NC, 00107$
;src/scripts/movement.c:156: set_character_sprite(dir);
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
00107$:
;src/scripts/movement.c:158: if (mov_y >= 136) {
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x88
	jr	C, 00116$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x32
;src/scripts/movement.c:160: set_sprite_tile(7, 50);
	jr	00117$
00116$:
;src/scripts/movement.c:162: else if (mov_y == 134){
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x86
	jr	NZ, 00117$
;src/scripts/movement.c:163: switch (dir) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00110$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
	jr	00117$
;src/scripts/movement.c:164: case 1:
00108$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;src/scripts/movement.c:167: break;
	jr	00117$
;src/scripts/movement.c:168: case 2:
00109$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x0b
;src/scripts/movement.c:171: break;
	jr	00117$
;src/scripts/movement.c:172: case 4:
00110$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;src/scripts/movement.c:175: break;
	jr	00117$
;src/scripts/movement.c:176: case 8:
00111$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x0e
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x0f
;src/scripts/movement.c:180: }
00117$:
;src/scripts/movement.c:182: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/movement.c:185: mov_y-=1;
	ldhl	sp,	#1
;src/scripts/movement.c:183: switch (dir) {
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
;src/scripts/movement.c:188: mov_x+=1;
	dec	hl
	dec	hl
	ld	b, (hl)
;src/scripts/movement.c:183: switch (dir) {
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00119$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00120$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00121$
	jr	00122$
;src/scripts/movement.c:184: case 1:
00118$:
;src/scripts/movement.c:185: mov_y-=1;
	ld	a, c
	dec	a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/movement.c:186: break;
	jr	00122$
;src/scripts/movement.c:187: case 2:
00119$:
;src/scripts/movement.c:188: mov_x+=1;
	ld	a, b
	inc	a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/movement.c:189: break;
	jr	00122$
;src/scripts/movement.c:190: case 4:
00120$:
;src/scripts/movement.c:191: mov_y+=1;
	ld	a, c
	inc	a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/movement.c:192: break;
	jr	00122$
;src/scripts/movement.c:193: case 8:
00121$:
;src/scripts/movement.c:194: mov_x-=1;
	ld	a, b
	dec	a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/movement.c:196: }
00122$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 16)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/scripts/movement.c:198: move_sprite(5, mov_x+8, mov_y);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl+)
	add	a, #0x08
	ld	c, a
	ld	b, c
	ld	de, #(_shadow_OAM + 20)
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;src/scripts/movement.c:199: move_sprite(6, mov_x, mov_y + 8);
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
	ld	e, b
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 25)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/movement.c:201: frame++;
	ldhl	sp,	#10
	inc	(hl)
	jp	00123$
00140$:
;src/scripts/movement.c:204: }
	add	sp, #11
	ret
;src/scripts/movement.c:207: void move_character() {
;	---------------------------------
; Function move_character
; ---------------------------------
_move_character::
;src/scripts/movement.c:208: move_sprite(4, x, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/movement.c:209: move_sprite(5, x+8, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/movement.c:210: move_sprite(6, x, y + 8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/movement.c:211: move_sprite(7, x + 8, y + 8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/movement.c:213: if (y == 144) {
	ld	a, (#_y)
	sub	a, #0x90
	ret	NZ
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x32
;src/scripts/movement.c:215: set_sprite_tile(7, 50);
;src/scripts/movement.c:218: }
	ret
;src/scripts/movement.c:220: uint8_t check_terrain(uint8_t new_x, uint8_t new_y) {
;	---------------------------------
; Function check_terrain
; ---------------------------------
_check_terrain::
	add	sp, #-8
	ld	c, a
	ldhl	sp,	#7
	ld	(hl), e
;src/scripts/movement.c:222: if (current_location != 0) {
	ld	a, (#_current_location)
	or	a, a
	jr	Z, 00107$
;src/scripts/movement.c:223: if (new_x < 8 || new_x > 160 || new_y < 16 || new_y > 152) {
	ld	a, c
	sub	a, #0x08
	jr	C, 00101$
	ld	a, #0xa0
	sub	a, c
	jr	C, 00101$
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x10
	jr	C, 00101$
	ld	a, #0x98
	sub	a, (hl)
	jr	NC, 00107$
00101$:
;src/scripts/movement.c:224: return 1;
	ld	a, #0x01
	jp	00144$
00107$:
;src/scripts/movement.c:229: int16_t gx = ((int16_t)new_x - 8) / 8;
	ld	b, #0x00
	ld	de, #0x0008
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#4
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00146$
	ld	hl, #0xffff
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
00146$:
	ldhl	sp,#5
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	ld	(hl+), a
;src/scripts/movement.c:230: int16_t gy = ((int16_t)new_y - 16) / 8;
	ld	a, b
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#1
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
	ldhl	sp,	#4
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00147$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00147$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	inc	sp
	inc	sp
	push	bc
;src/scripts/movement.c:232: if (gx < 0 || gx >= 20 || gy < 0 || gy >= 18) {
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	NZ, 00108$
	ld	a, c
	sub	a, #0x14
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00108$
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	bit	7, (hl)
	jr	NZ, 00108$
	dec	hl
	ld	a, (hl+)
	sub	a, #0x12
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00109$
00108$:
;src/scripts/movement.c:233: return 0;
	xor	a, a
	jp	00144$
00109$:
;src/scripts/movement.c:236: uint16_t tile_index = (uint16_t)gy * 20 + gx;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	e, (hl)
	ld	l, a
	ld	h, e
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/movement.c:238: if (current_location == 0) {
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00142$
;src/scripts/movement.c:239: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/movement.c:240: uint8_t tile_id = Camp[tile_index];             // collisioni campo
	ld	de, #_Camp
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
;src/scripts/movement.c:241: uint8_t camp_colliding = camp_collisions[tile_id];
	ld	hl, #_camp_collisions
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
;src/scripts/movement.c:242: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/movement.c:243: if (camp_colliding == 1) return 0;
	dec	c
	jp	NZ,00143$
	ld	a, c
	jp	00144$
00142$:
;src/scripts/movement.c:245: if (dungeon[player_coords.x][player_coords.y] == 'T' || dungeon[player_coords.x][player_coords.y] == 'K') {
	ld	a, (#_player_coords + 0)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_dungeon
	add	hl, de
	ld	de, #_player_coords + 1
	ld	a, (de)
	add	a, l
	ld	e, a
	ld	a, #0x00
	adc	a, h
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x54
	jr	Z, 00120$
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4b
	jr	NZ, 00121$
00120$:
;src/scripts/movement.c:246: if (gx >= 8 && gx <= 11 && gy >= 6 && gy <= 7) {
	ld	a, c
	sub	a, #0x08
	jr	C, 00121$
	ld	a, #0x0b
	cp	a, c
	jr	C, 00121$
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x06
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00121$
	dec	hl
	ld	a, #0x07
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00121$
;src/scripts/movement.c:247: return 0;
	xor	a, a
	jp	00144$
00121$:
;src/scripts/movement.c:250: if (dungeon[player_coords.x][player_coords.y] == 'L' && lock_opened == 0) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4c
	jr	NZ, 00137$
	ld	a, (#_lock_opened)
	or	a, a
	jr	NZ, 00137$
;src/scripts/movement.c:251: switch (locked_door) {
	ld	a, (#_locked_door)
	dec	a
	jr	Z, 00123$
	ld	a, (#_locked_door)
	sub	a, #0x02
	jr	Z, 00126$
	ld	a, (#_locked_door)
	sub	a, #0x04
	jr	Z, 00129$
	ld	a, (#_locked_door)
	sub	a, #0x08
	jr	Z, 00132$
	jr	00137$
;src/scripts/movement.c:252: case 1:
00123$:
;src/scripts/movement.c:253: if (gy <= 1) {
	ldhl	sp,	#2
	ld	a, #0x01
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00137$
;src/scripts/movement.c:254: return 0;
	xor	a, a
	jr	00144$
;src/scripts/movement.c:257: case 2:
00126$:
;src/scripts/movement.c:258: if (gx >= 18) {
	ld	a, c
	sub	a, #0x12
	jr	C, 00137$
;src/scripts/movement.c:259: return 0;
	xor	a, a
	jr	00144$
;src/scripts/movement.c:262: case 4:
00129$:
;src/scripts/movement.c:263: if (gy >= 16) {
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00137$
;src/scripts/movement.c:264: return 0;
	xor	a, a
	jr	00144$
;src/scripts/movement.c:267: case 8:
00132$:
;src/scripts/movement.c:268: if (gx <= 1) {
	ld	a, #0x01
	cp	a, c
	jr	C, 00137$
;src/scripts/movement.c:269: return 0;
	xor	a, a
	jr	00144$
;src/scripts/movement.c:272: }
00137$:
;src/scripts/movement.c:274: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/movement.c:275: uint8_t tile_id = current_room[tile_index];     // collisioni dungeon
	ld	de, #_current_room
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
;src/scripts/movement.c:276: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/movement.c:277: if (tile_id > 3) return 0;
	ld	a, #0x03
	sub	a, c
	jr	NC, 00143$
	xor	a, a
	jr	00144$
00143$:
;src/scripts/movement.c:280: return 1;
	ld	a, #0x01
00144$:
;src/scripts/movement.c:281: }
	add	sp, #8
	ret
;src/scripts/movement.c:283: uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y) {
;	---------------------------------
; Function is_sprite_at
; ---------------------------------
_is_sprite_at::
	ld	c, a
;src/scripts/movement.c:284: if (current_location == 0){
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00105$
;src/scripts/movement.c:285: if (target_x == 120 && target_y == 64) {
	ld	a, c
	sub	a, #0x78
	jr	NZ, 00105$
	ld	a, e
	sub	a, #0x40
;src/scripts/movement.c:286: return 1;
;src/scripts/movement.c:289: return 0;
	ld	a, #0x01
	ret	Z
00105$:
	xor	a, a
;src/scripts/movement.c:291: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
