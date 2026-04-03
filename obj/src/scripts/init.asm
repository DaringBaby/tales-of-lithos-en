;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module init
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_load_game
	.globl _load_game
	.globl _music_vbl_interrupt
	.globl b_start_sfx
	.globl _start_sfx
	.globl b_init_sound
	.globl _init_sound
	.globl _play_song
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl _go_into_dungeon
	.globl _set_camp_map
	.globl _move_character
	.globl b_insert_name
	.globl _insert_name
	.globl _set_tutorial
	.globl b_start_intro
	.globl _start_intro
	.globl b_set_titlescreen
	.globl _set_titlescreen
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _delay
	.globl _add_VBL
	.globl _black
	.globl _blank
	.globl _game_init
	.globl _set_title_data
	.globl _set_game_sprites
	.globl _set_game_gui
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
;src/scripts/init.c:25: void game_init() {
;	---------------------------------
; Function game_init
; ---------------------------------
_game_init::
;src/scripts/init.c:26: cls();
	call	_cls
;src/scripts/init.c:27: init_sound();
	ld	e, #b_init_sound
	ld	hl, #_init_sound
	call	___sdcc_bcall_ehl
;src/scripts/init.c:30: }
	di
;src/scripts/init.c:29: add_VBL(music_vbl_interrupt);
	ld	de, #_music_vbl_interrupt
	call	_add_VBL
	ei
;src/scripts/init.c:31: set_title_data();
	call	_set_title_data
