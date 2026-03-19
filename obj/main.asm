;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _heal_player
	.globl _main
	.globl b_play_explosion_animation
	.globl _play_explosion_animation
	.globl b_play_heal_animation
	.globl _play_heal_animation
	.globl b_play_walk_animation
	.globl _play_walk_animation
	.globl b_play_attack_animation
	.globl _play_attack_animation
	.globl _save_game
	.globl _load_game
	.globl b_set_room_tiles
	.globl _set_room_tiles
	.globl b_enemy_death_sfx
	.globl _enemy_death_sfx
	.globl b_death_sfx
	.globl _death_sfx
	.globl b_start_sfx
	.globl _start_sfx
	.globl b_unlock_sfx
	.globl _unlock_sfx
	.globl b_stairs_sfx
	.globl _stairs_sfx
	.globl b_heal_sfx
	.globl _heal_sfx
	.globl b_hit_sfx
	.globl _hit_sfx
	.globl b_arrow_sfx
	.globl _arrow_sfx
	.globl b_init_sound
	.globl _init_sound
	.globl b_hide_door
	.globl _hide_door
	.globl b_draw_flip_lock_h
	.globl _draw_flip_lock_h
	.globl b_draw_lock_h
	.globl _draw_lock_h
	.globl b_draw_flip_lock_v
	.globl _draw_flip_lock_v
	.globl b_draw_lock_v
	.globl _draw_lock_v
	.globl _check_drops
	.globl _clear_drops
	.globl b_start_intro
	.globl _start_intro
	.globl b_insert_name
	.globl _insert_name
	.globl b_set_character_sprite
	.globl _set_character_sprite
	.globl b_check_enemy
	.globl _check_enemy
	.globl b_show_number
	.globl _show_number
	.globl b_boss_death
	.globl _boss_death
	.globl b_move_boss
	.globl _move_boss
	.globl b_spawn_boss
	.globl _spawn_boss
	.globl b_set_enemy_tiles
	.globl _set_enemy_tiles
	.globl b_spawn_enemies_in_room
	.globl _spawn_enemies_in_room
	.globl b_set_mini_menu
	.globl _set_mini_menu
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
	.globl _enemy_death
	.globl _move_enemy
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
	.globl _joypad
	.globl _delay
	.globl _add_VBL
	.globl _walk_step
	.globl _ng
	.globl _current_song_bank
	.globl _returning_to_camp
	.globl _boss_floor_defeated
	.globl _boss_battle
	.globl _lock_opened
	.globl _treasure_obtained
	.globl _key_obtained
	.globl _map_option
	.globl _safy_option
	.globl _hector_option
	.globl _current_floor
	.globl _current_location
	.globl _menu_opened
	.globl _obt_exp
	.globl _obt_mythril
	.globl _minerals
	.globl _max_num_arrows
	.globl _num_arrows
	.globl _arrow_damage
	.globl _heal_quantity
	.globl _heals
	.globl _max_heals
	.globl _potion_heal_lvl
	.globl _potion_quant_lvl
	.globl _quiver_lvl
	.globl _arrow_lvl
	.globl _shield_lvl
	.globl _sword_lvl
	.globl _experience
	.globl _level
	.globl _defense
	.globl _attack
	.globl _current_hp
	.globl _max_hp
	.globl _player_name
	.globl _current_joypad
	.globl _last_joypad
	.globl _power_ups
	.globl _max_floor
	.globl _enemies_defeated
	.globl _hours
	.globl _minutes
	.globl _seconds
	.globl _frames
	.globl _last_direction
	.globl _y
	.globl _x
	.globl _tile_id
	.globl _boss
	.globl _enemy
	.globl _current_enemies
	.globl _seed
	.globl _map
	.globl _current_room
	.globl _player_coords
	.globl _last_y
	.globl _last_x
	.globl _level_curve
	.globl _cure_upgrade_costs
	.globl _upgrade_costs
	.globl _arrow_tile
	.globl _menu_body
	.globl _stairs
	.globl _chest_opened
	.globl _chest_closed
	.globl _black
	.globl _blank
	.globl _move_character
	.globl _check_input_movement
	.globl _check_input_keys
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
	.globl _smooth_movement
	.globl _check_time
	.globl _set_enemy_sprite
	.globl _music_vbl_interrupt
	.globl _return_to_camp
	.globl _set_tutorial
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_last_x::
	.ds 1
_last_y::
	.ds 1
_player_coords::
	.ds 2
_current_room::
	.ds 360
_map::
	.ds 16
_seed::
	.ds 2
_current_enemies::
	.ds 20
_enemy::
	.ds 10
_boss::
	.ds 8
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_tile_id::
	.ds 2
_x::
	.ds 1
_y::
	.ds 1
_last_direction::
	.ds 1
_frames::
	.ds 1
_seconds::
	.ds 1
_minutes::
	.ds 1
_hours::
	.ds 1
_enemies_defeated::
	.ds 1
_max_floor::
	.ds 1
_power_ups::
	.ds 1
_last_joypad::
	.ds 1
_current_joypad::
	.ds 1
_player_name::
	.ds 5
_max_hp::
	.ds 1
_current_hp::
	.ds 1
_attack::
	.ds 1
_defense::
	.ds 1
_level::
	.ds 1
_experience::
	.ds 1
_sword_lvl::
	.ds 1
_shield_lvl::
	.ds 1
_arrow_lvl::
	.ds 1
_quiver_lvl::
	.ds 1
_potion_quant_lvl::
	.ds 1
_potion_heal_lvl::
	.ds 1
_max_heals::
	.ds 1
_heals::
	.ds 1
_heal_quantity::
	.ds 1
_arrow_damage::
	.ds 1
_num_arrows::
	.ds 1
_max_num_arrows::
	.ds 1
_minerals::
	.ds 1
_obt_mythril::
	.ds 1
_obt_exp::
	.ds 1
_menu_opened::
	.ds 1
_current_location::
	.ds 1
_current_floor::
	.ds 1
_hector_option::
	.ds 1
_safy_option::
	.ds 1
_map_option::
	.ds 1
_key_obtained::
	.ds 1
_treasure_obtained::
	.ds 1
_lock_opened::
	.ds 1
_boss_battle::
	.ds 1
_boss_floor_defeated::
	.ds 1
_returning_to_camp::
	.ds 1
_current_song_bank::
	.ds 1
_ng::
	.ds 1
_walk_step::
	.ds 1
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
;main.c:202: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:203: cls();
	call	_cls
;main.c:204: start_intro();
	ld	e, #b_start_intro
	ld	hl, #_start_intro
	call	___sdcc_bcall_ehl
;main.c:205: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:206: set_bkg_data(0, 241, Titlescreen);
	ld	de, #_Titlescreen
	push	de
	ld	hl, #0xf100
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:207: set_bkg_data(241, 8, TitleText);
	ld	de, #_TitleText
	push	de
	ld	hl, #0x8f1
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:208: set_bkg_tiles(0, 0, 20, 18, Title);
	ld	de, #_Title
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:209: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:210: init_sound();
	ld	e, #b_init_sound
	ld	hl, #_init_sound
	call	___sdcc_bcall_ehl
;main.c:214: }
	di
;main.c:213: add_VBL(music_vbl_interrupt);
	ld	de, #_music_vbl_interrupt
	call	_add_VBL
	ei
;main.c:216: current_song_bank = 5;
	ld	hl, #_current_song_bank
	ld	(hl), #0x05
;main.c:217: SWITCH_ROM(current_song_bank);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:218: hUGE_init(&intro_theme);
	ld	de, #_intro_theme
	call	_hUGE_init
