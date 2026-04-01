;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl b_enemy_death_sfx
	.globl _enemy_death_sfx
	.globl b_start_sfx
	.globl _start_sfx
	.globl b_hit_sfx
	.globl _hit_sfx
	.globl b_arrow_sfx
	.globl _arrow_sfx
	.globl b_init_sound
	.globl _init_sound
	.globl _save_game
	.globl b_hide_door
	.globl _hide_door
	.globl _check_input_keys
	.globl b_show_number
	.globl _show_number
	.globl b_boss_death
	.globl _boss_death
	.globl b_spawn_boss
	.globl _spawn_boss
	.globl _move_character
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl _clear_drops
	.globl _enemy_death
	.globl b_set_character_sprite
	.globl _set_character_sprite
	.globl _check_input_movement
	.globl _smooth_movement
	.globl b_play_explosion_animation
	.globl _play_explosion_animation
	.globl b_play_heal_animation
	.globl _play_heal_animation
	.globl _load_game
	.globl b_play_ending
	.globl _play_ending
	.globl b_set_room_tiles
	.globl _set_room_tiles
	.globl b_draw_flip_lock_h
	.globl _draw_flip_lock_h
	.globl b_draw_lock_h
	.globl _draw_lock_h
	.globl b_draw_flip_lock_v
	.globl _draw_flip_lock_v
	.globl b_draw_lock_v
	.globl _draw_lock_v
	.globl b_start_intro
	.globl _start_intro
	.globl b_insert_name
	.globl _insert_name
	.globl b_set_enemy_sprite
	.globl _set_enemy_sprite
	.globl b_spawn_enemies_in_room
	.globl _spawn_enemies_in_room
	.globl b_check_time
	.globl _check_time
	.globl b_set_stats
	.globl _set_stats
	.globl b_check_menu_options
	.globl _check_menu_options
	.globl b_show_time
	.globl _show_time
	.globl b_check_map_options
	.globl _check_map_options
	.globl b_game_over
	.globl _game_over
	.globl b_set_titlescreen
	.globl _set_titlescreen
	.globl b_empty_map_tiles
	.globl _empty_map_tiles
	.globl b_set_map_menu
	.globl _set_map_menu
	.globl b_generate_dungeon
	.globl _generate_dungeon
	.globl _hUGE_dosound
	.globl _hUGE_init
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _reset
	.globl _joypad
	.globl _delay
	.globl _add_VBL
	.globl _boss
	.globl _enemy
	.globl _current_enemies
	.globl _current_room
	.globl _arrow_tile
	.globl _menu_body
	.globl _stairs
	.globl _chest_opened
	.globl _chest_closed
	.globl _black
	.globl _blank
	.globl _check_terrain
	.globl _is_sprite_at
	.globl _set_camp_map
	.globl _hide_camp_sprites
	.globl _set_dungeon_map
	.globl _set_room
	.globl _change_room
	.globl _check_open_menu
	.globl _go_into_dungeon
	.globl _go_next_floor
	.globl _set_textbox
	.globl _player_attack
	.globl _shoot_arrow
	.globl _heal_player
	.globl _music_vbl_interrupt
	.globl _return_to_camp
	.globl _set_tutorial
	.globl _debug_value
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_current_room::
	.ds 360
_current_enemies::
	.ds 24
_enemy::
	.ds 12
_boss::
	.ds 10
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
;main.c:122: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:123: cls();
	call	_cls
;main.c:124: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:125: set_bkg_data(0, 241, Titlescreen);
	ld	de, #_Titlescreen
	push	de
	ld	hl, #0xf100
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:126: set_bkg_data(241, 8, TitleText);
	ld	de, #_TitleText
	push	de
	ld	hl, #0x8f1
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:127: set_bkg_tiles(0, 0, 20, 18, Title);
	ld	de, #_Title
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:128: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:129: init_sound();
	ld	e, #b_init_sound
	ld	hl, #_init_sound
	call	___sdcc_bcall_ehl
;main.c:133: }
	di
;main.c:132: add_VBL(music_vbl_interrupt);
	ld	de, #_music_vbl_interrupt
	call	_add_VBL
	ei
;main.c:135: current_song_bank = 5;
	ld	hl, #_current_song_bank
	ld	(hl), #0x05
;main.c:136: SWITCH_ROM(current_song_bank);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:137: hUGE_init(&intro_theme);
	ld	de, #_intro_theme
	call	_hUGE_init