;src/scripts/init.c:32: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/init.c:33: ng = set_titlescreen();
	ld	e, #b_set_titlescreen
	ld	hl, #_set_titlescreen
	call	___sdcc_bcall_ehl
	ld	(#_ng),a
;src/scripts/init.c:34: start_sfx();
	ld	e, #b_start_sfx
	ld	hl, #_start_sfx
	call	___sdcc_bcall_ehl
;src/scripts/init.c:35: if (ng) {
	ld	a, (#_ng)
	or	a, a
	jr	Z, 00102$
;src/scripts/init.c:36: start_intro();
	ld	e, #b_start_intro
	ld	hl, #_start_intro
	call	___sdcc_bcall_ehl
00102$:
;src/scripts/init.c:38: set_game_sprites();
	call	_set_game_sprites
;src/scripts/init.c:39: set_game_gui();
	call	_set_game_gui
;src/scripts/init.c:40: if (!load_game()) {
	ld	e, #b_load_game
	ld	hl, #_load_game
	call	___sdcc_bcall_ehl
	or	a, a
	jr	NZ, 00104$
;src/scripts/init.c:41: insert_name();
	ld	e, #b_insert_name
	ld	hl, #_insert_name
	call	___sdcc_bcall_ehl
00104$:
;src/scripts/init.c:43: set_sprite_data(4, 4, MC_up);
	ld	de, #_MC_up
	push	de
	ld	hl, #0x404
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:44: if (current_location == 0){
	ld	a, (#_current_location)
	or	a, a
	jr	NZ, 00106$
;src/scripts/init.c:45: set_camp_map();
	call	_set_camp_map
	jr	00107$
00106$:
;src/scripts/init.c:48: go_into_dungeon();
	call	_go_into_dungeon
00107$:
;src/scripts/init.c:50: if (ng) { // tutorial
	ld	a, (#_ng)
	or	a, a
	jr	Z, 00109$
;src/scripts/init.c:51: set_tutorial();
	call	_set_tutorial
00109$:
;src/scripts/init.c:54: move_character();
	call	_move_character
;src/scripts/init.c:55: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/init.c:56: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/scripts/init.c:57: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/scripts/init.c:58: delay(100);
	ld	de, #0x0064
;src/scripts/init.c:59: }
	jp	_delay
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
;src/scripts/init.c:61: void set_title_data() {
;	---------------------------------
; Function set_title_data
; ---------------------------------
_set_title_data::
;src/scripts/init.c:62: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/init.c:63: set_bkg_data(0, 241, Titlescreen);
	ld	de, #_Titlescreen
	push	de
	ld	hl, #0xf100
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:64: set_bkg_data(241, 8, TitleText);
	ld	de, #_TitleText
	push	de
	ld	hl, #0x8f1
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:65: set_bkg_tiles(0, 0, 20, 18, Title);
	ld	de, #_Title
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/init.c:66: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/init.c:67: play_song(6);
	ld	a, #0x06
;src/scripts/init.c:68: }
	jp	_play_song
;src/scripts/init.c:70: void set_game_sprites() {
;	---------------------------------
; Function set_game_sprites
; ---------------------------------
_set_game_sprites::
;src/scripts/init.c:71: set_sprite_data(0, 4, MC_down);
	ld	de, #_MC_down
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:72: set_sprite_data(8, 4, MC_right);
	ld	de, #_MC_right
	push	de
	ld	hl, #0x408
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:73: set_sprite_data(12, 4, MC_left);
	ld	de, #_MC_left
	push	de
	ld	hl, #0x40c
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:74: set_sprite_data(16, 4, Hector);
	ld	de, #_Hector
	push	de
	ld	hl, #0x410
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:75: set_sprite_data(20, 4, Safy);
	ld	de, #_Safy
	push	de
	ld	hl, #0x414
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:76: set_sprite_data(50, 1, blank);
	ld	de, #_blank
	push	de
	ld	hl, #0x132
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:77: set_sprite_data(51, 8, Lock);
	ld	de, #_Lock
	push	de
	ld	hl, #0x833
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:78: set_sprite_data(59, 2, Key);
	ld	de, #_Key
	push	de
	ld	hl, #0x23b
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:79: set_sprite_data(61, 4, Mythril);
	ld	de, #_Mythril
	push	de
	ld	hl, #0x43d
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:80: set_sprite_data(65, 12, Numbers);
	ld	de, #_Numbers
	push	de
	ld	hl, #0xc41
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:81: set_sprite_data(80, 2, Arrow);
	ld	de, #_Arrow
	push	de
	ld	hl, #0x250
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:82: set_sprite_data(82, 2, Drops);
	ld	de, #_Drops
	push	de
	ld	hl, #0x252
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/init.c:83: }
	ret
;src/scripts/init.c:85: void set_game_gui() {
;	---------------------------------
; Function set_game_gui
; ---------------------------------
_set_game_gui::
;src/scripts/init.c:86: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;src/scripts/init.c:87: set_bkg_data(108, 17, Minimap);
	ld	de, #_Minimap
	push	de
	ld	hl, #0x116c
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:88: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/init.c:89: set_bkg_data(128, 51, Text);
	ld	de, #_Text
	push	de
	ld	hl, #0x3380
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:90: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/init.c:91: set_bkg_data(179, 9, Textbox);
	ld	de, #_Textbox
	push	de
	ld	hl, #0x9b3
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:92: set_bkg_data(188, 16, Mugshot);
	ld	de, #_Mugshot
	push	de
	ld	hl, #0x10bc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:93: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
;src/scripts/init.c:94: set_bkg_data(220, 4, MiniGUI);
	ld	de, #_MiniGUI
	push	de
	ld	hl, #0x4dc
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:95: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/init.c:96: set_bkg_data(225, 20, Objects);
	ld	de, #_Objects
	push	de
	ld	hl, #0x14e1
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:97: set_bkg_data(245, 1, arrow);
	ld	de, #_arrow
	push	de
	ld	hl, #0x1f5
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/scripts/init.c:98: set_bkg_data(246, 1, black);
	ld	de, #_black
	push	de
	ld	hl, #0x1f6
	push	hl
	call	_set_bkg_data
	add	sp, #4
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/init.c:100: set_mini_menu();
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
;src/scripts/init.c:112: set_sprite_tile(38, 64);
;src/scripts/init.c:113: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
