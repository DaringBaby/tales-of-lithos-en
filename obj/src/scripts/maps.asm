;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module maps
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl b_game_over
	.globl _game_over
	.globl _clear_drops
	.globl b_set_enemy_sprite
	.globl _set_enemy_sprite
	.globl b_spawn_boss
	.globl _spawn_boss
	.globl b_spawn_enemies_in_room
	.globl _spawn_enemies_in_room
	.globl b_hide_door
	.globl _hide_door
	.globl b_set_room_tiles
	.globl _set_room_tiles
	.globl b_empty_map_tiles
	.globl _empty_map_tiles
	.globl _move_character
	.globl _smooth_movement
	.globl _play_song
	.globl b_draw_flip_lock_h
	.globl _draw_flip_lock_h
	.globl b_draw_lock_h
	.globl _draw_lock_h
	.globl b_draw_flip_lock_v
	.globl _draw_flip_lock_v
	.globl b_draw_lock_v
	.globl _draw_lock_v
	.globl b_generate_dungeon
	.globl _generate_dungeon
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _delay
	.globl _chest_opened
	.globl _chest_closed
	.globl _set_camp_map
	.globl _hide_camp_sprites
	.globl _set_dungeon_map
	.globl _set_room
	.globl _change_room
	.globl _return_to_camp
	.globl _go_into_dungeon
	.globl _go_next_floor
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
;src/scripts/maps.c:18: void set_camp_map(){
;	---------------------------------
; Function set_camp_map
; ---------------------------------
_set_camp_map::
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;src/scripts/maps.c:23: set_sprite_data(16, 4, Hector);
	ld	de, #_Hector
	push	de
	ld	hl, #0x410
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/maps.c:24: set_sprite_data(20, 4, Safy);
	ld	de, #_Safy
	push	de
	ld	hl, #0x414
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/maps.c:25: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/maps.c:26: set_bkg_data(0, 108, CampTiles);
	ld	de, #_CampTiles
	push	de
	ld	hl, #0x6c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/maps.c:27: set_bkg_tiles(0, 0, 20, 18, Camp);
	ld	de, #_Camp
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/maps.c:28: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x10
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x11
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x12
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x13
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x14
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x15
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x16
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x17
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x28
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x30
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x28
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x30
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x78
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x80
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x78
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x80
;src/scripts/maps.c:51: empty_map_tiles();
	ld	e, #b_empty_map_tiles
	ld	hl, #_empty_map_tiles
	call	___sdcc_bcall_ehl
;src/scripts/maps.c:52: play_song(5);
	ld	a, #0x05
;src/scripts/maps.c:53: }
	jp	_play_song
_chest_closed:
	.db #0xe1	; 225
	.db #0xe2	; 226
	.db #0xe3	; 227
	.db #0xe4	; 228
	.db #0xe5	; 229
	.db #0xe6	; 230
	.db #0xe7	; 231
	.db #0xe8	; 232
_chest_opened:
	.db #0xe9	; 233
	.db #0xea	; 234
	.db #0xeb	; 235
	.db #0xec	; 236
	.db #0xed	; 237
	.db #0xee	; 238
	.db #0xef	; 239
	.db #0xf0	; 240
;src/scripts/maps.c:56: void hide_camp_sprites() {
;	---------------------------------
; Function hide_camp_sprites
; ---------------------------------
_hide_camp_sprites::
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x32
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/maps.c:75: move_sprite(15, 00, 0);
;src/scripts/maps.c:76: }
	ret
;src/scripts/maps.c:78: void set_dungeon_map(){
;	---------------------------------
; Function set_dungeon_map
; ---------------------------------
_set_dungeon_map::
;src/scripts/maps.c:79: if (current_floor <= 5) {
	ld	a, #0x05
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00111$
;src/scripts/maps.c:80: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/maps.c:81: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles);
	ld	bc, #_DungeonTiles+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00111$:
;src/scripts/maps.c:83: else if (current_floor <= 10) {
	ld	a, #0x0a
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00108$
;src/scripts/maps.c:84: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/maps.c:85: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles2);
	ld	bc, #_DungeonTiles2+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00108$:
;src/scripts/maps.c:87: else if (current_floor <= 15) {
	ld	a, #0x0f
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00105$
;src/scripts/maps.c:88: SWITCH_ROM(5);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;src/scripts/maps.c:89: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles3);
	ld	bc, #_DungeonTiles3+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00105$:
;src/scripts/maps.c:91: else if (current_floor <= 20) {
	ld	a, #0x14
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00102$
;src/scripts/maps.c:92: SWITCH_ROM(5);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;src/scripts/maps.c:93: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles4);
	ld	bc, #_DungeonTiles4+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00102$:
;src/scripts/maps.c:96: SWITCH_ROM(5);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;src/scripts/maps.c:97: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles5);
	ld	bc, #_DungeonTiles5+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