;main.c:219: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:220: ng = set_titlescreen();
	ld	e, #b_set_titlescreen
	ld	hl, #_set_titlescreen
	call	___sdcc_bcall_ehl
	ld	(#_ng),a
;main.c:221: start_sfx();
	ld	e, #b_start_sfx
	ld	hl, #_start_sfx
	call	___sdcc_bcall_ehl
;main.c:225: set_sprite_data(0, 4, MC_down);
	ld	de, #_MC_down
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:226: set_sprite_data(8, 4, MC_right);
	ld	de, #_MC_right
	push	de
	ld	hl, #0x408
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:227: set_sprite_data(12, 4, MC_left);
	ld	de, #_MC_left
	push	de
	ld	hl, #0x40c
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:228: set_sprite_data(16, 4, Hector);
	ld	de, #_Hector
	push	de
	ld	hl, #0x410
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:229: set_sprite_data(20, 4, Safy);
	ld	de, #_Safy
	push	de
	ld	hl, #0x414
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:230: set_sprite_data(50, 1, blank);
	ld	de, #_blank
	push	de
	ld	hl, #0x132
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:231: set_sprite_data(51, 8, Lock);
	ld	de, #_Lock
	push	de
	ld	hl, #0x833
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:232: set_sprite_data(59, 2, Key);
	ld	de, #_Key
	push	de
	ld	hl, #0x23b
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:233: set_sprite_data(61, 4, Mythril);
	ld	de, #_Mythril
	push	de
	ld	hl, #0x43d
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:234: set_sprite_data(65, 12, Numbers);
	ld	de, #_Numbers
	push	de
	ld	hl, #0xc41
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:235: set_sprite_data(80, 2, Arrow);
	ld	de, #_Arrow
	push	de
	ld	hl, #0x250
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:236: set_sprite_data(82, 2, Drops);
	ld	de, #_Drops
	push	de
	ld	hl, #0x252
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:237: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:238: set_bkg_data(108, 17, Minimap);
	ld	de, #_Minimap
	push	de
	ld	hl, #0x116c
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:239: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:240: set_bkg_data(128, 51, Text);
	ld	de, #_Text
	push	de
	ld	hl, #0x3380
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:241: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:242: set_bkg_data(179, 9, Textbox);
	ld	de, #_Textbox
	push	de
	ld	hl, #0x9b3
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:243: set_bkg_data(188, 16, Mugshot);
	ld	de, #_Mugshot
	push	de
	ld	hl, #0x10bc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:244: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:245: set_bkg_data(220, 3, MiniGUI);
	ld	de, #_MiniGUI
	push	de
	ld	hl, #0x3dc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:246: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:247: set_bkg_data(225, 20, Objects);
	ld	de, #_Objects
	push	de
	ld	hl, #0x14e1
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:248: set_bkg_data(245, 1, arrow);
	ld	de, #_arrow
	push	de
	ld	hl, #0x1f5
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:249: set_bkg_data(246, 1, black);
	ld	de, #_black
	push	de
	ld	hl, #0x1f6
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:251: if (!load_game()) {
	call	_load_game
	or	a, a
	jr	NZ, 00102$
;main.c:252: insert_name();
	ld	e, #b_insert_name
	ld	hl, #_insert_name
	call	___sdcc_bcall_ehl
00102$:
;main.c:255: set_sprite_data(4, 4, MC_up);
	ld	de, #_MC_up
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:259: if (current_location == 0){
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00104$
;main.c:260: set_camp_map();
	call	_set_camp_map
	jr	00105$
00104$:
;main.c:264: go_into_dungeon();
	call	_go_into_dungeon
00105$:
;main.c:267: if (ng) { // tutorial
	ld	a, (#_ng)
	or	a, a
	jr	Z, 00107$
;main.c:268: set_tutorial();
	call	_set_tutorial
00107$:
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:272: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
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
;main.c:287: move_character();
	call	_move_character
;main.c:288: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:289: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:290: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:291: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:292: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:295: while(1) {
00131$:
;main.c:296: check_open_menu();
	call	_check_open_menu
;main.c:297: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00126$
;main.c:298: check_input_movement();
	call	_check_input_movement
;main.c:299: check_input_keys();
	call	_check_input_keys
;main.c:300: set_mini_menu(); //sus
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:301: change_room();
	call	_change_room
	jp	00127$
00126$:
;main.c:303: else if (menu_opened == 2) {
	ld	a, (#_menu_opened)
	sub	a, #0x02
	jr	NZ, 00123$
;main.c:304: check_menu_options(0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
	jr	00127$
00123$:
;main.c:306: else if (menu_opened == 3) {
	ld	a, (#_menu_opened)
	sub	a, #0x03
	jr	NZ, 00120$
;main.c:307: check_menu_options(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
	jr	00127$
00120$:
;main.c:309: else if (menu_opened == 4) {
	ld	a, (#_menu_opened)
	sub	a, #0x04
	jr	Z, 00127$
;main.c:312: else if (menu_opened == 5) {
	ld	a, (#_menu_opened)
	sub	a, #0x05
	jr	NZ, 00114$
;main.c:313: check_map_options();
	ld	e, #b_check_map_options
	ld	hl, #_check_map_options
	call	___sdcc_bcall_ehl
	jr	00127$
00114$:
;main.c:315: else if (menu_opened == 6) {
	ld	a, (#_menu_opened)
	sub	a, #0x06
	jr	NZ, 00127$
;main.c:316: if (joypad() & J_A || joypad() & J_B) {
	call	_joypad
	bit	4, a
	jr	NZ, 00108$
	call	_joypad
	bit	5, a
	jr	Z, 00109$
00108$:
;main.c:317: DISPLAY_OFF;
	call	_display_off
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:319: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:320: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:321: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:322: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:323: delay(300);
	ld	de, #0x012c
	call	_delay
00109$:
;main.c:325: show_time();
	ld	e, #b_show_time
	ld	hl, #_show_time
	call	___sdcc_bcall_ehl
00127$:
;main.c:328: if (returning_to_camp) {
	ld	hl, #_returning_to_camp
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
;main.c:329: returning_to_camp = 0;
	ld	(hl), #0x00
;main.c:330: return_to_camp();
	call	_return_to_camp
00129$:
;main.c:332: check_time();
	call	_check_time
;main.c:333: wait_vbl_done();
	call	_wait_vbl_done
;main.c:335: }
	jp	00131$
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
_upgrade_costs:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x12	; 18
	.db #0x18	; 24
	.db #0x1e	; 30
_cure_upgrade_costs:
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x11	; 17
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x23	; 35
	.db #0x2a	; 42
	.db #0x32	; 50	'2'
_level_curve:
	.db #0x0c	; 12
	.db #0x19	; 25
	.db #0x26	; 38
	.db #0x34	; 52	'4'
	.db #0x42	; 66	'B'
	.db #0x51	; 81	'Q'
	.db #0x61	; 97	'a'
	.db #0x71	; 113	'q'
	.db #0x78	; 120	'x'
	.db #0x82	; 130
	.db #0x91	; 145
	.db #0xa0	; 160
	.db #0xaf	; 175
	.db #0xbe	; 190
	.db #0xcd	; 205
	.db #0xdc	; 220
	.db #0xeb	; 235
	.db #0xf8	; 248
	.db #0xff	; 255
;main.c:337: void move_character() {
;	---------------------------------
; Function move_character
; ---------------------------------
_move_character::
;main.c:338: move_sprite(4, x, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:339: move_sprite(5, x+8, y);
	ld	a, (_y)
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:340: move_sprite(6, x, y + 8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:341: move_sprite(7, x + 8, y + 8);
	ld	a, (_y)
	add	a, #0x08
	ld	b, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:343: if (y == 144) {
	ld	a, (#_y)
	sub	a, #0x90
	ret	NZ
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x32
;main.c:345: set_sprite_tile(7, 50);
;main.c:348: }
	ret
;main.c:350: void check_input_movement() {
;	---------------------------------
; Function check_input_movement
; ---------------------------------
_check_input_movement::
	dec	sp
;main.c:351: uint8_t moved = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;main.c:353: if (joypad() & J_DOWN) {
	call	_joypad
	bit	3, a
	jp	Z, 00137$
;main.c:354: last_direction = 4;
	ld	hl, #_last_direction
	ld	(hl), #0x04
;main.c:355: set_character_sprite(4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:356: if (check_terrain(x + 8, y + 24) && !is_sprite_at(x, y + 16)) {
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
;main.c:357: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:358: if (!check_enemy(4)) {
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00102$
;main.c:359: last_y = y;
	ld	a, (#_y)
	ld	(#_last_y),a
;main.c:360: last_x = x;
	ld	a, (#_x)
	ld	(#_last_x),a
;main.c:361: smooth_movement(4);
	ld	a, #0x04
	call	_smooth_movement
	jp	00138$
00102$:
;main.c:364: uint8_t enemy_idx = check_enemy(4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;main.c:365: play_attack_animation(4);
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;main.c:366: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;main.c:367: set_character_sprite(4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	jp	00138$
00137$:
;main.c:371: else if (joypad() & J_UP) {
	call	_joypad
	bit	2, a
	jp	Z, 00134$
;main.c:372: set_character_sprite(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:373: if (check_terrain(x + 8, y - 8) && !is_sprite_at(x, y - 16)) {
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
;main.c:374: last_direction = 1;
	ld	hl, #_last_direction
	ld	(hl), #0x01
;main.c:375: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:376: if (!check_enemy(1)) {
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00108$
;main.c:377: last_y = y;
	ld	a, (#_y)
	ld	(#_last_y),a
;main.c:378: last_x = x;
	ld	a, (#_x)
	ld	(#_last_x),a
;main.c:379: smooth_movement(1);
	ld	a, #0x01
	call	_smooth_movement
	jr	00109$
00108$:
;main.c:382: uint8_t enemy_idx = check_enemy(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;main.c:383: play_attack_animation(1);
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;main.c:384: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;main.c:385: set_character_sprite(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
00109$:
;main.c:387: if (current_location == 0 && y <= 40) {
	ld	a, (#_current_location)
	or	a, a
	jp	NZ, 00138$
	ld	a, #0x28
	ld	hl, #_y
	sub	a, (hl)
	jp	C, 00138$
;main.c:388: current_location = 1;
	ld	hl, #_current_location
	ld	(hl), #0x01
;main.c:389: current_floor = 1;
	ld	hl, #_current_floor
	ld	(hl), #0x01
;main.c:390: obt_mythril = 0;
;main.c:391: obt_exp = 0;
	xor	a, a
	ld	(#_obt_mythril), a
	ld	(#_obt_exp),a
;main.c:392: boss.defeated = 1;
	ld	hl, #(_boss + 7)
	ld	(hl), #0x01
;main.c:393: hide_camp_sprites();
	call	_hide_camp_sprites
;main.c:394: save_game();
	call	_save_game
;main.c:395: go_into_dungeon();
	call	_go_into_dungeon
;main.c:396: current_song_bank = 4;
	ld	hl, #_current_song_bank
	ld	(hl), #0x04
;main.c:397: SWITCH_ROM(current_song_bank);
	ld	a, #0x04
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x04
;main.c:398: hUGE_init(&dungeon_theme);
	ld	de, #_dungeon_theme
	call	_hUGE_init
;main.c:399: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;main.c:404: x = 120;
	ld	hl, #_x
	ld	(hl), #0x78
;main.c:405: y = 112;
	ld	hl, #_y
	ld	(hl), #0x70
;main.c:406: return;
	jp	00155$
00134$:
;main.c:410: else if (joypad() & J_LEFT) {
	call	_joypad
	bit	1, a
	jp	Z, 00131$
;main.c:411: last_direction = 8;
	ld	hl, #_last_direction
	ld	(hl), #0x08
;main.c:412: set_character_sprite(8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:413: if (check_terrain(x - 8, y + 8) && !is_sprite_at(x - 16, y)) {
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
;main.c:414: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:415: if (!check_enemy(8)) {
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00117$
;main.c:416: last_y = y;
	ld	a, (#_y)
	ld	(#_last_y),a
;main.c:417: last_x = x;
	ld	a, (#_x)
	ld	(#_last_x),a
;main.c:418: smooth_movement(8);
	ld	a, #0x08
	call	_smooth_movement
	jp	00138$
00117$:
;main.c:421: uint8_t enemy_idx = check_enemy(8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;main.c:422: play_attack_animation(8);
	push	de
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;main.c:423: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;main.c:424: set_character_sprite(8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	jp	00138$
00131$:
;main.c:428: else if (joypad() & J_RIGHT) {
	call	_joypad
	rrca
	jp	NC, 00138$
;main.c:429: set_character_sprite(2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:430: last_direction = 2;
	ld	hl, #_last_direction
	ld	(hl), #0x02
;main.c:431: if (check_terrain(x + 24, y + 8) && !is_sprite_at(x + 16, y)) {
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
;main.c:432: moved = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;main.c:433: if (!check_enemy(2)) {
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	or	a, a
	jr	NZ, 00123$
;main.c:434: last_y = y;
	ld	a, (#_y)
	ld	(#_last_y),a
;main.c:435: last_x = x;
	ld	a, (#_x)
	ld	(#_last_x),a
;main.c:436: smooth_movement(2);
	ld	a, #0x02
	call	_smooth_movement
	jr	00138$
00123$:
;main.c:439: uint8_t enemy_idx = check_enemy(2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_check_enemy
	ld	hl, #_check_enemy
	call	___sdcc_bcall_ehl
	inc	sp
	ld	e, a
;main.c:440: play_attack_animation(2);
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_play_attack_animation
	ld	hl, #_play_attack_animation
	call	___sdcc_bcall_ehl
	inc	sp
	pop	de
;main.c:441: player_attack(0, enemy_idx-1);
	dec	e
	xor	a, a
	call	_player_attack
;main.c:442: set_character_sprite(2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
00138$:
;main.c:447: if (moved) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	Z, 00155$
;main.c:449: check_drops(x, y);
	ld	a, (_y)
	ld	e, a
	ld	a, (_x)
	call	_check_drops
;main.c:450: delay(20);
	ld	de, #0x0014
	call	_delay
;main.c:451: if (current_location == 1) {
	ld	a, (#_current_location)
	dec	a
	jp	NZ, 00155$
;main.c:452: move_enemy(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_move_enemy
;main.c:453: move_enemy(&current_enemies[1]);
	ld	de, #(_current_enemies + 10)
	call	_move_enemy
;main.c:454: move_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_move_boss
	ld	hl, #_move_boss
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:456: if (dungeon[player_coords.x][player_coords.y] == 'E' && x <= 32 && y <= 40 && !boss_battle) {
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
;main.c:457: stairs_sfx();
	ld	e, #b_stairs_sfx
	ld	hl, #_stairs_sfx
	call	___sdcc_bcall_ehl
;main.c:458: go_next_floor();
	call	_go_next_floor
00140$:
;main.c:461: if (current_hp == 0) {
	ld	a, (#_current_hp)
	or	a, a
	jp	NZ, 00155$
;main.c:462: death_sfx();
	ld	e, #b_death_sfx
	ld	hl, #_death_sfx
	call	___sdcc_bcall_ehl
;main.c:463: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:464: current_song_bank = 3;
	ld	hl, #_current_song_bank
	ld	(hl), #0x03
;main.c:465: SWITCH_ROM(current_song_bank);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:466: hUGE_init(&gameover_jingle);
	ld	de, #_gameover_jingle
	call	_hUGE_init
;main.c:467: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:468: game_over();
	ld	e, #b_game_over
	ld	hl, #_game_over
	call	___sdcc_bcall_ehl
;main.c:469: enemy_death(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_enemy_death
;main.c:470: enemy_death(&current_enemies[1]);
	ld	de, #(_current_enemies + 10)
	call	_enemy_death
;main.c:471: boss_death(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_boss_death
	ld	hl, #_boss_death
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:472: boss_floor_defeated = 0;
;main.c:473: boss_battle = 0;
	xor	a, a
	ld	(#_boss_floor_defeated), a
	ld	(#_boss_battle),a
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:475: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:476: set_camp_map();
	call	_set_camp_map
;main.c:477: x = 120;
	ld	hl, #_x
	ld	(hl), #0x78
;main.c:478: y = 112;
	ld	hl, #_y
	ld	(hl), #0x70
;main.c:479: move_character();
	call	_move_character
;main.c:480: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:481: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:482: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00155$:
;main.c:487: }
	inc	sp
	ret
;main.c:489: void check_input_keys() {
;	---------------------------------
; Function check_input_keys
; ---------------------------------
_check_input_keys::
	add	sp, #-9
;main.c:490: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jp	Z, 00178$
;main.c:492: uint8_t gx = (x - 8) / 8;
	ld	a, (_x)
	ld	c, a
	ld	b, #0x00
	ld	de, #0x0008
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#6
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
	jr	Z, 00186$
	ld	hl, #0xffff
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
00186$:
	ldhl	sp,#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#2
	ld	(hl), c
;main.c:493: uint8_t gy = (y - 16) / 8;
	ld	a, (#_y)
	ldhl	sp,	#3
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
	ldhl	sp,	#6
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
	jr	Z, 00187$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff7
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
00187$:
	ldhl	sp,#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#3
	ld	(hl), c
;main.c:495: if (dungeon[player_coords.x][player_coords.y] == 'T' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && treasure_obtained == 0) {
	ld	a, (hl+)
	sub	a, #0x08
	ld	a, #0x00
	rla
	ld	(hl-), a
	ld	a, #0x09
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	a, #0x00
	rla
	ld	(hl), a
;main.c:494: if (current_location == 1) {
	ld	a, (#_current_location)
	dec	a
	jp	NZ, 00170$
;main.c:495: if (dungeon[player_coords.x][player_coords.y] == 'T' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && treasure_obtained == 0) {
	ld	a, (#_player_coords + 0)
	ldhl	sp,#8
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, #0x02
00562$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00562$
	pop	de
	push	de
	ld	hl, #_dungeon
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (#(_player_coords + 1) + 0)
	ld	e, a
	ld	d, #0x00
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x08
	ld	a, #0x00
	rla
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, #0x0b
	ldhl	sp,	#2
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#8
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	sub	a, #0x54
	jr	NZ, 00137$
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00137$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00137$
	ldhl	sp,	#4
	bit	0, (hl)
	jr	NZ, 00137$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00137$
	ld	a, (#_treasure_obtained)
	or	a, a
	jr	NZ, 00137$
;main.c:496: unlock_sfx();
	ld	e, #b_unlock_sfx
	ld	hl, #_unlock_sfx
	call	___sdcc_bcall_ehl
;main.c:497: treasure_obtained = 1;
	ld	hl, #_treasure_obtained
	ld	(hl), #0x01
;main.c:498: minerals++;
	ld	hl, #_minerals
	inc	(hl)
;main.c:499: obt_mythril++;
	ld	hl, #_obt_mythril
	inc	(hl)
;main.c:500: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:501: delay(150);
	ld	de, #0x0096
	call	_delay
;main.c:502: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;main.c:503: set_textbox(2);
	ld	a, #0x02
	call	_set_textbox
	jp	00184$
00137$:
;main.c:505: else if (dungeon[player_coords.x][player_coords.y] == 'K' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && key_obtained == 0) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4b
	jr	NZ, 00129$
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00129$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00129$
	ldhl	sp,	#4
	bit	0, (hl)
	jr	NZ, 00129$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00129$
	ld	a, (#_key_obtained)
	or	a, a
	jr	NZ, 00129$
;main.c:506: unlock_sfx();
	ld	e, #b_unlock_sfx
	ld	hl, #_unlock_sfx
	call	___sdcc_bcall_ehl
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 134)
	ld	(hl), #0x3b
	ld	hl, #(_shadow_OAM + 138)
	ld	(hl), #0x3c
;main.c:509: key_obtained = 1;
	ld	hl, #_key_obtained
	ld	(hl), #0x01
;main.c:510: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:511: delay(150);
	ld	de, #0x0096
	call	_delay
;main.c:512: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;main.c:513: set_textbox(1);
	ld	a, #0x01
	call	_set_textbox
	jp	00184$
00129$:
;main.c:515: else if (dungeon[player_coords.x][player_coords.y] == 'L' && key_obtained == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4c
	jp	NZ, 00125$
	ld	a, (#_key_obtained)
	dec	a
	jp	NZ, 00125$
;main.c:516: switch (locked_door) {
	ld	a, (#_locked_door)
	dec	a
	jr	Z, 00101$
	ld	a, (#_locked_door)
	sub	a, #0x02
	jr	Z, 00106$
	ld	a, (#_locked_door)
	sub	a, #0x04
	jr	Z, 00111$
	ld	a, (#_locked_door)
	sub	a, #0x08
	jr	Z, 00116$
	jp	00121$
;main.c:517: case 1:
00101$:
;main.c:518: if (gx >= 8 && gx <= 11 && gy <= 3) {
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00121$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00121$
	ld	a, #0x03
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00121$
;main.c:519: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;main.c:520: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;main.c:522: break;
	jr	00121$
;main.c:523: case 2:
00106$:
;main.c:524: if (gy >= 8 && gy <= 9 && gx >= 16) {
	ldhl	sp,	#4
	bit	0, (hl)
	jr	NZ, 00121$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00121$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x10
	jr	C, 00121$
;main.c:525: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;main.c:526: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;main.c:528: break;
	jr	00121$
;main.c:529: case 4:
00111$:
;main.c:530: if (gy >= 14 && gx >= 8 && gx <= 11) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0e
	jr	C, 00121$
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00121$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00121$
;main.c:531: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;main.c:532: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;main.c:534: break;
	jr	00121$
;main.c:535: case 8:
00116$:
;main.c:536: if (gx <= 3 && gy >= 8 && gy <= 9) {
	ld	a, #0x03
	ldhl	sp,	#2
	sub	a, (hl)
	jr	C, 00121$
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	NZ, 00121$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00121$
;main.c:537: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;main.c:538: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;main.c:541: }
00121$:
;main.c:542: unlock_sfx();
	ld	e, #b_unlock_sfx
	ld	hl, #_unlock_sfx
	call	___sdcc_bcall_ehl
	jp	00184$
00125$:
;main.c:545: if (num_arrows > 0) {
	ld	a, (#_num_arrows)
	or	a, a
	jp	Z, 00184$
;main.c:546: shoot_arrow();
	call	_shoot_arrow
;main.c:547: num_arrows--;
	ld	hl, #_num_arrows
	dec	(hl)
;main.c:548: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:549: move_enemy(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_move_enemy
;main.c:550: move_enemy(&current_enemies[1]);
	ld	de, #(_current_enemies + 10)
	call	_move_enemy
;main.c:551: move_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_move_boss
	ld	hl, #_move_boss
	call	___sdcc_bcall_ehl
	pop	hl
	jp	00184$
00170$:
;main.c:555: else if (current_location == 0) {
	ld	a, (#_current_location)
	or	a, a
	jp	NZ, 00184$
;main.c:556: if (gx >= 4 && gx <= 5 && gy >= 10 && gy <= 11) {
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0a
	ld	a, #0x00
	rla
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, #0x0b
	ldhl	sp,	#3
	sub	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00162$
	ld	a, #0x05
	sub	a, (hl)
	jr	C, 00162$
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00162$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00162$
;main.c:557: while(joypad() & J_A) { wait_vbl_done(); }
00144$:
	call	_joypad
	bit	4, a
	jr	Z, 00146$
	call	_wait_vbl_done
	jr	00144$
00146$:
;main.c:558: menu_opened = 2;
	ld	hl, #_menu_opened
	ld	(hl), #0x02
;main.c:559: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x20
	ldh	(_WY_REG + 0), a
;main.c:561: set_win_tiles(0, 0, 20, 14, hector_menu);
	ld	de, #_hector_menu
	push	de
	ld	hl, #0xe14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:562: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:563: delay(300);
	ld	de, #0x012c
	call	_delay
	jp	00184$
00162$:
;main.c:565: else if (gx >= 14 && gx <= 15 && gy >= 8 && gy <= 9) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0e
	jr	C, 00156$
	ld	a, #0x0f
	sub	a, (hl)
	jr	C, 00156$
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	NZ, 00156$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00156$
;main.c:566: while(joypad() & J_A) { wait_vbl_done(); }
00147$:
	call	_joypad
	bit	4, a
	jr	Z, 00149$
	call	_wait_vbl_done
	jr	00147$
00149$:
;main.c:567: menu_opened = 3;
	ld	hl, #_menu_opened
	ld	(hl), #0x03
;main.c:568: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x20
	ldh	(_WY_REG + 0), a
;main.c:570: set_win_tiles(0, 0, 20, 14, safy_menu);
	ld	de, #_safy_menu
	push	de
	ld	hl, #0xe14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:571: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:572: delay(300);
	ld	de, #0x012c
	call	_delay
	jr	00184$
00156$:
;main.c:574: else if (gx>=12 && gx <=13 && gy >= 10 && gy <= 11) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0c
	jr	C, 00184$
	ld	a, #0x0d
	sub	a, (hl)
	jr	C, 00184$
	ldhl	sp,	#7
	bit	0, (hl)
	jr	NZ, 00184$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00184$
;main.c:575: save_game();
	call	_save_game
;main.c:576: delay(150);
	ld	de, #0x0096
	call	_delay
;main.c:577: heal_sfx();
	ld	e, #b_heal_sfx
	ld	hl, #_heal_sfx
	call	___sdcc_bcall_ehl
;main.c:578: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;main.c:579: set_textbox(0);
	xor	a, a
	call	_set_textbox
	jr	00184$
00178$:
;main.c:584: else if (joypad() & J_B && current_location == 1) {
	call	_joypad
	bit	5, a
	jr	Z, 00184$
	ld	a, (#_current_location)
	dec	a
	jr	NZ, 00184$
;main.c:585: if (heals > 0) {
	ld	a, (#_heals)
	or	a, a
	jr	Z, 00184$
;main.c:586: heal_sfx();
	ld	e, #b_heal_sfx
	ld	hl, #_heal_sfx
	call	___sdcc_bcall_ehl
;main.c:587: heal_player();
	call	_heal_player
;main.c:588: heals--;
	ld	hl, #_heals
	dec	(hl)
;main.c:589: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:590: move_enemy(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_move_enemy
;main.c:591: move_enemy(&current_enemies[1]);
	ld	de, #(_current_enemies + 10)
	call	_move_enemy
;main.c:592: move_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_move_boss
	ld	hl, #_move_boss
	call	___sdcc_bcall_ehl
	pop	hl
00184$:
;main.c:595: }
	add	sp, #9
	ret
;main.c:598: uint8_t check_terrain(uint8_t new_x, uint8_t new_y) {
;	---------------------------------
; Function check_terrain
; ---------------------------------
_check_terrain::
	add	sp, #-8
	ld	c, a
	ldhl	sp,	#7
	ld	(hl), e
;main.c:600: if (current_location != 0) {
	ld	a, (#_current_location)
	or	a, a
	jr	Z, 00107$
;main.c:601: if (new_x < 8 || new_x > 160 || new_y < 16 || new_y > 152) {
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
;main.c:602: return 1;
	ld	a, #0x01
	jp	00144$
00107$:
;main.c:607: int16_t gx = ((int16_t)new_x - 8) / 8;
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
;main.c:608: int16_t gy = ((int16_t)new_y - 16) / 8;
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
;main.c:610: if (gx < 0 || gx >= 20 || gy < 0 || gy >= 18) {
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
;main.c:611: return 0;
	xor	a, a
	jp	00144$
00109$:
;main.c:614: uint16_t tile_index = (uint16_t)gy * 20 + gx;
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
;main.c:616: if (current_location == 0) {
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00142$
;main.c:617: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:618: uint8_t tile_id = Camp[tile_index];             // collisioni campo
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
;main.c:619: uint8_t camp_colliding = camp_collisions[tile_id];
	ld	hl, #_camp_collisions
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
;main.c:620: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:621: if (camp_colliding == 1) return 0;
	dec	c
	jp	NZ,00143$
	ld	a, c
	jp	00144$
00142$:
;main.c:623: if (dungeon[player_coords.x][player_coords.y] == 'T' || dungeon[player_coords.x][player_coords.y] == 'K') {
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
;main.c:624: if (gx >= 8 && gx <= 11 && gy >= 6 && gy <= 7) {
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
;main.c:625: return 0;
	xor	a, a
	jp	00144$
00121$:
;main.c:628: if (dungeon[player_coords.x][player_coords.y] == 'L' && lock_opened == 0) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4c
	jr	NZ, 00137$
	ld	a, (#_lock_opened)
	or	a, a
	jr	NZ, 00137$
;main.c:629: switch (locked_door) {
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
;main.c:630: case 1:
00123$:
;main.c:631: if (gy <= 1) {
	ldhl	sp,	#2
	ld	a, #0x01
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00137$
;main.c:632: return 0;
	xor	a, a
	jr	00144$
;main.c:635: case 2:
00126$:
;main.c:636: if (gx >= 18) {
	ld	a, c
	sub	a, #0x12
	jr	C, 00137$
;main.c:637: return 0;
	xor	a, a
	jr	00144$
;main.c:640: case 4:
00129$:
;main.c:641: if (gy >= 16) {
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00137$
;main.c:642: return 0;
	xor	a, a
	jr	00144$
;main.c:645: case 8:
00132$:
;main.c:646: if (gx <= 1) {
	ld	a, #0x01
	cp	a, c
	jr	C, 00137$
;main.c:647: return 0;
	xor	a, a
	jr	00144$
;main.c:650: }
00137$:
;main.c:652: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:653: uint8_t tile_id = current_room[tile_index];     // collisioni dungeon
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
;main.c:654: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:655: if (tile_id > 3) return 0;
	ld	a, #0x03
	sub	a, c
	jr	NC, 00143$
	xor	a, a
	jr	00144$
00143$:
;main.c:658: return 1;
	ld	a, #0x01
00144$:
;main.c:659: }
	add	sp, #8
	ret
;main.c:661: uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y) {
;	---------------------------------
; Function is_sprite_at
; ---------------------------------
_is_sprite_at::
	ld	c, a
;main.c:662: if (current_location == 0){
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00105$
;main.c:663: if (target_x == 120 && target_y == 64) {
	ld	a, c
	sub	a, #0x78
	jr	NZ, 00105$
	ld	a, e
	sub	a, #0x40
;main.c:664: return 1;
;main.c:667: return 0;
	ld	a, #0x01
	ret	Z
00105$:
	xor	a, a
;main.c:669: }
	ret
;main.c:671: void set_camp_map(){
;	---------------------------------
; Function set_camp_map
; ---------------------------------
_set_camp_map::
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;main.c:676: set_sprite_data(16, 4, Hector);
	ld	de, #_Hector
	push	de
	ld	hl, #0x410
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:677: set_sprite_data(20, 4, Safy);
	ld	de, #_Safy
	push	de
	ld	hl, #0x414
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:678: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:679: set_bkg_data(0, 108, CampTiles);
	ld	de, #_CampTiles
	push	de
	ld	hl, #0x6c00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:680: set_bkg_tiles(0, 0, 20, 18, Camp);
	ld	de, #_Camp
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:681: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
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
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x28
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x30
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x28
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x30
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x78
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x80
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x78
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x80
;main.c:704: empty_map_tiles();
	ld	e, #b_empty_map_tiles
	ld	hl, #_empty_map_tiles
	call	___sdcc_bcall_ehl
;main.c:705: current_song_bank = 5;
	ld	hl, #_current_song_bank
	ld	(hl), #0x05
;main.c:706: SWITCH_ROM(current_song_bank);
	ld	a, #0x05
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x05
;main.c:707: hUGE_init(&camp_theme);
	ld	de, #_camp_theme
	call	_hUGE_init
;main.c:708: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:709: }
	ret
;main.c:712: void hide_camp_sprites() {
;	---------------------------------
; Function hide_camp_sprites
; ---------------------------------
_hide_camp_sprites::
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
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
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:731: move_sprite(15, 00, 0);
;main.c:732: }
	ret
;main.c:734: void set_dungeon_map(){
;	---------------------------------
; Function set_dungeon_map
; ---------------------------------
_set_dungeon_map::
;main.c:735: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;main.c:736: set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles);
	ld	bc, #_DungeonTiles+0
	push	bc
	ld	hl, #0x3500
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:737: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:738: }
	ret
;main.c:740: void set_room(Coords coord){
;	---------------------------------
; Function set_room
; ---------------------------------
_set_room::
	add	sp, #-4
;main.c:741: uint8_t door = doors[coord.x][coord.y];
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
;main.c:743: set_room_tiles(door, room_ptr, coord);
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
;main.c:744: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
	pop	bc
;main.c:745: if (dungeon[coord.x][coord.y] == 'K') {
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
;main.c:746: if (key_obtained == 0){
	ld	a, (#_key_obtained)
	or	a, a
	jr	NZ, 00102$
;main.c:747: set_bkg_tiles(8, 6, 4, 2, chest_closed);
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
;main.c:750: set_bkg_tiles(8, 6, 4, 2, chest_opened);
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
;main.c:753: else if (dungeon[coord.x][coord.y] == 'L') {
	cp	a, #0x4c
	jr	NZ, 00121$
;main.c:754: if (lock_opened == 0) {
	ld	a, (#_lock_opened)
	or	a, a
	jp	NZ, 00125$
;main.c:755: switch (locked_door) {
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
;main.c:756: case 1:
00104$:
;main.c:757: draw_lock_v(72, 16);
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
;main.c:758: break;
	jp	00125$
;main.c:759: case 2:
00105$:
;main.c:760: draw_lock_h(152, 80);
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
;main.c:761: break;
	jr	00125$
;main.c:762: case 4:
00106$:
;main.c:763: draw_flip_lock_v(72, 144);
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
;main.c:764: break;
	jr	00125$
;main.c:765: case 8:
00107$:
;main.c:766: draw_flip_lock_h(8, 80);
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
;main.c:768: }
	jr	00125$
00121$:
;main.c:771: else if (dungeon[coord.x][coord.y] == 'T') {
	cp	a, #0x54
	jr	NZ, 00118$
;main.c:772: if (treasure_obtained == 0){
	ld	a, (#_treasure_obtained)
	or	a, a
	jr	NZ, 00112$
;main.c:773: set_bkg_tiles(8, 6, 4, 2, chest_closed);
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
;main.c:776: set_bkg_tiles(8, 6, 4, 2, chest_opened);
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
;main.c:779: else if (dungeon[coord.x][coord.y] == 'E' && current_floor % 5 != 0) {
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
;main.c:780: set_bkg_tiles(2, 2, 2, 2, stairs);
	ld	de, #_stairs
	push	de
	ld	hl, #0x202
	push	hl
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00125$:
;main.c:783: spawn_enemies_in_room(coord.x, coord.y, current_enemies);
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
	pop	bc
;main.c:784: if (dungeon[coord.x][coord.y] != 'E') {
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
;main.c:785: set_enemy_sprite();
	call	_set_enemy_sprite
	jp	00132$
00131$:
;main.c:787: else if (current_floor % 5 == 0 && boss_floor_defeated == 0) {
	ld	a, (_current_floor)
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	or	a, a
	jr	NZ, 00132$
	ld	a, (#_boss_floor_defeated)
	or	a, a
	jr	NZ, 00132$
;main.c:788: boss_battle = 1;
	ld	hl, #_boss_battle
	ld	(hl), #0x01
;main.c:789: spawn_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_spawn_boss
	ld	hl, #_spawn_boss
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:790: smooth_movement(last_direction);
	ld	a, (_last_direction)
	call	_smooth_movement
;main.c:791: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
	ld	de, #0x0000
00134$:
;main.c:792: for (uint16_t i; i<360; i++) {
	ld	c, e
	ld	b, d
	ld	a, c
	sub	a, #0x68
	ld	a, b
	sbc	a, #0x01
	jr	NC, 00126$
;main.c:793: current_room[i] = NoExit[i];
	ld	hl, #_current_room
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_NoExit
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;main.c:792: for (uint16_t i; i<360; i++) {
	inc	de
	jr	00134$
00126$:
;main.c:795: set_bkg_tiles(0, 0, 20, 18, current_room);
	ld	de, #_current_room
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:796: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:797: current_song_bank = 4;
	ld	hl, #_current_song_bank
	ld	(hl), #0x04
;main.c:798: SWITCH_ROM(current_song_bank);
	ld	a, #0x04
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x04
;main.c:799: hUGE_init(&boss_theme);
	ld	de, #_boss_theme
	call	_hUGE_init
;main.c:800: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
00132$:
;main.c:802: clear_drops();
	call	_clear_drops
;main.c:803: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:804: }
	add	sp, #4
	pop	hl
	pop	af
	jp	(hl)
;main.c:806: void change_room() {
;	---------------------------------
; Function change_room
; ---------------------------------
_change_room::
;main.c:807: if (x > 160 && x < 240) {
	ld	a, #0xa0
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00110$
	ld	a, (hl)
	sub	a, #0xf0
	jr	NC, 00110$
;main.c:808: player_coords.x++;
	ld	hl, #_player_coords
	inc	(hl)
	ld	a, (hl)
;main.c:809: x = 8;
	ld	hl, #_x
	ld	(hl), #0x08
;main.c:810: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00110$:
;main.c:812: else if (x > 240) {
	ld	a, #0xf0
	ld	hl, #_x
	sub	a, (hl)
	jr	NC, 00107$
;main.c:813: player_coords.x--;
	ld	hl, #_player_coords
	dec	(hl)
	ld	a, (hl)
;main.c:814: x = 152;
	ld	hl, #_x
	ld	(hl), #0x98
;main.c:815: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00107$:
;main.c:817: else if (y > 144) {
	ld	a, #0x90
	ld	hl, #_y
	sub	a, (hl)
	jr	NC, 00104$
;main.c:818: player_coords.y++;
	ld	hl, #_player_coords + 1
	inc	(hl)
	ld	a, (hl)
;main.c:819: y = 16;
	ld	hl, #_y
	ld	(hl), #0x10
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;main.c:822: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
	jp	_move_character
00104$:
;main.c:824: else if (y < 8) {
	ld	a, (#_y)
	sub	a, #0x08
	jp	NC, _move_character
;main.c:825: player_coords.y--;
	ld	hl, #_player_coords + 1
	dec	(hl)
	ld	a, (hl)
;main.c:826: y = 144;
	ld	hl, #_y
	ld	(hl), #0x90
;main.c:827: set_room(player_coords);
	ld	hl, #_player_coords
	inc	hl
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;main.c:829: move_character();
;main.c:830: }
	jp	_move_character
;main.c:833: void check_open_menu() {
;	---------------------------------
; Function check_open_menu
; ---------------------------------
_check_open_menu::
;main.c:834: current_joypad = joypad();
	call	_joypad
	ld	hl, #_current_joypad
	ld	(hl), a
;main.c:835: if ((current_joypad & J_START) && !(last_joypad & J_START)) {
	ld	a, (hl)
	rlca
	jr	NC, 00107$
	ld	a, (_last_joypad)
	rlca
	jr	C, 00107$
;main.c:836: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00104$
;main.c:837: DISPLAY_OFF;
	call	_display_off
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;main.c:839: set_win_tiles(0, 0, 20, 18, gui_map);
	ld	de, #_gui_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:840: set_stats();
	ld	e, #b_set_stats
	ld	hl, #_set_stats
	call	___sdcc_bcall_ehl
;main.c:841: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:842: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:843: menu_opened = 1;
	ld	hl, #_menu_opened
	ld	(hl), #0x01
	jr	00107$
00104$:
;main.c:845: else if (menu_opened == 1) {
	ld	a, (#_menu_opened)
	dec	a
	jr	NZ, 00107$
;main.c:846: DISPLAY_OFF;
	call	_display_off
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:848: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:850: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:851: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:852: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00107$:
;main.c:855: if ((current_joypad & J_SELECT) && !(last_joypad & J_SELECT)) {
	ld	a, (_current_joypad)
	bit	6, a
	jp	Z, 00115$
	ld	a, (_last_joypad)
	bit	6, a
	jp	NZ, 00115$
;main.c:856: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00112$
;main.c:857: DISPLAY_OFF;
	call	_display_off
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;main.c:859: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:860: set_win_tiles(0, 0, 20, 18, map_menu);
	ld	de, #_map_menu
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:861: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:862: set_map_menu();
	ld	e, #b_set_map_menu
	ld	hl, #_set_map_menu
	call	___sdcc_bcall_ehl
;main.c:863: map_option = 0;
	xor	a, a
	ld	(#_map_option),a
;main.c:864: set_win_tiles(2, 4, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x402
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:865: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:866: menu_opened = 5;
	ld	hl, #_menu_opened
	ld	(hl), #0x05
;main.c:867: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00115$
00112$:
;main.c:869: else if (menu_opened == 5) {
	ld	a, (#_menu_opened)
	sub	a, #0x05
	jr	NZ, 00115$
;main.c:870: DISPLAY_OFF;
	call	_display_off
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:872: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:874: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:875: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:876: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00115$:
;main.c:879: last_joypad = current_joypad;
	ld	a, (#_current_joypad)
	ld	(#_last_joypad),a
;main.c:880: }
	ret
;main.c:883: void go_into_dungeon() {
;	---------------------------------
; Function go_into_dungeon
; ---------------------------------
_go_into_dungeon::
	add	sp, #-6
;main.c:884: wait_vbl_done();
	call	_wait_vbl_done
;main.c:885: DISPLAY_OFF;
	call	_display_off
;main.c:886: set_dungeon_map();
	call	_set_dungeon_map
;main.c:887: generate_dungeon(current_floor);
	ld	a, (_current_floor)
	push	af
	inc	sp
	ld	e, #b_generate_dungeon
	ld	hl, #_generate_dungeon
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:889: for (int i = 0; i < 4; i++) {
	ld	bc, #0x0000
00111$:
;main.c:890: for (int j = 0; j < 4; j++) {
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
;main.c:891: if (dungeon[i][j] == 'S') {
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
;main.c:892: start.x = i;
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:893: start.y = j;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;main.c:894: player_coords.x = i;
	ld	de, #_player_coords
	push	af
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	pop	af
;main.c:895: player_coords.y = j;
	ld	de, #_player_coords + 1
	ld	(de), a
00109$:
;main.c:890: for (int j = 0; j < 4; j++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00108$
00112$:
;main.c:889: for (int i = 0; i < 4; i++) {
	inc	bc
	jr	00111$
00104$:
;main.c:899: set_room(start);
	ld	hl,#0x1
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;main.c:900: if (max_floor == 0) {
	ld	hl, #_max_floor
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
;main.c:901: max_floor = 1;
	ld	(hl), #0x01
00113$:
;main.c:903: }
	add	sp, #6
	ret
;main.c:905: void go_next_floor() {
;	---------------------------------
; Function go_next_floor
; ---------------------------------
_go_next_floor::
	add	sp, #-6
;main.c:906: current_floor++;
	ld	hl, #_current_floor
	inc	(hl)
;main.c:907: if (current_floor % 5 == 0) {
	ld	a, (hl)
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;main.c:908: boss.defeated = 1;
	ld	hl, #(_boss + 7)
	ld	(hl), #0x01
;main.c:909: boss_floor_defeated = 0;
	xor	a, a
	ld	(#_boss_floor_defeated),a
00102$:
;main.c:911: if (current_floor > max_floor) {
	ld	a, (#_max_floor)
	ld	hl, #_current_floor
	sub	a, (hl)
	jr	NC, 00104$
;main.c:912: max_floor = current_floor;
	ld	a, (hl)
	ld	(#_max_floor),a
00104$:
;main.c:914: key_obtained = 0;
;main.c:915: treasure_obtained = 0;
	xor	a, a
	ld	(#_key_obtained), a
	ld	(#_treasure_obtained),a
;main.c:916: lock_opened = 0;
	xor	a, a
	ld	(#_lock_opened),a
;main.c:917: generate_dungeon(current_floor);
	ld	a, (_current_floor)
	push	af
	inc	sp
	ld	e, #b_generate_dungeon
	ld	hl, #_generate_dungeon
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:919: for (int i = 0; i < 4; i++) {
	ld	bc, #0x0000
00113$:
;main.c:920: for (int j = 0; j < 4; j++) {
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
;main.c:921: if (dungeon[i][j] == 'S') {
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
;main.c:922: start.x = i;
	ldhl	sp,	#4
	ld	(hl), c
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:923: start.y = j;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;main.c:924: player_coords.x = i;
	ld	de, #_player_coords
	push	af
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	pop	af
;main.c:925: player_coords.y = j;
	ld	de, #_player_coords + 1
	ld	(de), a
00111$:
;main.c:920: for (int j = 0; j < 4; j++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00110$
00114$:
;main.c:919: for (int i = 0; i < 4; i++) {
	inc	bc
	jr	00113$
00108$:
;main.c:929: set_room(start);
	ld	hl,#0x1
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_room
;main.c:930: }
	add	sp, #6
	ret
;main.c:937: void set_textbox(uint8_t item) {
;	---------------------------------
; Function set_textbox
; ---------------------------------
_set_textbox::
	ld	c, a
;main.c:938: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x68
	ldh	(_WY_REG + 0), a
;main.c:940: if (item == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00110$
;main.c:941: set_win_tiles(0, 0, 20, 5, game_saved);
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
;main.c:944: move_sprite(33, x, y-32);
	ld	a, (_y)
	ld	hl, #_x
	ld	l, (hl)
	add	a, #0xe0
	ld	e, a
;main.c:943: else if (item == 1) {
	ld	a, c
	dec	a
	jr	NZ, 00107$
;main.c:944: move_sprite(33, x, y-32);
	ld	c, l
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 132)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:945: move_sprite(34, x+8, y-32);
	ld	a, (_y)
	add	a, #0xe0
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 136)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:946: set_win_tiles(0, 0, 20, 5, obtained_key);
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
;main.c:948: else if (item == 2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:949: move_sprite(35, x, y-32);
	ld	c, l
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 140)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:950: move_sprite(36, x+8, y-32);
	ld	a, (_y)
	add	a, #0xe0
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 144)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:951: move_sprite(37, x, y-24);
	ld	a, (_y)
	add	a, #0xe8
	ld	b, a
	ld	a, (_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 148)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:952: move_sprite(38, x+8, y-24);
	ld	a, (_y)
	add	a, #0xe8
	ld	e, a
	ld	a, (_x)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 152)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:953: set_win_tiles(0, 0, 20, 5, obtained_mythril);
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
;main.c:955: else if (item == 3) {
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00111$
;main.c:956: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:957: set_win_tiles(0, 0, 20, 5, boss_defeated);
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
;main.c:960: wait_vbl_done();
	call	_wait_vbl_done
;main.c:962: while(!(joypad() & (J_A))) {
00112$:
	call	_joypad
	bit	4, a
	jr	NZ, 00115$
;main.c:963: wait_vbl_done();
	call	_wait_vbl_done
	jr	00112$
;main.c:966: while(joypad() & (J_A)) {
00115$:
	call	_joypad
	bit	4, a
	jr	Z, 00117$
;main.c:967: wait_vbl_done();
	call	_wait_vbl_done
	jr	00115$
00117$:
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 132)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 136)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 140)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 144)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 148)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 152)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:976: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:977: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:978: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
;main.c:979: }
	jp  ___sdcc_bcall_ehl
;main.c:983: void player_attack(uint8_t wpn, uint8_t index) {
;	---------------------------------
; Function player_attack
; ---------------------------------
_player_attack::
	add	sp, #-7
	ld	c, a
	ldhl	sp,	#6
	ld	(hl), e
;main.c:984: hit_sfx();
	push	bc
	ld	e, #b_hit_sfx
	ld	hl, #_hit_sfx
	call	___sdcc_bcall_ehl
	pop	bc
;main.c:987: if (wpn == 0) { // spada
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;main.c:988: atk_stat = attack;
	ld	a, (_attack)
	ld	c, a
	jr	00103$
00102$:
;main.c:991: atk_stat = arrow_damage;
	ld	a, (_arrow_damage)
	ld	c, a
00103$:
;main.c:993: if (index == 2) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x02
	jp	NZ, 00113$
;main.c:994: if (atk_stat > boss.def) {
	ld	hl, #_boss + 5
	ld	b, (hl)
	ld	a, b
	sub	a, c
	jr	NC, 00105$
;main.c:995: damage = atk_stat - boss.def;
	ld	a, c
	sub	a, b
	ld	c, a
	jr	00106$
00105$:
;main.c:998: damage = 1;
	ld	c, #0x01
00106$:
;main.c:1000: show_number(damage, 0, 1, index);
	push	bc
	ldhl	sp,	#8
	ld	h, (hl)
	ld	l, #0x01
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	e, #b_show_number
	ld	hl, #_show_number
	call	___sdcc_bcall_ehl
	add	sp, #4
	pop	bc
;main.c:1001: if (damage < boss.hp) {
	ld	de, #_boss + 3
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	jr	NC, 00108$
;main.c:1002: boss.hp -= damage;
	ld	a, b
	sub	a, c
	ld	(de), a
	jr	00109$
00108$:
;main.c:1005: boss.hp = 0;
	xor	a, a
	ld	(de), a
00109$:
;main.c:1007: if (boss.hp == 0) {
	ld	a, (de)
	or	a, a
	jp	NZ, 00122$
;main.c:1008: enemy_death_sfx();
	ld	e, #b_enemy_death_sfx
	ld	hl, #_enemy_death_sfx
	call	___sdcc_bcall_ehl
;main.c:1009: uint8_t b_x = boss.x;
	ld	hl, #_boss + 1
	ld	c, (hl)
;main.c:1010: uint8_t b_y = boss.y;
	ld	hl, #_boss + 2
	ld	b, (hl)
;main.c:1011: boss_death(&boss);
	push	bc
	ld	de, #_boss
	push	de
	ld	e, #b_boss_death
	ld	hl, #_boss_death
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:1012: set_character_sprite(last_direction);
	ld	a, (_last_direction)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	pop	bc
;main.c:1013: wait_vbl_done();
	call	_wait_vbl_done
;main.c:1014: play_explosion_animation(b_x, b_y);
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	e, #b_play_explosion_animation
	ld	hl, #_play_explosion_animation
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:1015: boss_floor_defeated = 1;
	ld	hl, #_boss_floor_defeated
	ld	(hl), #0x01
;main.c:1016: boss_battle = 0;
	xor	a, a
	ld	(#_boss_battle),a
;main.c:1017: enemies_defeated++;
	ld	hl, #_enemies_defeated
	inc	(hl)
;main.c:1018: experience += boss.exp_reward;
	ld	a, (#(_boss + 6) + 0)
	ld	hl, #_experience
	add	a, (hl)
	ld	(hl), a
;main.c:1019: minerals+=2;
	ld	a, (_minerals)
	add	a, #0x02
	ld	(#_minerals),a
;main.c:1020: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;main.c:1021: current_song_bank = 3;
	ld	hl, #_current_song_bank
	ld	(hl), #0x03
;main.c:1022: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:1023: hUGE_init(&boss_defeated_jingle);
	ld	de, #_boss_defeated_jingle
	call	_hUGE_init
;main.c:1024: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:1025: set_textbox(3);
	ld	a, #0x03
	call	_set_textbox
;main.c:1026: uint8_t door = doors[player_coords.x][player_coords.y];
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
;main.c:1028: set_room_tiles(door, room_ptr, player_coords);
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
;main.c:1029: set_bkg_tiles(2, 2, 2, 2, stairs);
	ld	de, #_stairs
	push	de
	ld	hl, #0x202
	push	hl
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:1030: current_song_bank = 4;
	ld	hl, #_current_song_bank
	ld	(hl), #0x04
;main.c:1031: SWITCH_ROM(current_song_bank);
	ld	a, #0x04
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x04
;main.c:1032: hUGE_init(&dungeon_theme);
	ld	de, #_dungeon_theme
	call	_hUGE_init
;main.c:1033: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:1035: return;
	jp	00122$
00113$:
;main.c:1039: if (atk_stat > current_enemies[index].def) {
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	de, #_current_enemies
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
	sub	a, c
	jr	NC, 00115$
;main.c:1040: damage = atk_stat - current_enemies[index].def;
	ld	a, c
	sub	a, b
	ld	b, a
	jr	00116$
00115$:
;main.c:1043: damage = 1;
	ld	b, #0x01
00116$:
;main.c:1045: show_number(damage, 0, 1, index);
	push	bc
	ldhl	sp,	#8
	ld	h, (hl)
	ld	l, #0x01
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	e, #b_show_number
	ld	hl, #_show_number
	call	___sdcc_bcall_ehl
	add	sp, #4
	pop	bc
;main.c:1046: if (damage < current_enemies[index].hp) {
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	a, (de)
	ld	c, a
	ld	a, b
	sub	a, c
	jr	NC, 00118$
;main.c:1047: current_enemies[index].hp -= damage;
	ld	a, c
	sub	a, b
	ld	(de), a
	jr	00119$
00118$:
;main.c:1050: current_enemies[index].hp = 0;
	xor	a, a
	ld	(de), a
;main.c:1051: current_enemies[index].alive = 0;
	push	de
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
00119$:
;main.c:1053: if (current_enemies[index].hp == 0) {
	ld	a, (de)
	or	a, a
	jr	NZ, 00122$
;main.c:1054: uint8_t e_x = current_enemies[index].x;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;main.c:1055: uint8_t e_y = current_enemies[index].y;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	inc	hl
	ld	b, (hl)
;main.c:1056: set_character_sprite(last_direction);
	push	bc
	ld	a, (_last_direction)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
	pop	bc
;main.c:1057: wait_vbl_done();
	call	_wait_vbl_done
;main.c:1058: enemy_death(&current_enemies[index]);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	call	_enemy_death
;main.c:1059: enemy_death_sfx();
	ld	e, #b_enemy_death_sfx
	ld	hl, #_enemy_death_sfx
	call	___sdcc_bcall_ehl
	pop	bc
;main.c:1060: play_explosion_animation(e_x, e_y);
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	e, #b_play_explosion_animation
	ld	hl, #_play_explosion_animation
	call	___sdcc_bcall_ehl
	pop	hl
;main.c:1061: enemies_defeated++;
	ld	hl, #_enemies_defeated
	inc	(hl)
;main.c:1062: experience += current_enemies[index].exp_reward;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	hl, #_experience
	add	a, (hl)
	ld	(hl), a
00122$:
;main.c:1064: }
	add	sp, #7
	ret
;main.c:1068: void shoot_arrow() {
;	---------------------------------
; Function shoot_arrow
; ---------------------------------
_shoot_arrow::
	add	sp, #-3
;main.c:1069: arrow_sfx();
	ld	e, #b_arrow_sfx
	ld	hl, #_arrow_sfx
	call	___sdcc_bcall_ehl
;main.c:1070: uint8_t arrow_x = x;
	ld	a, (_x)
	ld	c, a
;main.c:1071: uint8_t arrow_y = y;
	ld	a, (_y)
	ld	b, a
;main.c:1072: switch (last_direction) {
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
	jr	00126$
;main.c:1073: case 1:
00101$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1076: break;
	jr	00126$
;main.c:1077: case 2:
00102$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x51
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1080: break;
	jr	00126$
;main.c:1081: case 4:
00103$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:1084: break;
	jr	00126$
;main.c:1085: case 8:
00104$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x51
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1090: while (1) {
00126$:
;main.c:1091: wait_vbl_done();
	call	_wait_vbl_done
;main.c:1094: arrow_y-=2;
	ld	e, b
;main.c:1092: switch (last_direction) {
	ld	a, (#_last_direction)
	dec	a
	jr	Z, 00106$
;main.c:1097: arrow_x+=2;
	ld	d, c
;main.c:1092: switch (last_direction) {
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
;main.c:1093: case 1:
00106$:
;main.c:1094: arrow_y-=2;
	ld	b, e
	dec	b
	dec	b
;main.c:1095: break;
	jr	00110$
;main.c:1096: case 2:
00107$:
;main.c:1097: arrow_x+=2;
	ld	c, d
	inc	c
	inc	c
;main.c:1098: break;
	jr	00110$
;main.c:1099: case 4:
00108$:
;main.c:1100: arrow_y+=2;
	ld	b, e
	inc	b
	inc	b
;main.c:1101: break;
	jr	00110$
;main.c:1102: case 8:
00109$:
;main.c:1103: arrow_x-=2;
	ld	c, d
	dec	c
	dec	c
;main.c:1105: }
00110$:
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 156)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:1107: if (arrow_x < 1 || arrow_x > 168 || arrow_y > 144 || arrow_y < 8) {
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
	jr	NC, 00112$
00111$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
	ld	(hl), #0x32
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	dec	hl
	dec	hl
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:1110: return;
	jp	00146$
00112$:
;main.c:1112: for (int i=0; i<2; i++) {
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
00144$:
	ldhl	sp,	#1
	ld	a, (hl+)
	sub	a, #0x02
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00119$
;main.c:1113: uint8_t enemy_x = current_enemies[i].x;
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_current_enemies
	add	hl, de
;main.c:1114: uint8_t enemy_y = current_enemies[i].y;
	ld	a, (hl+)
	ld	e, (hl)
;main.c:1115: if (arrow_x == enemy_x && arrow_y == enemy_y) {
	sub	a, c
	jr	NZ, 00145$
	ld	a, b
	sub	a, e
	jr	NZ, 00145$
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;main.c:1117: move_sprite(39, x, y);
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x32
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
;main.c:1118: player_attack(1, i); // arrow atk
	ldhl	sp,	#0
	ld	e, (hl)
	ld	a, #0x01
	call	_player_attack
;main.c:1119: return;
	jr	00146$
00145$:
;main.c:1112: for (int i=0; i<2; i++) {
	ldhl	sp,	#1
	inc	(hl)
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(hl), a
	jr	00144$
00119$:
;main.c:1122: if ((arrow_x == boss.x || arrow_x == boss.x+16) && (arrow_y == boss.y || arrow_y == boss.y + 16)) {
	ld	a, (#(_boss + 1) + 0)
	cp	a, c
	jr	Z, 00124$
	ld	h, #0x00
	ld	l, a
	ld	de, #0x0010
	add	hl, de
	ld	e, c
	ld	d, #0x00
	ld	a, l
	sub	a, e
	jp	NZ, 00126$
	ld	a, h
	sub	a, d
	jp	NZ, 00126$
00124$:
	ld	a, (#(_boss + 2) + 0)
	cp	a, b
	jr	Z, 00120$
	ld	h, #0x00
	ld	l, a
	ld	de, #0x0010
	add	hl, de
	ld	e, b
	ld	d, #0x00
	ld	a, l
	sub	a, e
	jp	NZ, 00126$
	ld	a, h
	sub	a, d
	jp	NZ, 00126$
00120$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 158)
;main.c:1124: move_sprite(39, x, y);
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x32
	ld	(hl-), a
	dec	hl
	ld	a, (_y)
	ld	c, a
	ld	a, (_x)
	ld	b, a
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:1125: player_attack(1, 2);
	ld	e, #0x02
	ld	a, #0x01
	call	_player_attack
;main.c:1126: return;
00146$:
;main.c:1129: }
	add	sp, #3
	ret
;main.c:1131: void heal_player() {
;	---------------------------------
; Function heal_player
; ---------------------------------
_heal_player::
;main.c:1132: uint8_t heal = heal_quantity;
	ld	a, (_heal_quantity)
	ld	b, a
;main.c:1133: current_hp += heal;
	ld	hl, #_current_hp
	ld	a, (hl)
	add	a, b
;main.c:1134: if (current_hp >= max_hp) {
	ld	(hl), a
	ld	hl, #_max_hp
	sub	a, (hl)
	jr	C, 00102$
;main.c:1135: heal = heal_quantity - (current_hp - max_hp);
	ld	a, (#_current_hp)
	ld	hl, #_max_hp
	sub	a, (hl)
	ld	c, a
	ld	a, (#_heal_quantity)
	sub	a, c
	ld	b, a
;main.c:1136: current_hp = max_hp;
	ld	a, (#_max_hp)
	ld	(#_current_hp),a
00102$:
;main.c:1138: play_heal_animation();
	push	bc
	ld	e, #b_play_heal_animation
	ld	hl, #_play_heal_animation
	call	___sdcc_bcall_ehl
	pop	bc
;main.c:1139: show_number(heal, 1, 0, 0);
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
;main.c:1140: }
	ret
;main.c:1143: void smooth_movement(uint8_t dir) {
;	---------------------------------
; Function smooth_movement
; ---------------------------------
_smooth_movement::
	add	sp, #-11
	ldhl	sp,	#9
	ld	(hl), a
;main.c:1145: mov_x = x;
	ld	a, (#_x)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:1146: mov_y = y;
	ld	a, (#_y)
	ldhl	sp,	#1
	ld	(hl), a
;main.c:1148: switch (dir) {
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
;main.c:1150: y-=16;
	ld	a, (_y)
	ld	d, a
;main.c:1148: switch (dir) {
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
;main.c:1153: x+=16;
	ld	a, (_x)
;main.c:1148: switch (dir) {
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
;main.c:1149: case 1:
00101$:
;main.c:1150: y-=16;
	ld	a, d
	add	a, #0xf0
	ld	(#_y),a
;main.c:1151: break;
	jr	00105$
;main.c:1152: case 2:
00102$:
;main.c:1153: x+=16;
	add	a, #0x10
	ld	(#_x),a
;main.c:1154: break;
	jr	00105$
;main.c:1155: case 4:
00103$:
;main.c:1156: y+=16;
	ld	a, d
	add	a, #0x10
	ld	(#_y),a
;main.c:1157: break;
	jr	00105$
;main.c:1158: case 8:
00104$:
;main.c:1159: x-=16;
	add	a, #0xf0
	ld	(#_x),a
;main.c:1161: }
00105$:
;main.c:1163: play_walk_animation(dir);
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
;main.c:1165: while (frame < 16) {
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
;main.c:1166: if (frame > 7) {
	ld	a, #0x07
	sub	a, (hl)
	jr	NC, 00107$
;main.c:1167: set_character_sprite(dir);
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_set_character_sprite
	ld	hl, #_set_character_sprite
	call	___sdcc_bcall_ehl
	inc	sp
00107$:
;main.c:1169: if (mov_y >= 136) {
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x88
	jr	C, 00116$
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x32
;main.c:1171: set_sprite_tile(7, 50);
	jr	00117$
00116$:
;main.c:1173: else if (mov_y == 134){
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x86
	jr	NZ, 00117$
;main.c:1174: switch (dir) {
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
;main.c:1175: case 1:
00108$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x06
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x07
;main.c:1178: break;
	jr	00117$
;main.c:1179: case 2:
00109$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x0b
;main.c:1182: break;
	jr	00117$
;main.c:1183: case 4:
00110$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x03
;main.c:1186: break;
	jr	00117$
;main.c:1187: case 8:
00111$:
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x0e
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x0f
;main.c:1191: }
00117$:
;main.c:1193: wait_vbl_done();
	call	_wait_vbl_done
;main.c:1196: mov_y-=1;
	ldhl	sp,	#1
;main.c:1194: switch (dir) {
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
;main.c:1199: mov_x+=1;
	dec	hl
	dec	hl
	ld	b, (hl)
;main.c:1194: switch (dir) {
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
;main.c:1195: case 1:
00118$:
;main.c:1196: mov_y-=1;
	ld	a, c
	dec	a
	ldhl	sp,	#1
	ld	(hl), a
;main.c:1197: break;
	jr	00122$
;main.c:1198: case 2:
00119$:
;main.c:1199: mov_x+=1;
	ld	a, b
	inc	a
	ldhl	sp,	#0
	ld	(hl), a
;main.c:1200: break;
	jr	00122$
;main.c:1201: case 4:
00120$:
;main.c:1202: mov_y+=1;
	ld	a, c
	inc	a
	ldhl	sp,	#1
	ld	(hl), a
;main.c:1203: break;
	jr	00122$
;main.c:1204: case 8:
00121$:
;main.c:1205: mov_x-=1;
	ld	a, b
	dec	a
	ldhl	sp,	#0
	ld	(hl), a
;main.c:1207: }
00122$:
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 16)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:1209: move_sprite(5, mov_x+8, mov_y);
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
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
;main.c:1210: move_sprite(6, mov_x, mov_y + 8);
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
	ld	e, b
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 25)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:1212: frame++;
	ldhl	sp,	#10
	inc	(hl)
	jp	00123$
00140$:
;main.c:1215: }
	add	sp, #11
	ret
;main.c:1221: void check_time() {
;	---------------------------------
; Function check_time
; ---------------------------------
_check_time::
;main.c:1222: frames++;
	ld	hl, #_frames
	inc	(hl)
;main.c:1223: if (frames == 60) {
	ld	a, (hl)
	sub	a, #0x3c
	jr	NZ, 00102$
;main.c:1224: frames = 0;
	xor	a, a
	ld	(#_frames),a
;main.c:1225: seconds++;
	ld	hl, #_seconds
	inc	(hl)
00102$:
;main.c:1227: if (seconds == 60) {
	ld	a, (#_seconds)
	sub	a, #0x3c
	jr	NZ, 00104$
;main.c:1228: seconds = 0;
	xor	a, a
	ld	(#_seconds),a
;main.c:1229: minutes++;
	ld	hl, #_minutes
	inc	(hl)
00104$:
;main.c:1231: if (minutes == 60) {
	ld	a, (#_minutes)
	sub	a, #0x3c
	jr	NZ, 00106$
;main.c:1232: minutes = 0;
	xor	a, a
	ld	(#_minutes),a
;main.c:1233: hours++;
	ld	hl, #_hours
	inc	(hl)
00106$:
;main.c:1235: if (hours > 99) {
	ld	a, #0x63
	ld	hl, #_hours
	sub	a, (hl)
	ret	NC
;main.c:1236: hours = 99;
	ld	(hl), #0x63
;main.c:1238: }
	ret
;main.c:1240: void set_enemy_sprite() {
;	---------------------------------
; Function set_enemy_sprite
; ---------------------------------
_set_enemy_sprite::
;main.c:1241: switch (current_enemies[0].type) {
	ld	a, (#(_current_enemies + 5) + 0)
	cp	a, #0x01
	jr	Z, 00101$
	cp	a, #0x02
	jr	Z, 00102$
	sub	a, #0x03
	jr	Z, 00103$
	jr	00104$
;main.c:1242: case 1:
00101$:
;main.c:1243: set_sprite_data(90, 4, LarvaOscura);
	ld	de, #_LarvaOscura
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1244: break;
	jr	00104$
;main.c:1245: case 2:
00102$:
;main.c:1246: set_sprite_data(90, 4, Trisguardo);
	ld	de, #_Trisguardo
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1247: break;
	jr	00104$
;main.c:1248: case 3:
00103$:
;main.c:1249: set_sprite_data(90, 4, PredatoreOmbra);
	ld	de, #_PredatoreOmbra
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1251: }
00104$:
;main.c:1252: switch (current_enemies[1].type) {
	ld	a, (#(_current_enemies + 15) + 0)
	cp	a, #0x01
	jr	Z, 00105$
	cp	a, #0x02
	jr	Z, 00106$
	sub	a, #0x03
	jr	Z, 00107$
	jr	00108$
;main.c:1253: case 1:
00105$:
;main.c:1254: set_sprite_data(94, 4, LarvaOscura);
	ld	de, #_LarvaOscura
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1255: break;
	jr	00108$
;main.c:1256: case 2:
00106$:
;main.c:1257: set_sprite_data(94, 4, Trisguardo);
	ld	de, #_Trisguardo
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1258: break;
	jr	00108$
;main.c:1259: case 3:
00107$:
;main.c:1260: set_sprite_data(94, 4, PredatoreOmbra);
	ld	de, #_PredatoreOmbra
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1262: }
00108$:
;main.c:1263: set_enemy_tiles();
	ld	e, #b_set_enemy_tiles
	ld	hl, #_set_enemy_tiles
;main.c:1264: return;
;main.c:1265: }
	jp  ___sdcc_bcall_ehl
;main.c:1268: void music_vbl_interrupt() {
;	---------------------------------
; Function music_vbl_interrupt
; ---------------------------------
_music_vbl_interrupt::
;main.c:1269: uint8_t bank_precedente = _current_bank;
	ldh	a, (__current_bank + 0)
	ld	c, a
;main.c:1270: SWITCH_ROM(current_song_bank);
	ld	a, (_current_song_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;main.c:1271: hUGE_dosound();
	push	bc
	call	_hUGE_dosound
	pop	bc
;main.c:1272: SWITCH_ROM(bank_precedente);
	ld	a, c
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), c
;main.c:1273: }
	ret
;main.c:1275: void return_to_camp() {
;	---------------------------------
; Function return_to_camp
; ---------------------------------
_return_to_camp::
;main.c:1276: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:1277: current_song_bank = 3;
	ld	hl, #_current_song_bank
	ld	(hl), #0x03
;main.c:1278: SWITCH_ROM(current_song_bank);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:1279: hUGE_init(&gameover_jingle);
	ld	de, #_gameover_jingle
	call	_hUGE_init
;main.c:1280: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;main.c:1281: game_over();
	ld	e, #b_game_over
	ld	hl, #_game_over
	call	___sdcc_bcall_ehl
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:1283: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:1284: set_camp_map();
	call	_set_camp_map
;main.c:1285: x = 120;
	ld	hl, #_x
	ld	(hl), #0x78
;main.c:1286: y = 112;
	ld	hl, #_y
	ld	(hl), #0x70
;main.c:1287: move_character();
	call	_move_character
;main.c:1288: delay(100);
	ld	de, #0x0064
	call	_delay
;main.c:1289: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:1290: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:1291: return;
;main.c:1292: }
	ret
;main.c:1294: void set_tutorial() {
;	---------------------------------
; Function set_tutorial
; ---------------------------------
_set_tutorial::
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x18
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x20
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x18
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x20
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x18
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x20
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), #0x18
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1305: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;main.c:1306: set_win_tiles(0, 0, 20, 18, TutorialMap);
	ld	de, #_TutorialMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:1307: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:1308: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:1309: while (1) {
00104$:
;main.c:1310: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00104$
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x28
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x30
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 40)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x28
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 44)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x30
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 48)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x78
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 52)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x80
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 56)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x78
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 60)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x48
	ld	(hl+), a
	ld	(hl), #0x80
;main.c:1319: return;
;main.c:1322: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__tile_id:
	.dw #0x0000
__xinit__x:
	.db #0x78	; 120	'x'
__xinit__y:
	.db #0x70	; 112	'p'
__xinit__last_direction:
	.db #0x01	; 1
__xinit__frames:
	.db #0x00	; 0
__xinit__seconds:
	.db #0x00	; 0
__xinit__minutes:
	.db #0x00	; 0
__xinit__hours:
	.db #0x00	; 0
__xinit__enemies_defeated:
	.db #0x00	; 0
__xinit__max_floor:
	.db #0x00	; 0
__xinit__power_ups:
	.db #0x00	; 0
__xinit__last_joypad:
	.db #0x00	; 0
__xinit__current_joypad:
	.db #0x00	; 0
__xinit__player_name:
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xa4	; 164
__xinit__max_hp:
	.db #0x17	; 23
__xinit__current_hp:
	.db #0x17	; 23
__xinit__attack:
	.db #0x05	; 5
__xinit__defense:
	.db #0x03	; 3
__xinit__level:
	.db #0x01	; 1
__xinit__experience:
	.db #0x00	; 0
__xinit__sword_lvl:
	.db #0x01	; 1
__xinit__shield_lvl:
	.db #0x01	; 1
__xinit__arrow_lvl:
	.db #0x01	; 1
__xinit__quiver_lvl:
	.db #0x01	; 1
__xinit__potion_quant_lvl:
	.db #0x01	; 1
__xinit__potion_heal_lvl:
	.db #0x01	; 1
__xinit__max_heals:
	.db #0x05	; 5
__xinit__heals:
	.db #0x05	; 5
__xinit__heal_quantity:
	.db #0x0a	; 10
__xinit__arrow_damage:
	.db #0x03	; 3
__xinit__num_arrows:
	.db #0x0a	; 10
__xinit__max_num_arrows:
	.db #0x0a	; 10
__xinit__minerals:
	.db #0x00	; 0
__xinit__obt_mythril:
	.db #0x00	; 0
__xinit__obt_exp:
	.db #0x00	; 0
__xinit__menu_opened:
	.db #0x00	; 0
__xinit__current_location:
	.db #0x00	; 0
__xinit__current_floor:
	.db #0x01	; 1
__xinit__hector_option:
	.db #0x01	; 1
__xinit__safy_option:
	.db #0x01	; 1
__xinit__map_option:
	.db #0x00	; 0
__xinit__key_obtained:
	.db #0x00	; 0
__xinit__treasure_obtained:
	.db #0x00	; 0
__xinit__lock_opened:
	.db #0x00	; 0
__xinit__boss_battle:
	.db #0x00	; 0
__xinit__boss_floor_defeated:
	.db #0x00	; 0
__xinit__returning_to_camp:
	.db #0x00	; 0
__xinit__current_song_bank:
	.db #0x03	; 3
__xinit__ng:
	.db #0x00	; 0
__xinit__walk_step:
	.db #0x00	; 0
	.area _CABS (ABS)