;main.c:138: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:139: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:140: ng = set_titlescreen();
	ld	e, #b_set_titlescreen
	ld	hl, #_set_titlescreen
	call	___sdcc_bcall_ehl
	ld	(#_ng),a
;main.c:141: start_sfx();
	ld	e, #b_start_sfx
	ld	hl, #_start_sfx
	call	___sdcc_bcall_ehl
;main.c:143: if (ng) {
	ld	a, (#_ng)
	or	a, a
	jr	Z, 00102$
;main.c:144: start_intro();
	ld	e, #b_start_intro
	ld	hl, #_start_intro
	call	___sdcc_bcall_ehl
00102$:
;main.c:147: set_sprite_data(0, 4, MC_down);
	ld	de, #_MC_down
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:148: set_sprite_data(8, 4, MC_right);
	ld	de, #_MC_right
	push	de
	ld	hl, #0x408
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:149: set_sprite_data(12, 4, MC_left);
	ld	de, #_MC_left
	push	de
	ld	hl, #0x40c
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:150: set_sprite_data(16, 4, Hector);
	ld	de, #_Hector
	push	de
	ld	hl, #0x410
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:151: set_sprite_data(20, 4, Safy);
	ld	de, #_Safy
	push	de
	ld	hl, #0x414
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:152: set_sprite_data(50, 1, blank);
	ld	de, #_blank
	push	de
	ld	hl, #0x132
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:153: set_sprite_data(51, 8, Lock);
	ld	de, #_Lock
	push	de
	ld	hl, #0x833
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:154: set_sprite_data(59, 2, Key);
	ld	de, #_Key
	push	de
	ld	hl, #0x23b
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:155: set_sprite_data(61, 4, Mythril);
	ld	de, #_Mythril
	push	de
	ld	hl, #0x43d
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:156: set_sprite_data(65, 12, Numbers);
	ld	de, #_Numbers
	push	de
	ld	hl, #0xc41
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:157: set_sprite_data(80, 2, Arrow);
	ld	de, #_Arrow
	push	de
	ld	hl, #0x250
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:158: set_sprite_data(82, 2, Drops);
	ld	de, #_Drops
	push	de
	ld	hl, #0x252
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:159: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:160: set_bkg_data(108, 17, Minimap);
	ld	de, #_Minimap
	push	de
	ld	hl, #0x116c
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:161: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:162: set_bkg_data(128, 51, Text);
	ld	de, #_Text
	push	de
	ld	hl, #0x3380
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:163: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:164: set_bkg_data(179, 9, Textbox);
	ld	de, #_Textbox
	push	de
	ld	hl, #0x9b3
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:165: set_bkg_data(188, 16, Mugshot);
	ld	de, #_Mugshot
	push	de
	ld	hl, #0x10bc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:166: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:167: set_bkg_data(220, 4, MiniGUI);
	ld	de, #_MiniGUI
	push	de
	ld	hl, #0x4dc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:168: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:169: set_bkg_data(225, 20, Objects);
	ld	de, #_Objects
	push	de
	ld	hl, #0x14e1
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:170: set_bkg_data(245, 1, arrow);
	ld	de, #_arrow
	push	de
	ld	hl, #0x1f5
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:171: set_bkg_data(246, 1, black);
	ld	de, #_black
	push	de
	ld	hl, #0x1f6
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:173: if (!load_game()) {
	call	_load_game
	or	a, a
	jr	NZ, 00104$
;main.c:174: insert_name();
	ld	e, #b_insert_name
	ld	hl, #_insert_name
	call	___sdcc_bcall_ehl
00104$:
;main.c:177: set_sprite_data(4, 4, MC_up);
	ld	de, #_MC_up
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:179: if (current_location == 0){
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00106$
;main.c:180: set_camp_map();
	call	_set_camp_map
	jr	00107$
00106$:
;main.c:184: go_into_dungeon();
	call	_go_into_dungeon
00107$:
;main.c:186: if (ng) { // tutorial
	ld	a, (#_ng)
	or	a, a
	jr	Z, 00109$
;main.c:187: set_tutorial();
	call	_set_tutorial
00109$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:191: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
	ld	hl, #(_shadow_OAM + 142)
	ld	(hl), #0x3d
	ld	hl, #(_shadow_OAM + 146)
	ld	(hl), #0x3e
	ld	hl, #(_shadow_OAM + 150)
	ld	(hl), #0x3f
	ld	hl, #(_shadow_OAM + 154)
	ld	(hl), #0x40
;main.c:206: move_character();
	call	_move_character
;main.c:207: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:208: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:209: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:210: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:211: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:214: while(1) {
00133$:
;main.c:215: check_open_menu();
	call	_check_open_menu
;main.c:216: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00128$
;main.c:217: check_input_movement();
	call	_check_input_movement
;main.c:218: check_input_keys();
	call	_check_input_keys
;main.c:219: set_mini_menu(); //sus
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:220: change_room();
	call	_change_room
	jp	00129$
00128$:
;main.c:222: else if (menu_opened == 2) {
	ld	a, (#_menu_opened)
	sub	a, #0x02
	jr	NZ, 00125$
;main.c:223: check_menu_options(0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
	jr	00129$
00125$:
;main.c:225: else if (menu_opened == 3) {
	ld	a, (#_menu_opened)
	sub	a, #0x03
	jr	NZ, 00122$
;main.c:226: check_menu_options(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
	jr	00129$
00122$:
;main.c:228: else if (menu_opened == 4) {
	ld	a, (#_menu_opened)
	sub	a, #0x04
	jr	Z, 00129$
;main.c:231: else if (menu_opened == 5) {
	ld	a, (#_menu_opened)
	sub	a, #0x05
	jr	NZ, 00116$
;main.c:232: check_map_options();
	ld	e, #b_check_map_options
	ld	hl, #_check_map_options
	call	___sdcc_bcall_ehl
	jr	00129$
00116$:
;main.c:234: else if (menu_opened == 6) {
	ld	a, (#_menu_opened)
	sub	a, #0x06
	jr	NZ, 00129$
;main.c:235: if (joypad() & J_A || joypad() & J_B) {
	call	_joypad
	bit	4, a
	jr	NZ, 00110$
	call	_joypad
	bit	5, a
	jr	Z, 00111$
00110$:
;main.c:236: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:238: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:239: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:240: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:241: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:242: delay(300);
	ld	de, #0x012c
	call	_delay
00111$:
;main.c:244: show_time();
	ld	e, #b_show_time
	ld	hl, #_show_time
	call	___sdcc_bcall_ehl
00129$:
;main.c:247: if (returning_to_camp) {
	ld	hl, #_returning_to_camp
	ld	a, (hl)
	or	a, a
	jr	Z, 00131$
;main.c:248: returning_to_camp = 0;
	ld	(hl), #0x00
;main.c:249: return_to_camp();
	call	_return_to_camp
00131$:
;main.c:251: check_time();
	ld	e, #b_check_time
	ld	hl, #_check_time
	call	___sdcc_bcall_ehl
;main.c:252: wait_vbl_done();
	call	_wait_vbl_done
;main.c:254: }
	jp	00133$
_blank:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_black:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
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
_stairs:
	.db #0xf1	; 241
	.db #0xf2	; 242
	.db #0xf3	; 243
	.db #0xf4	; 244
_menu_body:
	.db #0xbb	; 187
_arrow_tile:
	.db #0xf5	; 245
;main.c:259: uint8_t check_terrain(uint8_t new_x, uint8_t new_y) {
;	---------------------------------
; Function check_terrain
; ---------------------------------
_check_terrain::
	add	sp, #-8
	ld	c, a
	ldhl	sp,	#7
	ld	(hl), e
;main.c:261: if (current_location != 0) {
	ld	a, (#_current_location)
	or	a, a
	jr	Z, 00107$
;main.c:262: if (new_x < 8 || new_x > 160 || new_y < 16 || new_y > 152) {
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
;main.c:263: return 1;
	ld	a, #0x01
	jp	00144$
00107$:
;main.c:268: int16_t gx = ((int16_t)new_x - 8) / 8;
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
;main.c:269: int16_t gy = ((int16_t)new_y - 16) / 8;
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
;main.c:271: if (gx < 0 || gx >= 20 || gy < 0 || gy >= 18) {
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
;main.c:272: return 0;
	xor	a, a
	jp	00144$
00109$:
;main.c:275: uint16_t tile_index = (uint16_t)gy * 20 + gx;
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
;main.c:277: if (current_location == 0) {
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00142$
;main.c:278: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:279: uint8_t tile_id = Camp[tile_index];             // collisioni campo
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
;main.c:280: uint8_t camp_colliding = camp_collisions[tile_id];
	ld	hl, #_camp_collisions
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
;main.c:281: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:282: if (camp_colliding == 1) return 0;
	dec	c
	jp	NZ,00143$
	ld	a, c
	jp	00144$
00142$:
;main.c:284: if (dungeon[player_coords.x][player_coords.y] == 'T' || dungeon[player_coords.x][player_coords.y] == 'K') {
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
;main.c:285: if (gx >= 8 && gx <= 11 && gy >= 6 && gy <= 7) {
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
;main.c:286: return 0;
	xor	a, a
	jp	00144$
00121$:
;main.c:289: if (dungeon[player_coords.x][player_coords.y] == 'L' && lock_opened == 0) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4c
	jr	NZ, 00137$
	ld	a, (#_lock_opened)
	or	a, a
	jr	NZ, 00137$
;main.c:290: switch (locked_door) {
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
;main.c:291: case 1:
00123$:
;main.c:292: if (gy <= 1) {
	ldhl	sp,	#2
	ld	a, #0x01
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00137$
;main.c:293: return 0;
	xor	a, a
	jr	00144$
;main.c:296: case 2:
00126$:
;main.c:297: if (gx >= 18) {
	ld	a, c
	sub	a, #0x12
	jr	C, 00137$
;main.c:298: return 0;
	xor	a, a
	jr	00144$
;main.c:301: case 4:
00129$:
;main.c:302: if (gy >= 16) {
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00137$
;main.c:303: return 0;
	xor	a, a
	jr	00144$
;main.c:306: case 8:
00132$:
;main.c:307: if (gx <= 1) {
	ld	a, #0x01
	cp	a, c
	jr	C, 00137$
;main.c:308: return 0;
	xor	a, a
	jr	00144$
;main.c:311: }
00137$:
;main.c:313: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:314: uint8_t tile_id = current_room[tile_index];     // collisioni dungeon
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
;main.c:315: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:316: if (tile_id > 3) return 0;
	ld	a, #0x03
	sub	a, c
	jr	NC, 00143$
	xor	a, a
	jr	00144$
00143$:
;main.c:319: return 1;
	ld	a, #0x01
00144$:
;main.c:320: }
	add	sp, #8
	ret
;main.c:322: uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y) {
;	---------------------------------
; Function is_sprite_at
; ---------------------------------
_is_sprite_at::
	ld	c, a
;main.c:323: if (current_location == 0){
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00105$
;main.c:324: if (target_x == 120 && target_y == 64) {
	ld	a, c
	sub	a, #0x78
	jr	NZ, 00105$
	ld	a, e
	sub	a, #0x40
;main.c:325: return 1;
;main.c:328: return 0;
	ld	a, #0x01
	ret	Z
00105$:
	xor	a, a
;main.c:330: }
	ret
;main.c:332: void set_camp_map(){
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
;main.c:337: set_sprite_data(16, 4, Hector);
	ld	de, #_Hector
	push	de
	ld	hl, #0x410
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:338: set_sprite_data(20, 4, Safy);
	ld	de, #_Safy
	push	de
	ld	hl, #0x414
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:339: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:340: set_bkg_data(0, 108, CampTiles);
	ld	de, #_CampTiles
	push	de
	ld	hl, #0x6c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:341: set_bkg_tiles(0, 0, 20, 18, Camp);
	ld	de, #_Camp
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:342: SWITCH_ROM(1);
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
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x28
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x30
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x28
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x30
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x78
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x80
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x78
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x80
;main.c:365: empty_map_tiles();
	ld	e, #b_empty_map_tiles
	ld	hl, #_empty_map_tiles
	call	___sdcc_bcall_ehl
;main.c:366: current_song_bank = 5;
	ld	hl, #_current_song_bank
	ld	(hl), #0x05
;main.c:367: SWITCH_ROM(current_song_bank);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:368: hUGE_init(&camp_theme);
	ld	de, #_camp_theme
	call	_hUGE_init
;main.c:369: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:370: }
	ret
;main.c:373: void hide_camp_sprites() {
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
;main.c:392: move_sprite(15, 00, 0);
;main.c:393: }
	ret
;main.c:395: void set_dungeon_map(){
;	---------------------------------
; Function set_dungeon_map
; ---------------------------------
_set_dungeon_map::
;main.c:396: if (current_floor <= 5) {
	ld	a, #0x05
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00111$
;main.c:397: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:398: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles);
	ld	bc, #_DungeonTiles+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00111$:
;main.c:400: else if (current_floor <= 10) {
	ld	a, #0x0a
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00108$
;main.c:401: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:402: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles2);
	ld	bc, #_DungeonTiles2+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00108$:
;main.c:404: else if (current_floor <= 15) {
	ld	a, #0x0f
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00105$
;main.c:405: SWITCH_ROM(5);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:406: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles3);
	ld	bc, #_DungeonTiles3+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00105$:
;main.c:408: else if (current_floor <= 20) {
	ld	a, #0x14
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	C, 00102$
;main.c:409: SWITCH_ROM(5);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:410: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles4);
	ld	bc, #_DungeonTiles4+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
	jr	00112$
00102$:
;main.c:413: SWITCH_ROM(5);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:414: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles5);
	ld	bc, #_DungeonTiles5+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
00112$:
;main.c:416: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:417: }
	ret
;main.c:419: void set_room(Coords coord){
;	---------------------------------
; Function set_room
; ---------------------------------
_set_room::
	add	sp, #-4
;main.c:420: set_dungeon_map();
	call	_set_dungeon_map
;main.c:421: uint8_t door = doors[coord.x][coord.y];
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
;main.c:423: set_room_tiles(door, room_ptr, coord);
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
;main.c:424: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
	pop	bc
;main.c:425: if (dungeon[coord.x][coord.y] == 'K') {
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
	jr	NZ, 00124$
;main.c:426: if (key_obtained == 0){
	ld	a, (#_key_obtained)
	or	a, a
	jr	NZ, 00102$
;main.c:427: set_bkg_tiles(8, 6, 4, 2, chest_closed);
	ld	de, #_chest_closed
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00125$
00102$:
;main.c:430: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00125$
00124$:
;main.c:433: else if (dungeon[coord.x][coord.y] == 'L') {
	cp	a, #0x4c
	jr	NZ, 00121$
;main.c:434: if (lock_opened == 0) {
	ld	a, (#_lock_opened)
	or	a, a
	jp	NZ, 00125$
;main.c:435: switch (locked_door) {
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
	jp	00125$
;main.c:436: case 1:
00104$:
;main.c:437: draw_lock_v(72, 16);
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
;main.c:438: break;
	jp	00125$
;main.c:439: case 2:
00105$:
;main.c:440: draw_lock_h(152, 80);
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
;main.c:441: break;
	jr	00125$
;main.c:442: case 4:
00106$:
;main.c:443: draw_flip_lock_v(72, 144);
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
;main.c:444: break;
	jr	00125$
;main.c:445: case 8:
00107$:
;main.c:446: draw_flip_lock_h(8, 80);
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
;main.c:448: }
	jr	00125$
00121$:
;main.c:451: else if (dungeon[coord.x][coord.y] == 'T') {
	cp	a, #0x54
	jr	NZ, 00118$
;main.c:452: if (treasure_obtained == 0){
	ld	a, (#_treasure_obtained)
	or	a, a
	jr	NZ, 00112$
;main.c:453: set_bkg_tiles(8, 6, 4, 2, chest_closed);
	ld	de, #_chest_closed
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00125$
00112$:
;main.c:456: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jr	00125$
00118$:
;main.c:459: else if (dungeon[coord.x][coord.y] == 'E' && current_floor % 5 != 0) {
	sub	a, #0x45
	jr	NZ, 00125$
	ld	a, (_current_floor)
	push	bc
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	pop	bc
	or	a, a
	jr	Z, 00125$
;main.c:460: set_bkg_tiles(2, 2, 2, 2, stairs);
	ld	de, #_stairs
	push	de
	ld	hl, #0x202
	push	hl
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00125$:
;main.c:463: spawn_enemies_in_room(coord.x, coord.y, current_enemies);
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
;main.c:464: clear_drops();
	call	_clear_drops
	pop	bc
;main.c:465: if (dungeon[coord.x][coord.y] != 'E') {
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
	jr	Z, 00131$
;main.c:466: set_enemy_sprite();
	ld	e, #b_set_enemy_sprite
	ld	hl, #_set_enemy_sprite
	call	___sdcc_bcall_ehl
	jp	00132$
00131$:
;main.c:468: else if (current_floor % 5 == 0 && boss_floor_defeated == 0) {
	ld	a, (_current_floor)
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	or	a, a
	jr	NZ, 00132$
	ld	a, (#_boss_floor_defeated)
	or	a, a
	jr	NZ, 00132$
;main.c:469: boss_battle = 1;
	ld	hl, #_boss_battle
	ld	(hl), #0x01
;main.c:470: spawn_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_spawn_boss
	ld	hl, #_spawn_boss
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:471: smooth_movement(last_direction);
	ld	a, (_last_direction)
	call	_smooth_movement
;main.c:472: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
	ld	de, #0x0000
00134$:
;main.c:473: for (uint16_t i; i<360; i++) {
	ld	c, e
	ld	b, d
	ld	a, c
	sub	a, #0x68
	ld	a, b
	sbc	a, #0x01
	jr	NC, 00126$
;main.c:474: current_room[i] = NoExit[i];
	ld	hl, #_current_room
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_NoExit
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;main.c:473: for (uint16_t i; i<360; i++) {
	inc	de
	jr	00134$
00126$:
;main.c:476: set_bkg_tiles(0, 0, 20, 18, current_room);
	ld	de, #_current_room
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:477: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:478: current_song_bank = 4;
	ld	hl, #_current_song_bank
	ld	(hl), #0x04
;main.c:479: SWITCH_ROM(current_song_bank);
	ld	a, #0x04
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x04
;main.c:480: hUGE_init(&boss_theme);
	ld	de, #_boss_theme
	call	_hUGE_init
;main.c:481: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
00132$:
;main.c:483: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:484: }
	add	sp, #4
	pop	hl
	pop	af
	jp	(hl)
;main.c:486: void change_room() {
;	---------------------------------
; Function change_room
; ---------------------------------
_change_room::
;main.c:487: if (x > 160 && x < 240) {
	ld	a, #0xa0
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00110$
	ld	a, (hl)
	sub	a, #0xf0
	jr	NC, 00110$
;main.c:488: player_coords.x++;
	ld	hl, #_player_coords
	inc	(hl)
	ld	a, (hl)
;main.c:489: x = 8;
	ld	hl, #_x
	ld	(hl), #0x08
;main.c:490: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00110$:
;main.c:492: else if (x > 240) {
	ld	a, #0xf0
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00107$
;main.c:493: player_coords.x--;
	ld	hl, #_player_coords
	dec	(hl)
	ld	a, (hl)
;main.c:494: x = 152;
	ld	hl, #_x
	ld	(hl), #0x98
;main.c:495: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00107$:
;main.c:497: else if (y > 144) {
	ld	a, #0x90
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00104$
;main.c:498: player_coords.y++;
	ld	hl, #_player_coords + 1
	inc	(hl)
	ld	a, (hl)
;main.c:499: y = 16;
	ld	hl, #_y
	ld	(hl), #0x10
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;main.c:502: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00104$:
;main.c:504: else if (y < 8) {
	ld	a, (#_y)
	sub	a, #0x08
	jp	NC, _move_character
;main.c:505: player_coords.y--;
	ld	hl, #_player_coords + 1
	dec	(hl)
	ld	a, (hl)
;main.c:506: y = 144;
	ld	hl, #_y
	ld	(hl), #0x90
;main.c:507: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;main.c:509: move_character();
;main.c:510: }
	jp	_move_character
;main.c:513: void check_open_menu() {
;	---------------------------------
; Function check_open_menu
; ---------------------------------
_check_open_menu::
;main.c:514: current_joypad = joypad();
	call	_joypad
	ld	hl, #_current_joypad
	ld	(hl), a
;main.c:515: if ((current_joypad & J_START) && !(last_joypad & J_START)) {
	ld	a, (hl)
	rlca
	jr	NC, 00107$
	ld	a, (_last_joypad)
	rlca
	jr	C, 00107$
;main.c:516: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00104$
;main.c:517: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;main.c:519: set_win_tiles(0, 0, 20, 18, gui_map);
	ld	de, #_gui_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:520: set_stats();
	ld	e, #b_set_stats
	ld	hl, #_set_stats
	call	___sdcc_bcall_ehl
;main.c:521: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:522: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:523: menu_opened = 1;
	ld	hl, #_menu_opened
	ld	(hl), #0x01
	jr	00107$
00104$:
;main.c:525: else if (menu_opened == 1) {
	ld	a, (#_menu_opened)
	dec	a
	jr	NZ, 00107$
;main.c:526: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:528: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:530: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:531: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:532: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00107$:
;main.c:535: if ((current_joypad & J_SELECT) && !(last_joypad & J_SELECT)) {
	ld	a, (_current_joypad)
	bit	6, a
	jp	Z, 00115$
	ld	a, (_last_joypad)
	bit	6, a
	jp	NZ, 00115$
;main.c:536: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00112$
;main.c:537: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;main.c:539: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:540: set_win_tiles(0, 0, 20, 18, map_menu);
	ld	de, #_map_menu
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:541: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:542: set_map_menu();
	ld	e, #b_set_map_menu
	ld	hl, #_set_map_menu
	call	___sdcc_bcall_ehl
;main.c:543: map_option = 0;
	xor	a, a
	ld	(#_map_option),a
;main.c:544: set_win_tiles(2, 4, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x402
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:545: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:546: menu_opened = 5;
	ld	hl, #_menu_opened
	ld	(hl), #0x05
;main.c:547: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00115$
00112$:
;main.c:549: else if (menu_opened == 5) {
	ld	a, (#_menu_opened)
	sub	a, #0x05
	jr	NZ, 00115$
;main.c:550: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:552: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:554: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:555: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:556: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00115$:
;main.c:559: last_joypad = current_joypad;
	ld	a, (#_current_joypad)
	ld	(#_last_joypad),a
;main.c:560: }
	ret
;main.c:563: void go_into_dungeon() {
;	---------------------------------
; Function go_into_dungeon
; ---------------------------------
_go_into_dungeon::
	add	sp, #-6
;main.c:564: wait_vbl_done();
	call	_wait_vbl_done
;main.c:565: DISPLAY_OFF;
	call	_display_off
;main.c:566: generate_dungeon(current_floor);
	ld	a, (_current_floor)
	push	af
	inc	sp
	ld	e, #b_generate_dungeon
	ld	hl, #_generate_dungeon
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:568: for (int i = 0; i < 4; i++) {
	ld	bc, #0x0000
00111$:
;main.c:569: for (int j = 0; j < 4; j++) {
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
;main.c:570: if (dungeon[i][j] == 'S') {
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
;main.c:571: start.x = i;
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:572: start.y = j;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;main.c:573: player_coords.x = i;
	ld	de, #_player_coords
	push	af
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	pop	af
;main.c:574: player_coords.y = j;
	ld	de, #_player_coords + 1
	ld	(de), a
00109$:
;main.c:569: for (int j = 0; j < 4; j++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00108$
00112$:
;main.c:568: for (int i = 0; i < 4; i++) {
	inc	bc
	jr	00111$
00104$:
;main.c:578: set_room(start);
	ld	hl,#0x1
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;main.c:579: if (max_floor == 0) {
	ld	hl, #_max_floor
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
;main.c:580: max_floor = 1;
	ld	(hl), #0x01
00113$:
;main.c:582: }
	add	sp, #6
	ret
;main.c:584: void go_next_floor() {
;	---------------------------------
; Function go_next_floor
; ---------------------------------
_go_next_floor::
	add	sp, #-6
;main.c:585: current_floor++;
	ld	hl, #_current_floor
	inc	(hl)
;main.c:586: if (current_floor % 5 == 0) {
	ld	a, (hl)
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;main.c:587: boss.defeated = 1;
	ld	hl, #(_boss + 9)
	ld	(hl), #0x01
;main.c:588: boss_floor_defeated = 0;
	xor	a, a
	ld	(#_boss_floor_defeated),a
00102$:
;main.c:590: if (current_floor > max_floor) {
	ld	a, (#_max_floor)
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	NC, 00104$
;main.c:591: max_floor = current_floor;
	ld	a, (hl)
	ld	(#_max_floor),a
00104$:
;main.c:593: key_obtained = 0;
;main.c:594: treasure_obtained = 0;
	xor	a, a
	ld	(#_key_obtained), a
	ld	(#_treasure_obtained),a
;main.c:595: lock_opened = 0;
	xor	a, a
	ld	(#_lock_opened),a
;main.c:596: generate_dungeon(current_floor);
	ld	a, (_current_floor)
	push	af
	inc	sp
	ld	e, #b_generate_dungeon
	ld	hl, #_generate_dungeon
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:598: for (int i = 0; i < 4; i++) {
	ld	bc, #0x0000
00113$:
;main.c:599: for (int j = 0; j < 4; j++) {
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
;main.c:600: if (dungeon[i][j] == 'S') {
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
;main.c:601: start.x = i;
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:602: start.y = j;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;main.c:603: player_coords.x = i;
	ld	de, #_player_coords
	push	af
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	pop	af
;main.c:604: player_coords.y = j;
	ld	de, #_player_coords + 1
	ld	(de), a
00111$:
;main.c:599: for (int j = 0; j < 4; j++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00110$
00114$:
;main.c:598: for (int i = 0; i < 4; i++) {
	inc	bc
	jr	00113$
00108$:
;main.c:608: set_room(start);
	ld	hl,#0x1
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;main.c:609: }
	add	sp, #6
	ret
;main.c:616: void set_textbox(uint8_t item) {
;	---------------------------------
; Function set_textbox
; ---------------------------------
_set_textbox::
	ld	c, a
;main.c:617: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x68
	ldh	(_WY_REG + 0), a
;main.c:619: if (item == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00110$
;main.c:620: set_win_tiles(0, 0, 20, 5, game_saved);
	ld	de, #_game_saved
	push	de
	ld	hl, #0x514
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
	jp	00111$
00110$:
;main.c:623: move_sprite(33, x, y-32);
	ld	a, (_y)
	ld	hl, #_x
	ld	l, (hl)
	add	a, #0xe0
	ld	e, a
;main.c:622: else if (item == 1) {
	ld	a, c
	dec	a
	jr	NZ, 00107$
;main.c:623: move_sprite(33, x, y-32);
	ld	c, l
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 132)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:624: move_sprite(34, x+8, y-32);
	ld	a, (_y)
	add	a, #0xe0
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 136)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:625: set_win_tiles(0, 0, 20, 5, obtained_key);
	ld	de, #_obtained_key
	push	de
	ld	hl, #0x514
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
	jr	00111$
00107$:
;main.c:627: else if (item == 2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:628: move_sprite(35, x, y-32);
	ld	c, l
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 140)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:629: move_sprite(36, x+8, y-32);
	ld	a, (_y)
	add	a, #0xe0
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 144)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:630: move_sprite(37, x, y-24);
	ld	a, (_y)
	add	a, #0xe8
	ld	b, a
	ld	a, (_x)
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 148)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:631: move_sprite(38, x+8, y-24);
	ld	a, (_y)
	add	a, #0xe8
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 152)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:632: set_win_tiles(0, 0, 20, 5, obtained_mythril);
	ld	de, #_obtained_mythril
	push	de
	ld	hl, #0x514
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
	jr	00111$
00104$:
;main.c:634: else if (item == 3) {
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00111$
;main.c:635: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:636: set_win_tiles(0, 0, 20, 5, boss_defeated);
	ld	de, #_boss_defeated
	push	de
	ld	hl, #0x514
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
00111$:
;main.c:639: wait_vbl_done();
	call	_wait_vbl_done
;main.c:641: while(!(joypad() & (J_A))) {
00112$:
	call	_joypad
	bit	4, a
	jr	NZ, 00115$
;main.c:642: wait_vbl_done();
	call	_wait_vbl_done
	jr	00112$
;main.c:645: while(joypad() & (J_A)) {
00115$:
	call	_joypad
	bit	4, a
	jr	Z, 00117$
;main.c:646: wait_vbl_done();
	call	_wait_vbl_done
	jr	00115$
00117$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 132)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 136)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 140)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 144)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 148)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 152)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:655: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:656: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:657: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
;main.c:658: }
	jp  ___sdcc_bcall_ehl
;main.c:662: void player_attack(uint8_t wpn, uint8_t index) {
;	---------------------------------
; Function player_attack
; ---------------------------------
_player_attack::
	add	sp, #-10
	ld	c, a
	ldhl	sp,	#9
	ld	(hl), e
;main.c:663: hit_sfx();
	push	bc
	ld	e, #b_hit_sfx
	ld	hl, #_hit_sfx
	call	___sdcc_bcall_ehl
	pop	bc
;main.c:666: if (wpn == 0) { // spada
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;main.c:667: atk_stat = attack;
	ld	a, (#_attack)
	ldhl	sp,	#8
	ld	(hl), a
	jr	00103$
00102$:
;main.c:670: atk_stat = arrow_damage;
	ld	a, (#_arrow_damage)
	ldhl	sp,	#8
	ld	(hl), a
00103$:
;main.c:672: if (index == 2) {
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ, 00116$
;main.c:673: if (atk_stat > boss.def) {
	ld	hl, #_boss + 6
	ld	c, (hl)
	ld	a, c
	ldhl	sp,	#8
	sub	a, (hl)
	jr	NC, 00105$
;main.c:674: damage = atk_stat - boss.def;
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	jr	00106$
00105$:
;main.c:677: damage = 1;
	ldhl	sp,	#8
	ld	(hl), #0x01
00106$:
;main.c:679: show_number(damage, 0, 1, index);
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
;main.c:680: if (damage < boss.hp) {
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
;main.c:681: boss.hp -= damage;
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
;main.c:684: boss.hp = 0;
	ld	hl, #(_boss + 3)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00109$:
;main.c:686: if (boss.hp == 0) {
	ld	hl, #(_boss + 3)
	ld	a, (hl+)
	or	a, (hl)
	jp	NZ, 00125$
;main.c:687: enemy_death_sfx();
	ld	e, #b_enemy_death_sfx
	ld	hl, #_enemy_death_sfx
	call	___sdcc_bcall_ehl
;main.c:688: uint8_t b_x = boss.x;
	ld	hl, #_boss + 1
	ld	c, (hl)
;main.c:689: uint8_t b_y = boss.y;
	ld	hl, #_boss + 2
	ld	b, (hl)
;main.c:690: boss_death(&boss);
	push	bc
	ld	de, #_boss
	push	de
	ld	e, #b_boss_death
	ld	hl, #_boss_death
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:691: set_character_sprite(last_direction);
	ld	a, (_last_direction)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	pop	bc
;main.c:692: wait_vbl_done();
	call	_wait_vbl_done
;main.c:693: play_explosion_animation(b_x, b_y);
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	e, #b_play_explosion_animation
	ld	hl, #_play_explosion_animation
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:694: boss_floor_defeated = 1;
	ld	hl, #_boss_floor_defeated
	ld	(hl), #0x01
;main.c:695: boss_battle = 0;
	xor	a, a
	ld	(#_boss_battle),a
;main.c:696: enemies_defeated++;
	ld	hl, #_enemies_defeated
	inc	(hl)
;main.c:697: experience += boss.exp_reward;
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
;main.c:698: obt_exp += boss.exp_reward;
	ld	a, (#(_boss + 7) + 0)
	ld	hl, #_obt_exp
	add	a, (hl)
	ld	(hl), a
;main.c:699: minerals+=2;
	ld	a, (_minerals)
	add	a, #0x02
	ld	(#_minerals),a
;main.c:700: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;main.c:701: if (current_floor != 25) {
	ld	a, (#_current_floor)
	sub	a, #0x19
	jp	Z, 00111$
;main.c:702: current_song_bank = 3;
	ld	hl, #_current_song_bank
	ld	(hl), #0x03
;main.c:703: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:704: hUGE_init(&boss_defeated_jingle);
	ld	de, #_boss_defeated_jingle
	call	_hUGE_init
;main.c:705: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:706: set_textbox(3);
	ld	a, #0x03
	call	_set_textbox
;main.c:707: uint8_t door = doors[player_coords.x][player_coords.y];
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
;main.c:709: set_room_tiles(door, room_ptr, player_coords);
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
;main.c:710: set_bkg_tiles(2, 2, 2, 2, stairs);
	ld	de, #_stairs
	push	de
	ld	hl, #0x202
	push	hl
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:711: current_song_bank = 4;
	ld	hl, #_current_song_bank
	ld	(hl), #0x04
;main.c:712: SWITCH_ROM(current_song_bank);
	ld	a, #0x04
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x04
;main.c:713: hUGE_init(&dungeon_theme);
	ld	de, #_dungeon_theme
	call	_hUGE_init
;main.c:714: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
	jp	00125$
00111$:
;main.c:717: current_song_bank = 5;
	ld	hl, #_current_song_bank
	ld	(hl), #0x05
;main.c:718: SWITCH_ROM(current_song_bank);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:719: hUGE_init(&ending_song);
	ld	de, #_ending_song
	call	_hUGE_init
;main.c:720: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:721: play_ending();
	ld	e, #b_play_ending
	ld	hl, #_play_ending
	call	___sdcc_bcall_ehl
;main.c:722: save_game();
	call	_save_game
;main.c:723: reset();
	call	_reset
;main.c:726: return;
	jp	00125$
00116$:
;main.c:730: if (atk_stat > current_enemies[index].def) {
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
;main.c:731: damage = atk_stat - current_enemies[index].def;
	ld	a, (hl)
	sub	a, c
	ldhl	sp,	#4
	ld	(hl), a
	jr	00119$
00118$:
;main.c:734: damage = 1;
	ldhl	sp,	#4
	ld	(hl), #0x01
00119$:
;main.c:736: show_number(damage, 0, 1, index);
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
;main.c:737: if (damage < current_enemies[index].hp) {
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
;main.c:738: current_enemies[index].hp -= damage;
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
;main.c:741: current_enemies[index].hp = 0;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:742: current_enemies[index].alive = 0;
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
;main.c:744: if (current_enemies[index].hp == 0) {
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
;main.c:745: uint8_t e_x = current_enemies[index].x;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
;main.c:746: uint8_t e_y = current_enemies[index].y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
;main.c:747: set_character_sprite(last_direction);
	ld	a, (_last_direction)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:748: wait_vbl_done();
	call	_wait_vbl_done
;main.c:749: enemy_death(&current_enemies[index]);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_death
;main.c:750: enemy_death_sfx();
	ld	e, #b_enemy_death_sfx
	ld	hl, #_enemy_death_sfx
	call	___sdcc_bcall_ehl
;main.c:751: play_explosion_animation(e_x, e_y);
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
;main.c:752: enemies_defeated++;
	ld	hl, #_enemies_defeated
	inc	(hl)
;main.c:753: experience += current_enemies[index].exp_reward;
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
;main.c:754: obt_exp += current_enemies[index].exp_reward;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl)
	ld	hl, #_obt_exp
	add	a, (hl)
	ld	(hl), a
00125$:
;main.c:756: }
	add	sp, #10
	ret
;main.c:760: void shoot_arrow() {
;	---------------------------------
; Function shoot_arrow
; ---------------------------------
_shoot_arrow::
	add	sp, #-3
;main.c:761: arrow_sfx();
	ld	e, #b_arrow_sfx
	ld	hl, #_arrow_sfx
	call	___sdcc_bcall_ehl
;main.c:762: uint8_t arrow_x = x;
	ld	a, (_x)
	ld	c, a
;main.c:763: uint8_t arrow_y = y;
	ld	a, (_y)
	ld	b, a
;main.c:764: switch (last_direction) {
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
;main.c:765: case 1:
00101$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:768: break;
	jr	00127$
;main.c:769: case 2:
00102$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x51
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:772: break;
	jr	00127$
;main.c:773: case 4:
00103$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:776: break;
	jr	00127$
;main.c:777: case 8:
00104$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x51
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:782: while (1) {
00127$:
;main.c:783: wait_vbl_done();
	call	_wait_vbl_done
;main.c:786: arrow_y-=2;
	ld	e, b
;main.c:784: switch (last_direction) {
	ld	a, (#_last_direction)
	dec	a
	jr	Z, 00106$
;main.c:789: arrow_x+=2;
	ld	d, c
;main.c:784: switch (last_direction) {
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
;main.c:785: case 1:
00106$:
;main.c:786: arrow_y-=2;
	ld	b, e
	dec	b
	dec	b
;main.c:787: break;
	jr	00110$
;main.c:788: case 2:
00107$:
;main.c:789: arrow_x+=2;
	ld	c, d
	inc	c
	inc	c
;main.c:790: break;
	jr	00110$
;main.c:791: case 4:
00108$:
;main.c:792: arrow_y+=2;
	ld	b, e
	inc	b
	inc	b
;main.c:793: break;
	jr	00110$
;main.c:794: case 8:
00109$:
;main.c:795: arrow_x-=2;
	ld	c, d
	dec	c
	dec	c
;main.c:797: }
00110$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 156)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:799: if (arrow_x < 1 || arrow_x > 168 || arrow_y > 144 || arrow_y < 8 || !check_terrain(arrow_x, arrow_y)) { // pulu
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
;main.c:802: return;
	jp	00147$
00112$:
;main.c:804: for (int i=0; i<2; i++) {
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
;main.c:805: uint8_t enemy_x = current_enemies[i].x;
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
;main.c:806: uint8_t enemy_y = current_enemies[i].y;
	ld	a, (hl+)
	ld	e, (hl)
;main.c:807: if (arrow_x == enemy_x && arrow_y == enemy_y) {
	sub	a, c
	jr	NZ, 00146$
	ld	a, b
	sub	a, e
	jr	NZ, 00146$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;main.c:809: move_sprite(39, x, y);
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
;main.c:810: player_attack(1, i); // arrow atk
	ldhl	sp,	#0
	ld	e, (hl)
	ld	a, #0x01
	call	_player_attack
;main.c:811: return;
	jr	00147$
00146$:
;main.c:804: for (int i=0; i<2; i++) {
	ldhl	sp,	#1
	inc	(hl)
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(hl), a
	jr	00145$
00120$:
;main.c:814: if ((arrow_x == boss.x || arrow_x == boss.x+16) && (arrow_y == boss.y || arrow_y == boss.y + 16)) {
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
;main.c:816: move_sprite(39, x, y);
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
;main.c:817: player_attack(1, 2);
	ld	e, #0x02
	ld	a, #0x01
	call	_player_attack
;main.c:818: return;
00147$:
;main.c:821: }
	add	sp, #3
	ret
;main.c:823: void heal_player() {
;	---------------------------------
; Function heal_player
; ---------------------------------
_heal_player::
;main.c:824: uint8_t heal = heal_quantity;
	ld	a, (_heal_quantity)
	ld	b, a
;main.c:825: current_hp += heal;
	ld	hl, #_current_hp
	ld	a, (hl)
	add	a, b
;main.c:826: if (current_hp >= max_hp) {
	ld	(hl), a
	ld	hl, #_max_hp
	sub	a, (hl)
	jr	C, 00102$
;main.c:827: heal = heal_quantity - (current_hp - max_hp);
	ld	a, (#_current_hp)
	ld	hl, #_max_hp
	sub	a, (hl)
	ld	c, a
	ld	a, (#_heal_quantity)
	sub	a, c
	ld	b, a
;main.c:828: current_hp = max_hp;
	ld	a, (#_max_hp)
	ld	(#_current_hp),a
00102$:
;main.c:830: play_heal_animation();
	push	bc
	ld	e, #b_play_heal_animation
	ld	hl, #_play_heal_animation
	call	___sdcc_bcall_ehl
	pop	bc
;main.c:831: show_number(heal, 1, 0, 0);
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
;main.c:832: }
	ret
;main.c:836: void music_vbl_interrupt() {
;	---------------------------------
; Function music_vbl_interrupt
; ---------------------------------
_music_vbl_interrupt::
;main.c:837: uint8_t bank_precedente = _current_bank;
	ldh	a, (__current_bank + 0)
	ld	c, a
;main.c:838: SWITCH_ROM(current_song_bank);
	ld	a, (_current_song_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;main.c:839: hUGE_dosound();
	push	bc
	call	_hUGE_dosound
	pop	bc
;main.c:840: SWITCH_ROM(bank_precedente);
	ld	a, c
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), c
;main.c:841: }
	ret
;main.c:843: void return_to_camp() {
;	---------------------------------
; Function return_to_camp
; ---------------------------------
_return_to_camp::
;main.c:844: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:845: current_song_bank = 3;
	ld	hl, #_current_song_bank
	ld	(hl), #0x03
;main.c:846: SWITCH_ROM(current_song_bank);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:847: hUGE_init(&gameover_jingle);
	ld	de, #_gameover_jingle
	call	_hUGE_init
;main.c:848: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:849: game_over();
	ld	e, #b_game_over
	ld	hl, #_game_over
	call	___sdcc_bcall_ehl
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:851: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:852: set_camp_map();
	call	_set_camp_map
;main.c:853: x = 120;
	ld	hl, #_x
	ld	(hl), #0x78
;main.c:854: y = 112;
	ld	hl, #_y
	ld	(hl), #0x70
;main.c:855: move_character();
	call	_move_character
;main.c:856: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:857: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:858: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:859: return;
;main.c:860: }
	ret
;main.c:862: void set_tutorial() {
;	---------------------------------
; Function set_tutorial
; ---------------------------------
_set_tutorial::
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x18
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x20
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x18
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x20
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x18
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x20
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), #0x18
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:873: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:874: set_win_tiles(0, 0, 20, 18, TutorialMap);
	ld	de, #_TutorialMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:875: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:876: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:877: while (1) {
00104$:
;main.c:878: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00104$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x28
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x30
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x28
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x30
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x78
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x80
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x78
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x80
;main.c:887: return;
;main.c:890: }
	ret
;main.c:892: void debug_value(uint8_t value) {
;	---------------------------------
; Function debug_value
; ---------------------------------
_debug_value::
	ld	(#_debug),a
;main.c:893: debug = value;
;main.c:894: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
