;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module actions
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _heal_player
	.globl _save_game
	.globl _set_textbox
	.globl b_move_boss
	.globl _move_boss
	.globl _move_enemy
	.globl _shoot_arrow
	.globl b_hide_door
	.globl _hide_door
	.globl b_unlock_sfx
	.globl _unlock_sfx
	.globl b_heal_sfx
	.globl _heal_sfx
	.globl _hUGE_init
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _check_input_keys
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
;src/scripts/actions.c:3: void check_input_keys() {
;	---------------------------------
; Function check_input_keys
; ---------------------------------
_check_input_keys::
	add	sp, #-9
;src/scripts/actions.c:4: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jp	Z, 00178$
;src/scripts/actions.c:6: uint8_t gx = (x - 8) / 8;
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
;src/scripts/actions.c:7: uint8_t gy = (y - 16) / 8;
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
;src/scripts/actions.c:9: if (dungeon[player_coords.x][player_coords.y] == 'T' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && treasure_obtained == 0) {
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
;src/scripts/actions.c:8: if (current_location == 1) {
	ld	a, (#_current_location)
	dec	a
	jp	NZ, 00170$
;src/scripts/actions.c:9: if (dungeon[player_coords.x][player_coords.y] == 'T' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && treasure_obtained == 0) {
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
	jp	NZ, 00137$
	ldhl	sp,	#7
	bit	0, (hl)
	jp	NZ, 00137$
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
;src/scripts/actions.c:10: current_song_bank = 1;
	ld	hl, #_current_song_bank
	ld	(hl), #0x01
;src/scripts/actions.c:11: SWITCH_ROM(current_song_bank);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/actions.c:12: hUGE_init(&item_found);
	ld	de, #_item_found
	call	_hUGE_init
;src/scripts/actions.c:13: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/actions.c:14: treasure_obtained = 1;
	ld	hl, #_treasure_obtained
	ld	(hl), #0x01
;src/scripts/actions.c:15: minerals++;
	ld	hl, #_minerals
	inc	(hl)
;src/scripts/actions.c:16: obt_mythril++;
	ld	hl, #_obt_mythril
	inc	(hl)
;src/scripts/actions.c:17: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/actions.c:18: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/actions.c:19: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;src/scripts/actions.c:20: set_textbox(2);
	ld	a, #0x02
	call	_set_textbox
;src/scripts/actions.c:21: current_song_bank = 4;
	ld	hl, #_current_song_bank
	ld	(hl), #0x04
;src/scripts/actions.c:22: SWITCH_ROM(current_song_bank);
	ld	a, #0x04
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x04
;src/scripts/actions.c:23: hUGE_init(&dungeon_theme);
	ld	de, #_dungeon_theme
	call	_hUGE_init
;src/scripts/actions.c:24: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
	jp	00184$
00137$:
;src/scripts/actions.c:26: else if (dungeon[player_coords.x][player_coords.y] == 'K' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && key_obtained == 0) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4b
	jp	NZ, 00129$
	ldhl	sp,	#7
	bit	0, (hl)
	jp	NZ, 00129$
	inc	hl
	bit	0, (hl)
	jp	NZ, 00129$
	ldhl	sp,	#4
	bit	0, (hl)
	jr	NZ, 00129$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00129$
	ld	a, (#_key_obtained)
	or	a, a
	jr	NZ, 00129$
;src/scripts/actions.c:27: current_song_bank = 1;
	ld	hl, #_current_song_bank
	ld	(hl), #0x01
;src/scripts/actions.c:28: SWITCH_ROM(current_song_bank);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/actions.c:29: hUGE_init(&item_found);
	ld	de, #_item_found
	call	_hUGE_init
;src/scripts/actions.c:30: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 134)
	ld	(hl), #0x3b
	ld	hl, #(_shadow_OAM + 138)
	ld	(hl), #0x3c
;src/scripts/actions.c:33: key_obtained = 1;
	ld	hl, #_key_obtained
	ld	(hl), #0x01
;src/scripts/actions.c:34: set_bkg_tiles(8, 6, 4, 2, chest_opened);
	ld	de, #_chest_opened
	push	de
	ld	hl, #0x204
	push	hl
	ld	hl, #0x608
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/actions.c:35: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/actions.c:36: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;src/scripts/actions.c:37: set_textbox(1);
	ld	a, #0x01
	call	_set_textbox
;src/scripts/actions.c:38: current_song_bank = 4;
	ld	hl, #_current_song_bank
	ld	(hl), #0x04
;src/scripts/actions.c:39: SWITCH_ROM(current_song_bank);
	ld	a, #0x04
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x04
;src/scripts/actions.c:40: hUGE_init(&dungeon_theme);
	ld	de, #_dungeon_theme
	call	_hUGE_init
;src/scripts/actions.c:41: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
	jp	00184$
00129$:
;src/scripts/actions.c:43: else if (dungeon[player_coords.x][player_coords.y] == 'L' && key_obtained == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x4c
	jp	NZ, 00125$
	ld	a, (#_key_obtained)
	dec	a
	jp	NZ, 00125$
;src/scripts/actions.c:44: switch (locked_door) {
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
;src/scripts/actions.c:45: case 1:
00101$:
;src/scripts/actions.c:46: if (gx >= 8 && gx <= 11 && gy <= 3) {
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
;src/scripts/actions.c:47: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;src/scripts/actions.c:48: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;src/scripts/actions.c:50: break;
	jr	00121$
;src/scripts/actions.c:51: case 2:
00106$:
;src/scripts/actions.c:52: if (gy >= 8 && gy <= 9 && gx >= 16) {
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
;src/scripts/actions.c:53: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;src/scripts/actions.c:54: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;src/scripts/actions.c:56: break;
	jr	00121$
;src/scripts/actions.c:57: case 4:
00111$:
;src/scripts/actions.c:58: if (gy >= 14 && gx >= 8 && gx <= 11) {
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
;src/scripts/actions.c:59: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;src/scripts/actions.c:60: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;src/scripts/actions.c:62: break;
	jr	00121$
;src/scripts/actions.c:63: case 8:
00116$:
;src/scripts/actions.c:64: if (gx <= 3 && gy >= 8 && gy <= 9) {
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
;src/scripts/actions.c:65: lock_opened = 1;
	ld	hl, #_lock_opened
	ld	(hl), #0x01
;src/scripts/actions.c:66: hide_door();
	ld	e, #b_hide_door
	ld	hl, #_hide_door
	call	___sdcc_bcall_ehl
;src/scripts/actions.c:69: }
00121$:
;src/scripts/actions.c:70: unlock_sfx();
	ld	e, #b_unlock_sfx
	ld	hl, #_unlock_sfx
	call	___sdcc_bcall_ehl
	jp	00184$
00125$:
;src/scripts/actions.c:73: if (num_arrows > 0) {
	ld	a, (#_num_arrows)
	or	a, a
	jp	Z, 00184$
;src/scripts/actions.c:74: shoot_arrow();
	call	_shoot_arrow
;src/scripts/actions.c:75: num_arrows--;
	ld	hl, #_num_arrows
	dec	(hl)
;src/scripts/actions.c:76: delay(100);
	ld	de, #0x0064
	call	_delay
;src/scripts/actions.c:77: move_enemy(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_move_enemy
;src/scripts/actions.c:78: move_enemy(&current_enemies[1]);
	ld	de, #(_current_enemies + 12)
	call	_move_enemy
;src/scripts/actions.c:79: move_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_move_boss
	ld	hl, #_move_boss
	call	___sdcc_bcall_ehl
	pop	hl
	jp	00184$
00170$:
;src/scripts/actions.c:83: else if (current_location == 0) {
	ld	a, (#_current_location)
	or	a, a
	jp	NZ, 00184$
;src/scripts/actions.c:84: if (gx >= 4 && gx <= 5 && gy >= 10 && gy <= 11) {
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
;src/scripts/actions.c:85: while(joypad() & J_A) { wait_vbl_done(); }
00144$:
	call	_joypad
	bit	4, a
	jr	Z, 00146$
	call	_wait_vbl_done
	jr	00144$
00146$:
;src/scripts/actions.c:86: menu_opened = 2;
	ld	hl, #_menu_opened
	ld	(hl), #0x02
;src/scripts/actions.c:87: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x20
	ldh	(_WY_REG + 0), a
;src/scripts/actions.c:89: set_win_tiles(0, 0, 20, 14, hector_menu);
	ld	de, #_hector_menu
	push	de
	ld	hl, #0xe14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/actions.c:90: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/actions.c:91: delay(300);
	ld	de, #0x012c
	call	_delay
	jp	00184$
00162$:
;src/scripts/actions.c:93: else if (gx >= 14 && gx <= 15 && gy >= 8 && gy <= 9) {
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
;src/scripts/actions.c:94: while(joypad() & J_A) { wait_vbl_done(); }
00147$:
	call	_joypad
	bit	4, a
	jr	Z, 00149$
	call	_wait_vbl_done
	jr	00147$
00149$:
;src/scripts/actions.c:95: menu_opened = 3;
	ld	hl, #_menu_opened
	ld	(hl), #0x03
;src/scripts/actions.c:96: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x20
	ldh	(_WY_REG + 0), a
;src/scripts/actions.c:98: set_win_tiles(0, 0, 20, 14, safy_menu);
	ld	de, #_safy_menu
	push	de
	ld	hl, #0xe14
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/actions.c:99: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/actions.c:100: delay(300);
	ld	de, #0x012c
	call	_delay
	jr	00184$
00156$:
;src/scripts/actions.c:102: else if (gx>=12 && gx <=13 && gy >= 10 && gy <= 11) {
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
;src/scripts/actions.c:103: save_game();
	call	_save_game
;src/scripts/actions.c:104: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/actions.c:105: heal_sfx();
	ld	e, #b_heal_sfx
	ld	hl, #_heal_sfx
	call	___sdcc_bcall_ehl
;src/scripts/actions.c:106: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;src/scripts/actions.c:107: set_textbox(0);
	xor	a, a
	call	_set_textbox
	jr	00184$
00178$:
;src/scripts/actions.c:112: else if (joypad() & J_B && current_location == 1) {
	call	_joypad
	bit	5, a
	jr	Z, 00184$
	ld	a, (#_current_location)
	dec	a
	jr	NZ, 00184$
;src/scripts/actions.c:113: if (heals > 0) {
	ld	a, (#_heals)
	or	a, a
	jr	Z, 00184$
;src/scripts/actions.c:114: heal_sfx();
	ld	e, #b_heal_sfx
	ld	hl, #_heal_sfx
	call	___sdcc_bcall_ehl
;src/scripts/actions.c:115: heal_player();
	call	_heal_player
;src/scripts/actions.c:116: heals--;
	ld	hl, #_heals
	dec	(hl)
;src/scripts/actions.c:117: delay(100);
	ld	de, #0x0064
	call	_delay
;src/scripts/actions.c:118: move_enemy(&current_enemies[0]);
	ld	de, #_current_enemies
	call	_move_enemy
;src/scripts/actions.c:119: move_enemy(&current_enemies[1]);
	ld	de, #(_current_enemies + 12)
	call	_move_enemy
;src/scripts/actions.c:120: move_boss(&boss);
	ld	de, #_boss
	push	de
	ld	e, #b_move_boss
	ld	hl, #_move_boss
	call	___sdcc_bcall_ehl
	pop	hl
00184$:
;src/scripts/actions.c:123: }
	add	sp, #9
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