00112$:
;src/scripts/maps.c:99: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/maps.c:100: }
	ret
;src/scripts/maps.c:102: void set_room(Coords coord){
;	---------------------------------
; Function set_room
; ---------------------------------
_set_room::
	add	sp, #-4
;src/scripts/maps.c:103: set_dungeon_map();
	call	_set_dungeon_map
;src/scripts/maps.c:104: uint8_t door = doors[coord.x][coord.y];
	ld	hl, #6
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_doors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#7
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, a
;src/scripts/maps.c:106: set_room_tiles(door, room_ptr, coord);
	push	bc
	ld	hl,#0x9
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	inc	sp
	ld	e, #b_set_room_tiles
	ld	hl, #_set_room_tiles
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/maps.c:107: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
	pop	bc
;src/scripts/maps.c:108: if (dungeon[coord.x][coord.y] == 'K') {
	ld	a, (bc)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_dungeon
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#7
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	cp	a, #0x4b
	jr	NZ, 00127$
;src/scripts/maps.c:109: if (key_obtained == 0){
	ld	a, (#_key_obtained)
	or	a, a
	jr	NZ, 00102$
;src/scripts/maps.c:110: set_bkg_tiles(8, 6, 4, 2, chest_closed);
	ld	de, #_chest_closed
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00128$
00102$:
;src/scripts/maps.c:113: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00128$
00127$:
;src/scripts/maps.c:116: else if (dungeon[coord.x][coord.y] == 'L') {
	cp	a, #0x4c
	jr	NZ, 00124$
;src/scripts/maps.c:117: if (lock_opened == 0) {
	ld	a, (#_lock_opened)
	or	a, a
	jp	NZ, 00128$
;src/scripts/maps.c:118: switch (locked_door) {
	ld	a, (#_locked_door)
	dec	a
	jr	Z, 00104$
	ld	a, (#_locked_door)
	sub	a, #0x02
	jr	Z, 00105$
	ld	a, (#_locked_door)
	sub	a, #0x04
	jr	Z, 00106$
	ld	a, (#_locked_door)
	sub	a, #0x08
	jr	Z, 00107$
	jp	00128$
;src/scripts/maps.c:119: case 1:
00104$:
;src/scripts/maps.c:120: draw_lock_v(72, 16);
	push	bc
	ld	a, #0x10
	push	af
	inc	sp
	ld	a, #0x48
	push	af
	inc	sp
	ld	e, #b_draw_lock_v
	ld	hl, #_draw_lock_v
	call	___sdcc_bcall_ehl
	pop	hl
	pop	bc
;src/scripts/maps.c:121: break;
	jp	00128$
;src/scripts/maps.c:122: case 2:
00105$:
;src/scripts/maps.c:123: draw_lock_h(152, 80);
	push	bc
	ld	a, #0x50
	push	af
	inc	sp
	ld	a, #0x98
	push	af
	inc	sp
	ld	e, #b_draw_lock_h
	ld	hl, #_draw_lock_h
	call	___sdcc_bcall_ehl
	pop	hl
	pop	bc
;src/scripts/maps.c:124: break;
	jp	00128$
;src/scripts/maps.c:125: case 4:
00106$:
;src/scripts/maps.c:126: draw_flip_lock_v(72, 144);
	push	bc
	ld	a, #0x90
	push	af
	inc	sp
	ld	a, #0x48
	push	af
	inc	sp
	ld	e, #b_draw_flip_lock_v
	ld	hl, #_draw_flip_lock_v
	call	___sdcc_bcall_ehl
	pop	hl
	pop	bc
;src/scripts/maps.c:127: break;
	jp	00128$
;src/scripts/maps.c:128: case 8:
00107$:
;src/scripts/maps.c:129: draw_flip_lock_h(8, 80);
	push	bc
	ld	a, #0x50
	push	af
	inc	sp
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_draw_flip_lock_h
	ld	hl, #_draw_flip_lock_h
	call	___sdcc_bcall_ehl
	pop	hl
	pop	bc
;src/scripts/maps.c:131: }
	jr	00128$
00124$:
;src/scripts/maps.c:134: else if (dungeon[coord.x][coord.y] == 'T') {
	cp	a, #0x54
	jr	NZ, 00121$
;src/scripts/maps.c:135: if (treasure_obtained == 0){
	ld	a, (#_treasure_obtained)
	or	a, a
	jr	NZ, 00112$
;src/scripts/maps.c:136: set_bkg_tiles(8, 6, 4, 2, chest_closed);
	ld	de, #_chest_closed
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00128$
00112$:
;src/scripts/maps.c:139: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00128$
00121$:
;src/scripts/maps.c:142: else if (dungeon[coord.x][coord.y] == 'E' && current_floor % 5 != 0 || dungeon[coord.x][coord.y] == 'E' && current_floor % 5 == 0 && boss_floor_defeated) {
	sub	a, #0x45
	ld	a, #0x01
	jr	Z, 00279$
	xor	a, a
00279$:
	ld	h, a
	ld	a, (_current_floor)
	ld	l, a
	ld	a, h
	or	a, a
	jr	Z, 00119$
	ld	a, l
	push	hl
	push	bc
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	pop	bc
	pop	hl
	or	a, a
	jr	NZ, 00114$
00119$:
	ld	a, h
	or	a, a
	jr	Z, 00128$
	ld	a, l
	push	bc
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	pop	bc
	or	a, a
	jr	NZ, 00128$
	ld	a, (#_boss_floor_defeated)
	or	a, a
	jr	Z, 00128$
00114$:
;src/scripts/maps.c:143: set_bkg_tiles(2, 2, 2, 2, stairs);
	ld	de, #_stairs
	push	de
	ld	hl, #0x202
	push	hl
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00128$:
;src/scripts/maps.c:146: spawn_enemies_in_room(coord.x, coord.y, current_enemies);
	ldhl	sp,	#7
	ld	h, (hl)
	ld	a, (bc)
	ld	l, a
	push	bc
	ld	de, #_current_enemies
	push	de
	push	hl
	ld	a, l
	inc	sp
	push	af
	inc	sp
	ld	e, #b_spawn_enemies_in_room
	ld	hl, #_spawn_enemies_in_room
	call	___sdcc_bcall_ehl
	add	sp, #4
;src/scripts/maps.c:147: clear_drops();
	call	_clear_drops
	pop	bc
;src/scripts/maps.c:148: if (dungeon[coord.x][coord.y] != 'E') {
	ld	a, (bc)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_dungeon)
	ld	c, a
	ld	a, h
	adc	a, #>(_dungeon)
	ld	b, a
	ldhl	sp,	#7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x45
	jr	Z, 00134$
;src/scripts/maps.c:149: set_enemy_sprite();
	ld	e, #b_set_enemy_sprite
	ld	hl, #_set_enemy_sprite
	call	___sdcc_bcall_ehl
	jr	00135$
00134$:
;src/scripts/maps.c:151: else if (current_floor % 5 == 0 && boss_floor_defeated == 0) {
	ld	a, (_current_floor)
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	or	a, a
	jr	NZ, 00135$
	ld	a, (#_boss_floor_defeated)
	or	a, a
	jr	NZ, 00135$
;src/scripts/maps.c:152: boss_battle = 1;
	ld	hl, #_boss_battle
	ld	(hl), #0x01
;src/scripts/maps.c:153: spawn_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_spawn_boss
	ld	hl, #_spawn_boss
	call	___sdcc_bcall_ehl
	pop	hl
;src/scripts/maps.c:154: smooth_movement(last_direction);
	ld	a, (_last_direction)
	call	_smooth_movement
;src/scripts/maps.c:155: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
	ld	bc, #0x0000
00137$:
;src/scripts/maps.c:156: for (uint16_t i; i<360; i++) {
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0x68
	ld	a, d
	sbc	a, #0x01
	jr	NC, 00129$
;src/scripts/maps.c:157: current_room[i] = NoExit[i];
	ld	hl, #_current_room
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	hl, #_NoExit
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;src/scripts/maps.c:156: for (uint16_t i; i<360; i++) {
	inc	bc
	jr	00137$
00129$:
;src/scripts/maps.c:159: set_bkg_tiles(0, 0, 20, 18, current_room);
	ld	bc, #_current_room
	push	bc
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/maps.c:160: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/maps.c:161: play_song(4);
	ld	a, #0x04
	call	_play_song
00135$:
;src/scripts/maps.c:163: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/maps.c:164: }
	add	sp, #4
	pop	hl
	pop	af
	jp	(hl)
;src/scripts/maps.c:166: void change_room() {
;	---------------------------------
; Function change_room
; ---------------------------------
_change_room::
;src/scripts/maps.c:167: if (x > 160 && x < 240) {
	ld	a, #0xa0
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00110$
	ld	a, (hl)
	sub	a, #0xf0
	jr	NC, 00110$
;src/scripts/maps.c:168: player_coords.x++;
	ld	hl, #_player_coords
	inc	(hl)
	ld	a, (hl)
;src/scripts/maps.c:169: x = 8;
	ld	hl, #_x
	ld	(hl), #0x08
;src/scripts/maps.c:170: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00110$:
;src/scripts/maps.c:172: else if (x > 240) {
	ld	a, #0xf0
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00107$
;src/scripts/maps.c:173: player_coords.x--;
	ld	hl, #_player_coords
	dec	(hl)
	ld	a, (hl)
;src/scripts/maps.c:174: x = 152;
	ld	hl, #_x
	ld	(hl), #0x98
;src/scripts/maps.c:175: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00107$:
;src/scripts/maps.c:177: else if (y > 144) {
	ld	a, #0x90
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00104$
;src/scripts/maps.c:178: player_coords.y++;
	ld	hl, #_player_coords + 1
	inc	(hl)
	ld	a, (hl)
;src/scripts/maps.c:179: y = 16;
	ld	hl, #_y
	ld	(hl), #0x10
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;src/scripts/maps.c:182: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00104$:
;src/scripts/maps.c:184: else if (y < 8) {
	ld	a, (#_y)
	sub	a, #0x08
	jp	NC, _move_character
;src/scripts/maps.c:185: player_coords.y--;
	ld	hl, #_player_coords + 1
	dec	(hl)
	ld	a, (hl)
;src/scripts/maps.c:186: y = 144;
	ld	hl, #_y
	ld	(hl), #0x90
;src/scripts/maps.c:187: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;src/scripts/maps.c:189: move_character();
;src/scripts/maps.c:190: }
	jp	_move_character
;src/scripts/maps.c:192: void return_to_camp() {
;	---------------------------------
; Function return_to_camp
; ---------------------------------
_return_to_camp::
;src/scripts/maps.c:193: menu_opened = 0;
;src/scripts/maps.c:194: play_song(0);
	xor	a, a
	ld	(#_menu_opened), a
	call	_play_song
;src/scripts/maps.c:195: game_over();
	ld	e, #b_game_over
	ld	hl, #_game_over
	call	___sdcc_bcall_ehl
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/maps.c:197: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;src/scripts/maps.c:198: set_camp_map();
	call	_set_camp_map
;src/scripts/maps.c:199: x = 120;
	ld	hl, #_x
	ld	(hl), #0x78
;src/scripts/maps.c:200: y = 112;
	ld	hl, #_y
	ld	(hl), #0x70
;src/scripts/maps.c:201: move_character();
	call	_move_character
;src/scripts/maps.c:202: delay(100);
	ld	de, #0x0064
	call	_delay
;src/scripts/maps.c:203: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/scripts/maps.c:204: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/maps.c:205: return;
;src/scripts/maps.c:206: }
	ret
;src/scripts/maps.c:208: void go_into_dungeon() {
;	---------------------------------
; Function go_into_dungeon
; ---------------------------------
_go_into_dungeon::
	add	sp, #-6
;src/scripts/maps.c:209: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/maps.c:210: DISPLAY_OFF;
	call	_display_off
;src/scripts/maps.c:211: generate_dungeon(current_floor);
	ld	a, (_current_floor)
	push	af
	inc	sp
	ld	e, #b_generate_dungeon
	ld	hl, #_generate_dungeon
	call	___sdcc_bcall_ehl
	inc	sp
;src/scripts/maps.c:213: for (int i = 0; i < 4; i++) {
	ld	bc, #0x0000
00111$:
;src/scripts/maps.c:214: for (int j = 0; j < 4; j++) {
	ld	a,c
	cp	a,#0x04
	jr	NC, 00104$
	ld	d, b
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ld	hl, #_dungeon
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00108$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00112$
;src/scripts/maps.c:215: if (dungeon[i][j] == 'S') {
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	sub	a, #0x53
	jr	NZ, 00109$
;src/scripts/maps.c:216: start.x = i;
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/maps.c:217: start.y = j;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/maps.c:218: player_coords.x = i;
	ld	de, #_player_coords
	push	af
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	pop	af
;src/scripts/maps.c:219: player_coords.y = j;
	ld	de, #_player_coords + 1
	ld	(de), a
00109$:
;src/scripts/maps.c:214: for (int j = 0; j < 4; j++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00108$
00112$:
;src/scripts/maps.c:213: for (int i = 0; i < 4; i++) {
	inc	bc
	jr	00111$
00104$:
;src/scripts/maps.c:223: set_room(start);
	ld	hl,#0x1
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;src/scripts/maps.c:224: if (max_floor == 0) {
	ld	hl, #_max_floor
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
;src/scripts/maps.c:225: max_floor = 1;
	ld	(hl), #0x01
00113$:
;src/scripts/maps.c:227: }
	add	sp, #6
	ret
;src/scripts/maps.c:229: void go_next_floor() {
;	---------------------------------
; Function go_next_floor
; ---------------------------------
_go_next_floor::
	add	sp, #-6
;src/scripts/maps.c:230: current_floor++;
	ld	hl, #_current_floor
	inc	(hl)
;src/scripts/maps.c:231: if (current_floor % 5 == 0) {
	ld	a, (hl)
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;src/scripts/maps.c:232: boss.defeated = 1;
	ld	hl, #(_boss + 9)
	ld	(hl), #0x01
;src/scripts/maps.c:233: boss_floor_defeated = 0;
	xor	a, a
	ld	(#_boss_floor_defeated),a
00102$:
;src/scripts/maps.c:235: if (current_floor > max_floor) {
	ld	a, (#_max_floor)
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	NC, 00104$
;src/scripts/maps.c:236: max_floor = current_floor;
	ld	a, (hl)
	ld	(#_max_floor),a
00104$:
;src/scripts/maps.c:238: key_obtained = 0;
;src/scripts/maps.c:239: treasure_obtained = 0;
	xor	a, a
	ld	(#_key_obtained), a
	ld	(#_treasure_obtained),a
;src/scripts/maps.c:240: lock_opened = 0;
	xor	a, a
	ld	(#_lock_opened),a
;src/scripts/maps.c:241: generate_dungeon(current_floor);
	ld	a, (_current_floor)
	push	af
	inc	sp
	ld	e, #b_generate_dungeon
	ld	hl, #_generate_dungeon
	call	___sdcc_bcall_ehl
	inc	sp
;src/scripts/maps.c:243: for (int i = 0; i < 4; i++) {
	ld	bc, #0x0000
00113$:
;src/scripts/maps.c:244: for (int j = 0; j < 4; j++) {
	ld	a,c
	cp	a,#0x04
	jr	NC, 00108$
	ld	d, b
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ld	hl, #_dungeon
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00110$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00114$
;src/scripts/maps.c:245: if (dungeon[i][j] == 'S') {
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	sub	a, #0x53
	jr	NZ, 00111$
;src/scripts/maps.c:246: start.x = i;
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/maps.c:247: start.y = j;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/maps.c:248: player_coords.x = i;
	ld	de, #_player_coords
	push	af
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	pop	af
;src/scripts/maps.c:249: player_coords.y = j;
	ld	de, #_player_coords + 1
	ld	(de), a
00111$:
;src/scripts/maps.c:244: for (int j = 0; j < 4; j++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00110$
00114$:
;src/scripts/maps.c:243: for (int i = 0; i < 4; i++) {
	inc	bc
	jr	00113$
00108$:
;src/scripts/maps.c:253: set_room(start);
	ld	hl,#0x1
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;src/scripts/maps.c:254: }
	add	sp, #6
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
