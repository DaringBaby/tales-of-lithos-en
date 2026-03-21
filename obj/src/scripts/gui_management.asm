;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module gui_management
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_win_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl b_check_map_options
	.globl _check_map_options
	.globl b_check_map_menu_input
	.globl _check_map_menu_input
	.globl b_show_time
	.globl _show_time
	.globl b_check_menu_options
	.globl _check_menu_options
	.globl _hector_upgrades
	.globl _safy_upgrades
	.globl b_set_stats
	.globl _set_stats
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl b_show_number
	.globl _show_number
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
;src/scripts/gui_management.c:9: void check_map_options() BANKED {
;	---------------------------------
; Function check_map_options
; ---------------------------------
	b_check_map_options	= 3
_check_map_options::
;src/scripts/gui_management.c:10: if (joypad() & J_UP && map_option > 0) {
	call	_joypad
	bit	2, a
	jr	Z, 00102$
	ld	hl, #_map_option
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/scripts/gui_management.c:11: set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
	ld	bc, #_menu_body+0
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:12: map_option--;
	ld	hl, #_map_option
	dec	(hl)
;src/scripts/gui_management.c:13: set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
	ld	bc, #_arrow_tile+0
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:14: delay(150);
	ld	de, #0x0096
	call	_delay
00102$:
;src/scripts/gui_management.c:16: if (joypad() & J_DOWN && map_option < 2) {
	call	_joypad
	bit	3, a
	jr	Z, 00105$
	ld	hl, #_map_option
	ld	a, (hl)
	sub	a, #0x02
	jr	NC, 00105$
;src/scripts/gui_management.c:17: set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
	ld	bc, #_menu_body+0
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:18: map_option++;
	ld	hl, #_map_option
	inc	(hl)
;src/scripts/gui_management.c:19: set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
	ld	bc, #_arrow_tile+0
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	add	a, #0x04
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:20: delay(150);
	ld	de, #0x0096
	call	_delay
00105$:
;src/scripts/gui_management.c:22: check_map_menu_input();
	ld	e, #b_check_map_menu_input
	ld	hl, #_check_map_menu_input
;src/scripts/gui_management.c:23: }
	jp  ___sdcc_bcall_ehl
;src/scripts/gui_management.c:25: void check_map_menu_input() BANKED {
;	---------------------------------
; Function check_map_menu_input
; ---------------------------------
	b_check_map_menu_input	= 3
_check_map_menu_input::
	add	sp, #-7
;src/scripts/gui_management.c:26: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jp	Z, 00110$
;src/scripts/gui_management.c:27: switch (map_option) {
	ld	a, (#_map_option)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_map_option)
	dec	a
	jr	Z, 00102$
	ld	a, (#_map_option)
	sub	a, #0x02
	jp	Z, 00103$
	jp	00110$
;src/scripts/gui_management.c:28: case 0:
00101$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/gui_management.c:30: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;src/scripts/gui_management.c:31: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui_management.c:32: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui_management.c:33: break;
	jp	00110$
;src/scripts/gui_management.c:34: case 1:
00102$:
;src/scripts/gui_management.c:35: menu_opened = 6;
	ld	hl, #_menu_opened
	ld	(hl), #0x06
;src/scripts/gui_management.c:36: set_win_tiles(0, 0, 20, 18, stats_menu);
	ld	de, #_stats_menu
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:41: def_en[0] = enemies_defeated / 100 + 154;
	ld	a, (_enemies_defeated)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:42: def_en[1] = enemies_defeated % 100 / 10 + 154;
	ld	a, (_enemies_defeated)
	ld	e, #0x64
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/gui_management.c:43: def_en[2] = enemies_defeated % 10 + 154;
	ld	a, (_enemies_defeated)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gui_management.c:44: pups[0] = power_ups / 10 + 154;
	ld	a, (_power_ups)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:45: pups[1] = power_ups % 10 + 154;
	ld	a, (_power_ups)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gui_management.c:46: mfloor[0] = max_floor / 10 + 154;
	ld	a, (_max_floor)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:47: mfloor[1] = max_floor % 10 + 154;
	ld	a, (_max_floor)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:48: set_win_tiles(16, 4, 3, 1, def_en);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0x410
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:49: set_win_tiles(17, 7, 2, 1, mfloor);
	ld	hl, #5
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x711
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:50: set_win_tiles(17, 10, 2, 1, pups);
	ld	hl, #3
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xa11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:51: show_time();
	ld	e, #b_show_time
	ld	hl, #_show_time
	call	___sdcc_bcall_ehl
;src/scripts/gui_management.c:52: delay(300);
	ld	de, #0x012c
	call	_delay
;src/scripts/gui_management.c:53: break;
	jr	00110$
;src/scripts/gui_management.c:54: case 2:
00103$:
;src/scripts/gui_management.c:55: if (current_location == 1) {
	ld	a, (#_current_location)
	dec	a
	jr	NZ, 00110$
;src/scripts/gui_management.c:56: returning_to_camp = 1;
	ld	hl, #_returning_to_camp
	ld	(hl), #0x01
;src/scripts/gui_management.c:57: return;
;src/scripts/gui_management.c:60: }
00110$:
;src/scripts/gui_management.c:62: }
	add	sp, #7
	ret
;src/scripts/gui_management.c:64: void show_time() BANKED {
;	---------------------------------
; Function show_time
; ---------------------------------
	b_show_time	= 3
_show_time::
	add	sp, #-8
;src/scripts/gui_management.c:66: t[0] = hours / 10 + 154;
	ld	a, (_hours)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:67: t[1] = hours % 10 + 154;
	ld	a, (_hours)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
;src/scripts/gui_management.c:68: t[2] = 177;
	ld	(hl+), a
	ld	(hl), #0xb1
;src/scripts/gui_management.c:69: t[3] = minutes / 10 + 154;
	ld	a, (_minutes)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:70: t[4] = minutes % 10 + 154;
	ld	a, (_minutes)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
;src/scripts/gui_management.c:71: t[5] = 177;
	ld	(hl+), a
	ld	(hl), #0xb1
;src/scripts/gui_management.c:72: t[6] = seconds / 10 + 154;
	ld	a, (_seconds)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:73: t[7] = seconds % 10 + 154;
	ld	a, (_seconds)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/gui_management.c:74: set_win_tiles(11, 13, 8, 1, t);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x108
	push	hl
	ld	hl, #0xd0b
	push	hl
	call	_set_win_tiles
;src/scripts/gui_management.c:75: }
	add	sp, #14
	ret
;src/scripts/gui_management.c:77: void check_menu_options(uint8_t chara) BANKED {
;	---------------------------------
; Function check_menu_options
; ---------------------------------
	b_check_menu_options	= 3
_check_menu_options::
;src/scripts/gui_management.c:78: if (chara == 0) // Hector
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jp	NZ, 00109$
;src/scripts/gui_management.c:80: if (joypad() & J_UP && hector_option > 1) {
	call	_joypad
	bit	2, a
	jr	Z, 00105$
	ld	a, #0x01
	ld	hl, #_hector_option
	sub	a, (hl)
	jr	NC, 00105$
;src/scripts/gui_management.c:81: set_win_tiles(1, hector_option*2 - 1, 1, 1, menu_body);
	ld	bc, #_menu_body+0
	ld	a, (hl)
	add	a, a
	dec	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:82: hector_option--;
	ld	hl, #_hector_option
	dec	(hl)
;src/scripts/gui_management.c:83: set_win_tiles(1, hector_option*2 - 1, 1, 1, &arrow_tile);
	ld	bc, #_arrow_tile+0
	ld	a, (hl)
	add	a, a
	dec	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:84: delay(150);
	ld	de, #0x0096
	call	_delay
	jr	00106$
00105$:
;src/scripts/gui_management.c:86: else if (joypad() & J_DOWN && hector_option < 4) {
	call	_joypad
	bit	3, a
	jr	Z, 00106$
	ld	hl, #_hector_option
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00106$
;src/scripts/gui_management.c:87: set_win_tiles(1, hector_option*2 - 1, 1, 1, menu_body);
	ld	bc, #_menu_body+0
	ld	a, (hl)
	add	a, a
	dec	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:88: hector_option++;
	ld	hl, #_hector_option
	inc	(hl)
;src/scripts/gui_management.c:89: set_win_tiles(1, hector_option*2 - 1, 1, 1, &arrow_tile);
	ld	bc, #_arrow_tile+0
	ld	a, (hl)
	add	a, a
	dec	a
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:90: delay(150);
	ld	de, #0x0096
	call	_delay
00106$:
;src/scripts/gui_management.c:92: hector_upgrades();
	call	_hector_upgrades
00109$:
;src/scripts/gui_management.c:94: if (chara == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	ret	NZ
;src/scripts/gui_management.c:95: if (joypad() & J_UP && safy_option > 1) {
	call	_joypad
	bit	2, a
	jr	Z, 00114$
	ld	a, #0x01
	ld	hl, #_safy_option
	sub	a, (hl)
	jr	NC, 00114$
;src/scripts/gui_management.c:96: set_win_tiles(1, safy_option*2 - 1, 1, 1, menu_body);
	ld	a, (hl)
	add	a, a
	dec	a
	ld	de, #_menu_body
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:97: safy_option--;
	ld	hl, #_safy_option
	dec	(hl)
;src/scripts/gui_management.c:98: set_win_tiles(1, safy_option*2 - 1, 1, 1, &arrow_tile);
	ld	a, (hl)
	add	a, a
	dec	a
	ld	de, #_arrow_tile
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:99: delay(150);
	ld	de, #0x0096
	call	_delay
	jp	_safy_upgrades
00114$:
;src/scripts/gui_management.c:101: else if (joypad() & J_DOWN && safy_option < 3) {
	call	_joypad
	bit	3, a
	jp	Z, _safy_upgrades
	ld	hl, #_safy_option
	ld	a, (hl)
	sub	a, #0x03
	jp	NC, _safy_upgrades
;src/scripts/gui_management.c:102: set_win_tiles(1, safy_option*2 - 1, 1, 1, menu_body);
	ld	a, (hl)
	add	a, a
	dec	a
	ld	de, #_menu_body
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:103: safy_option++;
	ld	hl, #_safy_option
	inc	(hl)
;src/scripts/gui_management.c:104: set_win_tiles(1, safy_option*2 - 1, 1, 1, &arrow_tile);
	ld	a, (hl)
	add	a, a
	dec	a
	ld	de, #_arrow_tile
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:105: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/gui_management.c:107: safy_upgrades();
;src/scripts/gui_management.c:109: }
	jp	_safy_upgrades
;src/scripts/gui_management.c:111: void hector_upgrades() {
;	---------------------------------
; Function hector_upgrades
; ---------------------------------
_hector_upgrades::
	add	sp, #-4
;src/scripts/gui_management.c:112: uint8_t cost = upgrade_costs[sword_lvl-1];
	ld	de, #_upgrade_costs+0
	ld	a, (_sword_lvl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	b, (hl)
	ld	c, b
;src/scripts/gui_management.c:114: switch(hector_option) {
	ld	a, (#_hector_option)
	dec	a
	jr	Z, 00101$
	ld	a, (#_hector_option)
	sub	a, #0x02
	jr	Z, 00107$
	ld	a, (#_hector_option)
	sub	a, #0x03
	jp	Z, 00113$
	ld	a, (#_hector_option)
	sub	a, #0x04
	jp	Z, 00119$
	jp	00125$
;src/scripts/gui_management.c:115: case 1:
00101$:
;src/scripts/gui_management.c:116: if (sword_lvl < 9) {
	ld	a, (#_sword_lvl)
	sub	a, #0x09
	jp	NC, 00125$
;src/scripts/gui_management.c:117: cost = upgrade_costs[sword_lvl-1];
	ld	c, b
;src/scripts/gui_management.c:118: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jp	C, 00125$
	call	_joypad
	bit	4, a
	jp	Z, 00125$
;src/scripts/gui_management.c:119: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:120: sword_lvl++;
	ld	hl, #_sword_lvl
	inc	(hl)
;src/scripts/gui_management.c:121: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:123: attack = attack + 3;
	ld	a, (_attack)
	add	a, #0x03
	ld	(#_attack),a
;src/scripts/gui_management.c:124: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:127: break;
	jp	00125$
;src/scripts/gui_management.c:128: case 2:
00107$:
;src/scripts/gui_management.c:129: if (shield_lvl < 9) {
	ld	hl, #_shield_lvl
	ld	a, (hl)
	sub	a, #0x09
	jp	NC, 00125$
;src/scripts/gui_management.c:130: cost = upgrade_costs[shield_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:131: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jp	C, 00125$
	call	_joypad
	bit	4, a
	jp	Z, 00125$
;src/scripts/gui_management.c:132: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:133: shield_lvl++;
	ld	hl, #_shield_lvl
	inc	(hl)
;src/scripts/gui_management.c:134: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:136: defense = defense + 3;
	ld	a, (_defense)
	add	a, #0x03
	ld	(#_defense),a
;src/scripts/gui_management.c:137: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:140: break;
	jr	00125$
;src/scripts/gui_management.c:141: case 3:
00113$:
;src/scripts/gui_management.c:142: if (arrow_lvl < 9) {
	ld	hl, #_arrow_lvl
	ld	a, (hl)
	sub	a, #0x09
	jr	NC, 00125$
;src/scripts/gui_management.c:143: cost = upgrade_costs[arrow_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:144: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jr	C, 00125$
	call	_joypad
	bit	4, a
	jr	Z, 00125$
;src/scripts/gui_management.c:145: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:146: arrow_lvl++;
	ld	hl, #_arrow_lvl
	inc	(hl)
;src/scripts/gui_management.c:147: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:149: arrow_damage = arrow_damage + 2;
	ld	a, (_arrow_damage)
	add	a, #0x02
	ld	(#_arrow_damage),a
;src/scripts/gui_management.c:150: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:153: break;
	jr	00125$
;src/scripts/gui_management.c:154: case 4:
00119$:
;src/scripts/gui_management.c:155: if (quiver_lvl < 9) {
	ld	hl, #_quiver_lvl
	ld	a, (hl)
	sub	a, #0x09
	jr	NC, 00125$
;src/scripts/gui_management.c:156: cost = upgrade_costs[quiver_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:157: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jr	C, 00125$
	call	_joypad
	bit	4, a
	jr	Z, 00125$
;src/scripts/gui_management.c:158: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:159: quiver_lvl++;
	ld	hl, #_quiver_lvl
	inc	(hl)
;src/scripts/gui_management.c:160: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:162: max_num_arrows = max_num_arrows + 2;
	ld	a, (_max_num_arrows)
	add	a, #0x02
	ld	(#_max_num_arrows),a
;src/scripts/gui_management.c:163: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:167: }
00125$:
;src/scripts/gui_management.c:170: costs[0] = cost / 10 + 154;
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__divuchar
	ld	a, c
	pop	bc
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:171: costs[1] = cost % 10 + 154;
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/gui_management.c:172: obt[0] = minerals / 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gui_management.c:173: obt[1] = minerals % 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:174: set_win_tiles(16, 10, 2, 1, costs);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xa10
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:175: set_win_tiles(16, 12, 2, 1, obt);
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xc10
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:177: if (joypad() & J_B) {
	call	_joypad
	bit	5, a
	jr	Z, 00128$
;src/scripts/gui_management.c:178: hector_option = 1;
	ld	hl, #_hector_option
	ld	(hl), #0x01
;src/scripts/gui_management.c:179: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:180: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui_management.c:181: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui_management.c:182: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
00128$:
;src/scripts/gui_management.c:184: }
	add	sp, #4
	ret
;src/scripts/gui_management.c:186: void safy_upgrades() {
;	---------------------------------
; Function safy_upgrades
; ---------------------------------
_safy_upgrades::
	add	sp, #-6
;src/scripts/gui_management.c:187: uint8_t cost = cure_upgrade_costs[potion_quant_lvl-1];
	ld	de, #_cure_upgrade_costs+0
	ld	a, (_potion_quant_lvl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	b, (hl)
	ld	c, b
;src/scripts/gui_management.c:188: switch(safy_option) {
	ld	a, (#_safy_option)
	dec	a
	jr	Z, 00101$
	ld	a, (#_safy_option)
	sub	a, #0x02
	jr	Z, 00107$
	ld	a, (#_safy_option)
	sub	a, #0x03
	jr	Z, 00113$
	jp	00119$
;src/scripts/gui_management.c:189: case 1:
00101$:
;src/scripts/gui_management.c:190: if (potion_quant_lvl < 9) {
	ld	a, (#_potion_quant_lvl)
	sub	a, #0x09
	jp	NC, 00119$
;src/scripts/gui_management.c:191: cost = cure_upgrade_costs[potion_quant_lvl-1];
	ld	c, b
;src/scripts/gui_management.c:192: if (experience >= cost && joypad() & J_A) {
	ld	a, (#_experience)
	sub	a, c
	jp	C, 00119$
	call	_joypad
	bit	4, a
	jp	Z, 00119$
;src/scripts/gui_management.c:193: experience = experience - cost;
	ld	hl, #_experience
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:194: potion_quant_lvl++;
	ld	hl, #_potion_quant_lvl
	inc	(hl)
;src/scripts/gui_management.c:195: heals = heals + 1;
	ld	a, (_heals)
	inc	a
	ld	(#_heals),a
;src/scripts/gui_management.c:196: max_heals++;
	ld	hl, #_max_heals
	inc	(hl)
;src/scripts/gui_management.c:197: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:198: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:201: break;
	jp	00119$
;src/scripts/gui_management.c:202: case 2:
00107$:
;src/scripts/gui_management.c:203: if (potion_heal_lvl < 9) {
	ld	hl, #_potion_heal_lvl
	ld	a, (hl)
	sub	a, #0x09
	jp	NC, 00119$
;src/scripts/gui_management.c:204: cost = cure_upgrade_costs[potion_heal_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:205: if (experience >= cost && joypad() & J_A) {
	ld	a, (#_experience)
	sub	a, c
	jr	C, 00119$
	call	_joypad
	bit	4, a
	jr	Z, 00119$
;src/scripts/gui_management.c:206: experience = experience - cost;
	ld	hl, #_experience
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:207: potion_heal_lvl++;
	ld	hl, #_potion_heal_lvl
	inc	(hl)
;src/scripts/gui_management.c:208: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:209: heal_quantity = heal_quantity + 4;
	ld	a, (_heal_quantity)
	add	a, #0x04
	ld	(#_heal_quantity),a
;src/scripts/gui_management.c:210: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:213: break;
	jr	00119$
;src/scripts/gui_management.c:214: case 3:
00113$:
;src/scripts/gui_management.c:215: if (level < 20) {
	ld	hl, #_level
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00119$
;src/scripts/gui_management.c:216: cost = level_curve[level-1];
	ld	bc, #_level_curve+0
	ld	l, (hl)
	ld	h, #0x00
	dec	hl
	add	hl, bc
	ld	c, (hl)
;src/scripts/gui_management.c:217: if (experience >= cost && joypad() & J_A) {
	ld	a, (#_experience)
	sub	a, c
	jr	C, 00119$
	call	_joypad
	bit	4, a
	jr	Z, 00119$
;src/scripts/gui_management.c:218: experience = experience - cost;
	ld	hl, #_experience
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:219: level++;
	ld	hl, #_level
	inc	(hl)
;src/scripts/gui_management.c:220: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:222: attack = attack + 3;
	ld	a, (_attack)
	add	a, #0x03
	ld	(#_attack),a
;src/scripts/gui_management.c:223: defense = defense + 3;
	ld	a, (_defense)
	add	a, #0x03
	ld	(#_defense),a
;src/scripts/gui_management.c:224: max_hp = max_hp + 5;
	ld	a, (_max_hp)
	add	a, #0x05
	ld	hl, #_max_hp
	ld	(hl), a
;src/scripts/gui_management.c:225: current_hp = max_hp;
	ld	a, (hl)
	ld	(#_current_hp),a
;src/scripts/gui_management.c:226: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:230: }
00119$:
;src/scripts/gui_management.c:233: costs[0] = cost / 100 + 154;
	push	bc
	ld	e, #0x64
	ld	a, c
	call	__divuchar
	ld	a, c
	pop	bc
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:234: costs[1] = cost % 100 / 10 + 154;
	push	bc
	ld	e, #0x64
	ld	a, c
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	pop	bc
	add	a, #0x9a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/gui_management.c:235: costs[2] = cost % 10 + 154;
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gui_management.c:236: exp[0] = experience / 100 + 154;
	ld	a, (_experience)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:237: exp[1] = experience % 100 / 10 + 154;
	ld	a, (_experience)
	ld	e, #0x64
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gui_management.c:238: exp[2] = experience % 10 + 154;
	ld	a, (_experience)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:239: set_win_tiles(15, 10, 3, 1, costs);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0xa0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:240: set_win_tiles(15, 12, 3, 1, exp);
	ld	hl, #3
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0xc0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:242: if (joypad() & J_B) {
	call	_joypad
	bit	5, a
	jr	Z, 00122$
;src/scripts/gui_management.c:243: safy_option = 1;
	ld	hl, #_safy_option
	ld	(hl), #0x01
;src/scripts/gui_management.c:244: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:245: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui_management.c:246: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui_management.c:247: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
00122$:
;src/scripts/gui_management.c:249: }
	add	sp, #6
	ret
;src/scripts/gui_management.c:251: void set_stats() BANKED {
;	---------------------------------
; Function set_stats
; ---------------------------------
	b_set_stats	= 3
_set_stats::
	add	sp, #-15
;src/scripts/gui_management.c:258: hp[0] = current_hp/10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:259: hp[1] = current_hp % 10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
;src/scripts/gui_management.c:260: hp[2] = 176;
	ld	(hl+), a
	ld	(hl), #0xb0
;src/scripts/gui_management.c:261: hp[3] = max_hp/10 + 154;
	ld	a, (_max_hp)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:262: hp[4] = max_hp % 10 + 154;
	ld	a, (_max_hp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gui_management.c:263: atk[0] = attack / 10 + 154;
	ld	a, (_attack)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:264: atk[1] = attack % 10 + 154;
	ld	a, (_attack)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:265: def[0] = defense / 10 + 154;
	ld	a, (_defense)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/gui_management.c:266: def[1] = defense % 10 + 154;
	ld	a, (_defense)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#8
	ld	(hl), a
;src/scripts/gui_management.c:267: exp[0] = experience / 100 + 154;
	ld	a, (_experience)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#9
	ld	(hl), a
;src/scripts/gui_management.c:268: exp[1] = experience % 100 / 10 + 154;
	ld	a, (_experience)
	ld	e, #0x64
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#10
	ld	(hl), a
;src/scripts/gui_management.c:269: exp[2] = experience % 10 + 154;
	ld	a, (_experience)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#11
	ld	(hl), a
;src/scripts/gui_management.c:270: mythril[0] = minerals / 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#13
	ld	(hl), a
;src/scripts/gui_management.c:271: mythril[1] = minerals % 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:272: set_win_tiles(12, 6, 5, 1, hp);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x105
	push	hl
	ld	hl, #0x60c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:273: set_win_tiles(14, 4, 5, 1, player_name);
	ld	de, #_player_name
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x40e
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:274: set_win_tiles(12, 8, 2, 1, atk);
	ld	hl, #5
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x80c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:275: set_win_tiles(12, 10, 2, 1, def);
	ld	hl, #7
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xa0c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:276: set_win_tiles(16, 14, 3, 1, exp);
	ld	hl, #9
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0xe10
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:277: set_win_tiles(14, 16, 2, 1, mythril);
	ld	hl, #13
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x100e
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:278: stat = sword_lvl + 154;
	ld	a, (_sword_lvl)
	add	a, #0x9a
;src/scripts/gui_management.c:279: set_win_tiles(4, 12, 1, 1, &stat);
	ldhl	sp,#12
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xc04
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:280: stat = shield_lvl + 154;
	ld	a, (_shield_lvl)
	add	a, #0x9a
;src/scripts/gui_management.c:281: set_win_tiles(4, 14, 1, 1, &stat);
	ldhl	sp,#12
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xe04
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:282: stat = arrow_lvl + 154;
	ld	a, (_arrow_lvl)
	add	a, #0x9a
;src/scripts/gui_management.c:283: set_win_tiles(4, 16, 1, 1, &stat);
	ldhl	sp,#12
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x1004
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:284: stat = quiver_lvl + 154;
	ld	a, (_quiver_lvl)
	add	a, #0x9a
;src/scripts/gui_management.c:285: set_win_tiles(9, 12, 1, 1, &stat);
	ldhl	sp,#12
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xc09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:286: stat = potion_quant_lvl + 154;
	ld	a, (_potion_quant_lvl)
	add	a, #0x9a
;src/scripts/gui_management.c:287: set_win_tiles(9, 14, 1, 1, &stat);
	ldhl	sp,#12
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xe09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:288: stat = potion_heal_lvl + 154;
	ld	a, (_potion_heal_lvl)
	add	a, #0x9a
;src/scripts/gui_management.c:289: set_win_tiles(9, 16, 1, 1, &stat);
	ldhl	sp,#12
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x1009
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:290: stat = level + 154;
	ld	a, (_level)
	add	a, #0x9a
;src/scripts/gui_management.c:291: set_win_tiles(15, 12, 1, 1, &stat);
	ldhl	sp,#12
	ld	(hl), a
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xc0f
	push	hl
	call	_set_win_tiles
;src/scripts/gui_management.c:292: }
	add	sp, #21
	ret
;src/scripts/gui_management.c:294: void set_mini_menu() BANKED {
;	---------------------------------
; Function set_mini_menu
; ---------------------------------
	b_set_mini_menu	= 3
_set_mini_menu::
	add	sp, #-11
;src/scripts/gui_management.c:295: if (menu_opened != 0) {
	ld	a, (#_menu_opened)
	or	a, a
;src/scripts/gui_management.c:296: return;
	jp	NZ, 00104$
;src/scripts/gui_management.c:302: hp[0] = current_hp/10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:303: hp[1] = current_hp % 10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
;src/scripts/gui_management.c:304: hp[2] = 176;
	ld	(hl+), a
	ld	(hl), #0xb0
;src/scripts/gui_management.c:305: hp[3] = max_hp/10 + 154;
	ld	a, (_max_hp)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:306: hp[4] = max_hp % 10 + 154;
	ld	a, (_max_hp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gui_management.c:307: n_arr[0] = num_arrows / 10 + 154;
	ld	a, (_num_arrows)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:308: n_arr[1] = num_arrows % 10 + 154;
	ld	a, (_num_arrows)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:309: n_heals[0] = heals / 10 + 154;
	ld	a, (_heals)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/gui_management.c:310: n_heals[1] = heals % 10 + 154;
	ld	a, (_heals)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#8
	ld	(hl), a
;src/scripts/gui_management.c:311: n_floor[0] = current_floor / 10 + 154;
	ld	a, (_current_floor)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#9
	ld	(hl), a
;src/scripts/gui_management.c:312: n_floor[1] = current_floor % 10 + 154;
	ld	a, (_current_floor)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#10
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/gui_management.c:314: set_win_tiles(0, 0, 20, 1, mini_gui);
	ld	de, #_mini_gui
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:315: set_win_tiles(3, 0, 5, 1, hp);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x105
	push	hl
	ld	hl, #0x03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:316: set_win_tiles(10, 0, 2, 1, n_arr);
	ld	hl, #5
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:317: set_win_tiles(13, 0, 2, 1, n_heals);
	ld	hl, #7
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:318: set_win_tiles(18, 0, 2, 1, n_floor);
	ld	hl, #9
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x12
	push	hl
	call	_set_win_tiles
	add	sp, #6
00104$:
;src/scripts/gui_management.c:319: }
	add	sp, #11
	ret
;src/scripts/gui_management.c:321: void show_number(uint8_t number, uint8_t mode, uint8_t target, uint8_t index) BANKED {
;	---------------------------------
; Function show_number
; ---------------------------------
	b_show_number	= 3
_show_number::
	add	sp, #-4
;src/scripts/gui_management.c:323: if (target == 0) {
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;src/scripts/gui_management.c:324: dmg_x = x;
	ld	a, (#_x)
	ldhl	sp,	#0
;src/scripts/gui_management.c:325: dmg_y = y-8;
	ld	(hl+), a
	ld	a, (_y)
	add	a, #0xf8
	ld	(hl), a
	jr	00106$
00105$:
;src/scripts/gui_management.c:328: if (index == 2) {
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00102$
;src/scripts/gui_management.c:329: dmg_x = boss.x+8;
	ld	a, (#(_boss + 1) + 0)
	add	a, #0x08
	ldhl	sp,	#0
;src/scripts/gui_management.c:330: dmg_y = boss.y-8;
	ld	(hl+), a
	ld	a, (#(_boss + 2) + 0)
	add	a, #0xf8
	ld	(hl), a
	jr	00106$
00102$:
;src/scripts/gui_management.c:333: dmg_x = current_enemies[index].x;
	ldhl	sp,	#13
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc, #_current_enemies
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
;src/scripts/gui_management.c:334: dmg_y = current_enemies[index].y-8;
	ld	(hl+), a
	inc	bc
	ld	a, (bc)
	add	a, #0xf8
	ld	(hl), a
00106$:
;src/scripts/gui_management.c:337: if (mode == 0) { // damage
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x4c
;src/scripts/gui_management.c:338: set_sprite_tile(0, 76);
	jr	00109$
00108$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x4b
;src/scripts/gui_management.c:341: set_sprite_tile(0, 75);
00109$:
;src/scripts/gui_management.c:343: if (number / 10 != 0) {
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	or	a, a
	jr	Z, 00111$
;src/scripts/gui_management.c:344: set_sprite_tile(1, 65 + number / 10);
	ld	a, c
	add	a, #0x41
	ldhl	sp,	#3
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	de, #(_shadow_OAM + 6)
	ld	a, (hl)
	ld	(de), a
;src/scripts/gui_management.c:344: set_sprite_tile(1, 65 + number / 10);
	jr	00112$
00111$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x32
;src/scripts/gui_management.c:347: set_sprite_tile(1, 50);
00112$:
;src/scripts/gui_management.c:350: set_sprite_tile(2, 65 + number % 10);
	ldhl	sp,	#2
	ld	a, (hl)
	push	bc
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	pop	bc
	add	a, #0x41
	ld	b, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), b
;src/scripts/gui_management.c:352: while (frame < 30) {
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	ld	e, a
	ld	(hl), #0x00
00118$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x1e
	jr	NC, 00120$
;src/scripts/gui_management.c:353: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/gui_management.c:354: if (frame %2) {
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x01
	jr	Z, 00117$
;src/scripts/gui_management.c:355: dmg_y--;
	dec	e
;src/scripts/gui_management.c:356: if (number / 10 == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00114$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;src/scripts/gui_management.c:357: move_sprite(0, dmg_x, dmg_y);
	jr	00115$
00114$:
;src/scripts/gui_management.c:360: move_sprite(0, dmg_x-8, dmg_y);
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0xf8
	ld	b, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), b
;src/scripts/gui_management.c:360: move_sprite(0, dmg_x-8, dmg_y);
00115$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;src/scripts/gui_management.c:363: move_sprite(2, dmg_x+8, dmg_y);
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;src/scripts/gui_management.c:363: move_sprite(2, dmg_x+8, dmg_y);
00117$:
;src/scripts/gui_management.c:365: frame++;
	ldhl	sp,	#3
	inc	(hl)
	jr	00118$
00120$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;src/scripts/gui_management.c:369: move_sprite(2, 0, 0);
;src/scripts/gui_management.c:370: }
	add	sp, #4
	ret
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
