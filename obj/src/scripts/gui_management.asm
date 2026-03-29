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
	.globl b_print_debug
	.globl _print_debug
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
;src/scripts/gui_management.c:8: void check_map_options() BANKED {
;	---------------------------------
; Function check_map_options
; ---------------------------------
	b_check_map_options	= 3
_check_map_options::
;src/scripts/gui_management.c:9: if (joypad() & J_UP && map_option > 0) {
	call	_joypad
	bit	2, a
	jr	Z, 00102$
	ld	hl, #_map_option
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/scripts/gui_management.c:10: set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
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
;src/scripts/gui_management.c:11: map_option--;
	ld	hl, #_map_option
	dec	(hl)
;src/scripts/gui_management.c:12: set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
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
;src/scripts/gui_management.c:13: delay(150);
	ld	de, #0x0096
	call	_delay
00102$:
;src/scripts/gui_management.c:15: if (joypad() & J_DOWN && map_option < 2) {
	call	_joypad
	bit	3, a
	jr	Z, 00105$
	ld	hl, #_map_option
	ld	a, (hl)
	sub	a, #0x02
	jr	NC, 00105$
;src/scripts/gui_management.c:16: set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
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
;src/scripts/gui_management.c:17: map_option++;
	ld	hl, #_map_option
	inc	(hl)
;src/scripts/gui_management.c:18: set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
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
;src/scripts/gui_management.c:19: delay(150);
	ld	de, #0x0096
	call	_delay
00105$:
;src/scripts/gui_management.c:21: check_map_menu_input();
	ld	e, #b_check_map_menu_input
	ld	hl, #_check_map_menu_input
;src/scripts/gui_management.c:22: }
	jp  ___sdcc_bcall_ehl
;src/scripts/gui_management.c:24: void check_map_menu_input() BANKED {
;	---------------------------------
; Function check_map_menu_input
; ---------------------------------
	b_check_map_menu_input	= 3
_check_map_menu_input::
	add	sp, #-7
;src/scripts/gui_management.c:25: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jp	Z, 00110$
;src/scripts/gui_management.c:26: switch (map_option) {
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
;src/scripts/gui_management.c:27: case 0:
00101$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/gui_management.c:29: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;src/scripts/gui_management.c:30: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui_management.c:31: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui_management.c:32: break;
	jp	00110$
;src/scripts/gui_management.c:33: case 1:
00102$:
;src/scripts/gui_management.c:34: menu_opened = 6;
	ld	hl, #_menu_opened
	ld	(hl), #0x06
;src/scripts/gui_management.c:35: set_win_tiles(0, 0, 20, 18, stats_menu);
	ld	de, #_stats_menu
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:40: def_en[0] = enemies_defeated / 100 + 154;
	ld	a, (_enemies_defeated)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:41: def_en[1] = enemies_defeated % 100 / 10 + 154;
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
;src/scripts/gui_management.c:42: def_en[2] = enemies_defeated % 10 + 154;
	ld	a, (_enemies_defeated)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gui_management.c:43: pups[0] = power_ups / 10 + 154;
	ld	a, (_power_ups)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:44: pups[1] = power_ups % 10 + 154;
	ld	a, (_power_ups)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gui_management.c:45: mfloor[0] = max_floor / 10 + 154;
	ld	a, (_max_floor)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:46: mfloor[1] = max_floor % 10 + 154;
	ld	a, (_max_floor)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:47: set_win_tiles(16, 4, 3, 1, def_en);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0x410
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:48: set_win_tiles(17, 7, 2, 1, mfloor);
	ld	hl, #5
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x711
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:49: set_win_tiles(17, 10, 2, 1, pups);
	ld	hl, #3
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xa11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:50: show_time();
	ld	e, #b_show_time
	ld	hl, #_show_time
	call	___sdcc_bcall_ehl
;src/scripts/gui_management.c:51: delay(300);
	ld	de, #0x012c
	call	_delay
;src/scripts/gui_management.c:52: break;
	jr	00110$
;src/scripts/gui_management.c:53: case 2:
00103$:
;src/scripts/gui_management.c:54: if (current_location == 1) {
	ld	a, (#_current_location)
	dec	a
	jr	NZ, 00110$
;src/scripts/gui_management.c:55: returning_to_camp = 1;
	ld	hl, #_returning_to_camp
	ld	(hl), #0x01
;src/scripts/gui_management.c:56: return;
;src/scripts/gui_management.c:59: }
00110$:
;src/scripts/gui_management.c:61: }
	add	sp, #7
	ret
;src/scripts/gui_management.c:63: void show_time() BANKED {
;	---------------------------------
; Function show_time
; ---------------------------------
	b_show_time	= 3
_show_time::
	add	sp, #-8
;src/scripts/gui_management.c:65: t[0] = hours / 10 + 154;
	ld	a, (_hours)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:66: t[1] = hours % 10 + 154;
	ld	a, (_hours)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
;src/scripts/gui_management.c:67: t[2] = 177;
	ld	(hl+), a
	ld	(hl), #0xb1
;src/scripts/gui_management.c:68: t[3] = minutes / 10 + 154;
	ld	a, (_minutes)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:69: t[4] = minutes % 10 + 154;
	ld	a, (_minutes)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
;src/scripts/gui_management.c:70: t[5] = 177;
	ld	(hl+), a
	ld	(hl), #0xb1
;src/scripts/gui_management.c:71: t[6] = seconds / 10 + 154;
	ld	a, (_seconds)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:72: t[7] = seconds % 10 + 154;
	ld	a, (_seconds)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/gui_management.c:73: set_win_tiles(11, 13, 8, 1, t);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x108
	push	hl
	ld	hl, #0xd0b
	push	hl
	call	_set_win_tiles
;src/scripts/gui_management.c:74: }
	add	sp, #14
	ret
;src/scripts/gui_management.c:76: void check_menu_options(uint8_t chara) BANKED {
;	---------------------------------
; Function check_menu_options
; ---------------------------------
	b_check_menu_options	= 3
_check_menu_options::
;src/scripts/gui_management.c:77: if (chara == 0) // Hector
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jp	NZ, 00109$
;src/scripts/gui_management.c:79: if (joypad() & J_UP && hector_option > 1) {
	call	_joypad
	bit	2, a
	jr	Z, 00105$
	ld	a, #0x01
	ld	hl, #_hector_option
	sub	a, (hl)
	jr	NC, 00105$
;src/scripts/gui_management.c:80: set_win_tiles(1, hector_option*2 - 1, 1, 1, menu_body);
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
;src/scripts/gui_management.c:81: hector_option--;
	ld	hl, #_hector_option
	dec	(hl)
;src/scripts/gui_management.c:82: set_win_tiles(1, hector_option*2 - 1, 1, 1, &arrow_tile);
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
;src/scripts/gui_management.c:83: delay(150);
	ld	de, #0x0096
	call	_delay
	jr	00106$
00105$:
;src/scripts/gui_management.c:85: else if (joypad() & J_DOWN && hector_option < 4) {
	call	_joypad
	bit	3, a
	jr	Z, 00106$
	ld	hl, #_hector_option
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00106$
;src/scripts/gui_management.c:86: set_win_tiles(1, hector_option*2 - 1, 1, 1, menu_body);
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
;src/scripts/gui_management.c:87: hector_option++;
	ld	hl, #_hector_option
	inc	(hl)
;src/scripts/gui_management.c:88: set_win_tiles(1, hector_option*2 - 1, 1, 1, &arrow_tile);
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
;src/scripts/gui_management.c:89: delay(150);
	ld	de, #0x0096
	call	_delay
00106$:
;src/scripts/gui_management.c:91: hector_upgrades();
	call	_hector_upgrades
00109$:
;src/scripts/gui_management.c:93: if (chara == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	ret	NZ
;src/scripts/gui_management.c:94: if (joypad() & J_UP && safy_option > 1) {
	call	_joypad
	bit	2, a
	jr	Z, 00114$
	ld	a, #0x01
	ld	hl, #_safy_option
	sub	a, (hl)
	jr	NC, 00114$
;src/scripts/gui_management.c:95: set_win_tiles(1, safy_option*2 - 1, 1, 1, menu_body);
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
;src/scripts/gui_management.c:96: safy_option--;
	ld	hl, #_safy_option
	dec	(hl)
;src/scripts/gui_management.c:97: set_win_tiles(1, safy_option*2 - 1, 1, 1, &arrow_tile);
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
;src/scripts/gui_management.c:98: delay(150);
	ld	de, #0x0096
	call	_delay
	jp	_safy_upgrades
00114$:
;src/scripts/gui_management.c:100: else if (joypad() & J_DOWN && safy_option < 3) {
	call	_joypad
	bit	3, a
	jp	Z, _safy_upgrades
	ld	hl, #_safy_option
	ld	a, (hl)
	sub	a, #0x03
	jp	NC, _safy_upgrades
;src/scripts/gui_management.c:101: set_win_tiles(1, safy_option*2 - 1, 1, 1, menu_body);
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
;src/scripts/gui_management.c:102: safy_option++;
	ld	hl, #_safy_option
	inc	(hl)
;src/scripts/gui_management.c:103: set_win_tiles(1, safy_option*2 - 1, 1, 1, &arrow_tile);
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
;src/scripts/gui_management.c:104: delay(150);
	ld	de, #0x0096
	call	_delay
;src/scripts/gui_management.c:106: safy_upgrades();
;src/scripts/gui_management.c:108: }
	jp	_safy_upgrades
;src/scripts/gui_management.c:110: void hector_upgrades() {
;	---------------------------------
; Function hector_upgrades
; ---------------------------------
_hector_upgrades::
	add	sp, #-4
;src/scripts/gui_management.c:111: uint8_t cost = upgrade_costs[sword_lvl-1];
	ld	de, #_upgrade_costs+0
	ld	a, (_sword_lvl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	b, (hl)
	ld	c, b
;src/scripts/gui_management.c:113: switch(hector_option) {
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
;src/scripts/gui_management.c:114: case 1:
00101$:
;src/scripts/gui_management.c:115: if (sword_lvl < 9) {
	ld	a, (#_sword_lvl)
	sub	a, #0x09
	jp	NC, 00125$
;src/scripts/gui_management.c:116: cost = upgrade_costs[sword_lvl-1];
	ld	c, b
;src/scripts/gui_management.c:117: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jp	C, 00125$
	call	_joypad
	bit	4, a
	jp	Z, 00125$
;src/scripts/gui_management.c:118: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:119: sword_lvl++;
	ld	hl, #_sword_lvl
	inc	(hl)
;src/scripts/gui_management.c:120: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:122: attack += 10;
	ld	a, (_attack)
	add	a, #0x0a
	ld	(#_attack),a
;src/scripts/gui_management.c:123: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:126: break;
	jp	00125$
;src/scripts/gui_management.c:127: case 2:
00107$:
;src/scripts/gui_management.c:128: if (shield_lvl < 9) {
	ld	hl, #_shield_lvl
	ld	a, (hl)
	sub	a, #0x09
	jp	NC, 00125$
;src/scripts/gui_management.c:129: cost = upgrade_costs[shield_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:130: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jp	C, 00125$
	call	_joypad
	bit	4, a
	jp	Z, 00125$
;src/scripts/gui_management.c:131: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:132: shield_lvl++;
	ld	hl, #_shield_lvl
	inc	(hl)
;src/scripts/gui_management.c:133: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:135: defense += 8;
	ld	a, (_defense)
	add	a, #0x08
	ld	(#_defense),a
;src/scripts/gui_management.c:136: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:139: break;
	jr	00125$
;src/scripts/gui_management.c:140: case 3:
00113$:
;src/scripts/gui_management.c:141: if (arrow_lvl < 9) {
	ld	hl, #_arrow_lvl
	ld	a, (hl)
	sub	a, #0x09
	jr	NC, 00125$
;src/scripts/gui_management.c:142: cost = upgrade_costs[arrow_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:143: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jr	C, 00125$
	call	_joypad
	bit	4, a
	jr	Z, 00125$
;src/scripts/gui_management.c:144: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:145: arrow_lvl++;
	ld	hl, #_arrow_lvl
	inc	(hl)
;src/scripts/gui_management.c:146: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:148: arrow_damage += 17;
	ld	a, (_arrow_damage)
	add	a, #0x11
	ld	(#_arrow_damage),a
;src/scripts/gui_management.c:149: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:152: break;
	jr	00125$
;src/scripts/gui_management.c:153: case 4:
00119$:
;src/scripts/gui_management.c:154: if (quiver_lvl < 9) {
	ld	hl, #_quiver_lvl
	ld	a, (hl)
	sub	a, #0x09
	jr	NC, 00125$
;src/scripts/gui_management.c:155: cost = upgrade_costs[quiver_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:156: if (minerals >= cost && joypad() & J_A) {
	ld	a, (#_minerals)
	sub	a, c
	jr	C, 00125$
	call	_joypad
	bit	4, a
	jr	Z, 00125$
;src/scripts/gui_management.c:157: minerals = minerals - cost;
	ld	hl, #_minerals
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/scripts/gui_management.c:158: quiver_lvl++;
	ld	hl, #_quiver_lvl
	inc	(hl)
;src/scripts/gui_management.c:159: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:161: max_num_arrows = max_num_arrows + 2;
	ld	a, (_max_num_arrows)
	add	a, #0x02
	ld	(#_max_num_arrows),a
;src/scripts/gui_management.c:162: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:166: }
00125$:
;src/scripts/gui_management.c:169: costs[0] = cost / 10 + 154;
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__divuchar
	ld	a, c
	pop	bc
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:170: costs[1] = cost % 10 + 154;
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/gui_management.c:171: obt[0] = minerals / 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gui_management.c:172: obt[1] = minerals % 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:173: set_win_tiles(16, 10, 2, 1, costs);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xa10
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:174: set_win_tiles(16, 12, 2, 1, obt);
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xc10
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:176: if (joypad() & J_B) {
	call	_joypad
	bit	5, a
	jr	Z, 00128$
;src/scripts/gui_management.c:177: hector_option = 1;
	ld	hl, #_hector_option
	ld	(hl), #0x01
;src/scripts/gui_management.c:178: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:179: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui_management.c:180: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui_management.c:181: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
00128$:
;src/scripts/gui_management.c:183: }
	add	sp, #4
	ret
;src/scripts/gui_management.c:185: void safy_upgrades() {
;	---------------------------------
; Function safy_upgrades
; ---------------------------------
_safy_upgrades::
	add	sp, #-11
;src/scripts/gui_management.c:186: uint8_t cost = cure_upgrade_costs[potion_quant_lvl-1];
	ld	a, (_potion_quant_lvl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, hl
	ld	de, #_cure_upgrade_costs
	add	hl, de
	ld	e, (hl)
	ld	c, e
;src/scripts/gui_management.c:187: switch(safy_option) {
	ld	a, (#_safy_option)
	dec	a
	jr	Z, 00101$
	ld	a, (#_safy_option)
	sub	a, #0x02
	jr	Z, 00107$
	ld	a, (#_safy_option)
	sub	a, #0x03
	jp	Z, 00113$
	jp	00119$
;src/scripts/gui_management.c:188: case 1:
00101$:
;src/scripts/gui_management.c:189: if (potion_quant_lvl < 9) {
	ld	a, (#_potion_quant_lvl)
	sub	a, #0x09
	jp	NC, 00119$
;src/scripts/gui_management.c:190: cost = cure_upgrade_costs[potion_quant_lvl-1];
;src/scripts/gui_management.c:191: if (experience >= cost && joypad() & J_A) {
	ld	c,e
	ld	b, #0x00
	ld	hl, #_experience
	ld	a, (hl+)
	sub	a, e
	ld	a, (hl)
	sbc	a, b
	jp	C, 00119$
	call	_joypad
	bit	4, a
	jp	Z, 00119$
;src/scripts/gui_management.c:192: experience = experience - cost;
	ld	e, c
	ld	d, #0x00
	ld	a, (_experience)
	ld	l, a
	ld	a, (_experience + 1)
	ld	h, a
	ld	a, l
	sub	a, e
	ld	e, a
	ld	a, h
	sbc	a, d
	ld	hl, #_experience
	ld	(hl), e
	inc	hl
	ld	(hl), a
;src/scripts/gui_management.c:193: potion_quant_lvl++;
	ld	hl, #_potion_quant_lvl
	inc	(hl)
;src/scripts/gui_management.c:194: heals = heals + 1;
	ld	a, (_heals)
	inc	a
	ld	(#_heals),a
;src/scripts/gui_management.c:195: max_heals++;
	ld	hl, #_max_heals
	inc	(hl)
;src/scripts/gui_management.c:196: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:197: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:200: break;
	jp	00119$
;src/scripts/gui_management.c:201: case 2:
00107$:
;src/scripts/gui_management.c:202: if (potion_heal_lvl < 9) {
	ld	hl, #_potion_heal_lvl
	ld	a, (hl)
	sub	a, #0x09
	jp	NC, 00119$
;src/scripts/gui_management.c:203: cost = cure_upgrade_costs[potion_heal_lvl-1];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	dec	hl
	add	hl, hl
	ld	de, #_cure_upgrade_costs
	add	hl, de
	ld	c, (hl)
;src/scripts/gui_management.c:204: if (experience >= cost && joypad() & J_A) {
	ld	b, c
	ld	e, #0x00
	ld	hl, #_experience
	ld	a, (hl+)
	sub	a, b
	ld	a, (hl)
	sbc	a, e
	jp	C, 00119$
	call	_joypad
	bit	4, a
	jp	Z, 00119$
;src/scripts/gui_management.c:205: experience = experience - cost;
	ld	e, c
	ld	d, #0x00
	ld	a, (_experience)
	ld	hl, #_experience + 1
	ld	b, (hl)
	dec	hl
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	(hl), e
	inc	hl
	ld	(hl), a
;src/scripts/gui_management.c:206: potion_heal_lvl++;
	ld	hl, #_potion_heal_lvl
	inc	(hl)
;src/scripts/gui_management.c:207: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:208: heal_quantity = heal_quantity + 8;
	ld	a, (_heal_quantity)
	add	a, #0x08
	ld	(#_heal_quantity),a
;src/scripts/gui_management.c:209: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:212: break;
	jr	00119$
;src/scripts/gui_management.c:213: case 3:
00113$:
;src/scripts/gui_management.c:214: if (level < 50) {
	ld	hl, #_level
	ld	a, (hl)
	sub	a, #0x32
	jr	NC, 00119$
;src/scripts/gui_management.c:215: cost = level_curve[level-1];
	ld	bc, #_level_curve+0
	ld	l, (hl)
	ld	h, #0x00
	dec	hl
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
;src/scripts/gui_management.c:216: if (experience >= cost && joypad() & J_A) {
	ld	b, c
	ld	e, #0x00
	ld	hl, #_experience
	ld	a, (hl+)
	sub	a, b
	ld	a, (hl)
	sbc	a, e
	jr	C, 00119$
	call	_joypad
	bit	4, a
	jr	Z, 00119$
;src/scripts/gui_management.c:217: experience = experience - cost;
	ld	e, c
	ld	d, #0x00
	ld	a, (_experience)
	ld	hl, #_experience + 1
	ld	b, (hl)
	dec	hl
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	(hl), e
	inc	hl
	ld	(hl), a
;src/scripts/gui_management.c:218: level++;
	ld	hl, #_level
	inc	(hl)
;src/scripts/gui_management.c:219: power_ups++;
	ld	hl, #_power_ups
	inc	(hl)
;src/scripts/gui_management.c:221: attack = attack + 2;
	ld	a, (_attack)
	add	a, #0x02
	ld	(#_attack),a
;src/scripts/gui_management.c:222: defense = defense + 1;
	ld	a, (_defense)
	inc	a
	ld	(#_defense),a
;src/scripts/gui_management.c:223: max_hp = max_hp + 4;
	ld	a, (_max_hp)
	add	a, #0x04
	ld	hl, #_max_hp
	ld	(hl), a
;src/scripts/gui_management.c:224: current_hp = max_hp;
	ld	a, (hl)
	ld	(#_current_hp),a
;src/scripts/gui_management.c:225: delay(300);
	push	bc
	ld	de, #0x012c
	call	_delay
	pop	bc
;src/scripts/gui_management.c:229: }
00119$:
;src/scripts/gui_management.c:232: costs[0] = cost / 1000 + 154;
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x9a
;src/scripts/gui_management.c:233: costs[1] = cost % 1000 / 100 + 154;
	ld	bc, #0x03e8
	pop	de
	push	de
	call	__modsint
	ld	a, c
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:234: costs[2] = cost % 100 / 10 + 154;
	ldhl	sp,	#0
	ld	c, (hl)
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
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gui_management.c:235: costs[3] = cost % 10 + 154;
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:236: if (experience > 9999) {
	ld	a, (#_experience)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_experience + 1)
	ldhl	sp,	#1
	ld	(hl-), a
	ld	a, #0x0f
	sub	a, (hl)
	inc	hl
	ld	a, #0x27
	sbc	a, (hl)
	jr	NC, 00121$
;src/scripts/gui_management.c:237: exp[0] = 163;
	ldhl	sp,	#6
	ld	(hl), #0xa3
;src/scripts/gui_management.c:238: exp[1] = 163;
	inc	hl
	ld	(hl), #0xa3
;src/scripts/gui_management.c:239: exp[2] = 163;
	inc	hl
	ld	(hl), #0xa3
;src/scripts/gui_management.c:240: exp[3] = 163;
	inc	hl
	ld	(hl), #0xa3
	jr	00122$
00121$:
;src/scripts/gui_management.c:243: exp[0] = experience % 10000 / 1000 + 154;
	ld	bc, #0x2710
	pop	de
	push	de
	call	__moduint
	ld	e, c
	ld	d, b
	ld	bc, #0x03e8
	call	__divuint
	pop	hl
	push	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:244: exp[1] = experience % 1000 / 100 + 154;
	ld	a, (_experience)
	ld	hl, #_experience + 1
	ld	d, (hl)
	ld	bc, #0x03e8
	ld	e, a
	call	__moduint
	ld	e, c
	ld	d, b
	ld	bc, #0x0064
	call	__divuint
	pop	hl
	push	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x9a
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/gui_management.c:245: exp[2] = experience % 100 / 10 + 154;
	ld	a, (_experience)
	ld	hl, #_experience + 1
	ld	d, (hl)
	ld	bc, #0x0064
	ld	e, a
	call	__moduint
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#8
	ld	(hl), a
;src/scripts/gui_management.c:246: exp[3] = experience % 10 + 154;
	ld	a, (_experience)
	ld	hl, #_experience + 1
	ld	d, (hl)
	ld	bc, #0x000a
	ld	e, a
	call	__moduint
	pop	hl
	push	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0x9a
	ld	(hl), a
00122$:
;src/scripts/gui_management.c:248: set_win_tiles(15, 10, 3, 1, costs);
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0xa0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:249: set_win_tiles(14, 12, 4, 1, exp);
	ld	hl, #6
	add	hl, sp
	push	hl
	ld	hl, #0x104
	push	hl
	ld	hl, #0xc0e
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:251: if (joypad() & J_B) {
	call	_joypad
	bit	5, a
	jr	Z, 00125$
;src/scripts/gui_management.c:252: safy_option = 1;
	ld	hl, #_safy_option
	ld	(hl), #0x01
;src/scripts/gui_management.c:253: set_win_tiles(1, 1, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:254: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui_management.c:255: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui_management.c:256: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
00125$:
;src/scripts/gui_management.c:258: }
	add	sp, #11
	ret
;src/scripts/gui_management.c:260: void set_stats() BANKED {
;	---------------------------------
; Function set_stats
; ---------------------------------
	b_set_stats	= 3
_set_stats::
	add	sp, #-23
;src/scripts/gui_management.c:267: if (current_hp < 100) {
	ld	a, (#_current_hp)
	sub	a, #0x64
	jr	NC, 00102$
;src/scripts/gui_management.c:268: hp[0] = 187;
	ldhl	sp,	#0
	ld	(hl), #0xbb
	jr	00103$
00102$:
;src/scripts/gui_management.c:271: hp[0] = current_hp / 100 + 154;
	ld	a, (_current_hp)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
00103$:
;src/scripts/gui_management.c:273: hp[1] = current_hp % 100 / 10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x64
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/gui_management.c:274: hp[2] = current_hp % 10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
;src/scripts/gui_management.c:275: hp[3] = 176;
	ld	(hl+), a
	ld	(hl), #0xb0
;src/scripts/gui_management.c:277: hp[4] = 187;
;src/scripts/gui_management.c:276: if (max_hp < 100) {
	ld	a, (#_max_hp)
	sub	a, #0x64
	jr	NC, 00105$
;src/scripts/gui_management.c:277: hp[4] = 187;
	ldhl	sp,	#4
	ld	(hl), #0xbb
	jr	00106$
00105$:
;src/scripts/gui_management.c:280: hp[4] = max_hp / 100 + 154;
	ld	a, (_max_hp)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
	ld	(hl), a
00106$:
;src/scripts/gui_management.c:282: hp[5] = max_hp % 100 / 10 + 154;
	ld	a, (_max_hp)
	ld	e, #0x64
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:283: hp[6] = max_hp % 10 + 154;
	ld	a, (_max_hp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:284: atk[0] = attack / 10 + 154;
	ld	a, (_attack)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/gui_management.c:285: atk[1] = attack % 10 + 154;
	ld	a, (_attack)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#8
	ld	(hl), a
;src/scripts/gui_management.c:286: def[0] = defense / 10 + 154;
	ld	a, (_defense)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#9
	ld	(hl), a
;src/scripts/gui_management.c:287: def[1] = defense % 10 + 154;
	ld	a, (_defense)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#10
	ld	(hl), a
;src/scripts/gui_management.c:289: uint8_t d3 = (experience% 10000 / 1000);
	ld	a, (#_experience)
	ldhl	sp,	#17
	ld	(hl), a
	ld	a, (#_experience + 1)
	ldhl	sp,	#18
	ld	(hl-), a
	ld	bc, #0x2710
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__moduint
	ld	e, c
	ld	d, b
	ld	bc, #0x03e8
	call	__divuint
	ldhl	sp,	#19
;src/scripts/gui_management.c:290: uint8_t d2 = (experience % 1000) / 100;
	ld	a, c
	ld	(hl-), a
	dec	hl
	ld	bc, #0x03e8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__moduint
	ld	e, c
	ld	d, b
	ld	bc, #0x0064
	call	__divuint
	ldhl	sp,	#20
	ld	(hl), c
;src/scripts/gui_management.c:291: uint8_t d1 = (experience % 100) / 10;
	ld	bc, #0x0064
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__moduint
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ldhl	sp,	#21
	ld	(hl), c
;src/scripts/gui_management.c:292: uint8_t d0 = (experience % 10);
	ld	bc, #0x000a
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__moduint
	ldhl	sp,	#22
	ld	(hl), c
;src/scripts/gui_management.c:293: if (experience > 9999) {
	ldhl	sp,	#17
	ld	a, #0x0f
	sub	a, (hl)
	inc	hl
	ld	a, #0x27
	sbc	a, (hl)
	jr	NC, 00108$
;src/scripts/gui_management.c:294: exp[0] = 163;
	ldhl	sp,	#11
	ld	(hl), #0xa3
;src/scripts/gui_management.c:295: exp[1] = 163;
	inc	hl
	ld	(hl), #0xa3
;src/scripts/gui_management.c:296: exp[2] = 163;
	inc	hl
	ld	(hl), #0xa3
;src/scripts/gui_management.c:297: exp[3] = 163;
	inc	hl
	ld	(hl), #0xa3
	jr	00109$
00108$:
;src/scripts/gui_management.c:300: exp[0] = (d3 == 0) ? 12 : (d3 + 154);
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	NZ, 00112$
	ld	a, #0x0c
	jr	00113$
00112$:
	ldhl	sp,	#19
	ld	a, (hl)
	add	a, #0x9a
00113$:
	ldhl	sp,	#11
	ld	(hl), a
;src/scripts/gui_management.c:301: exp[1] = (d2 == 0 && d3 == 0) ? 12 : (d2 + 154);
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
	ld	a, #0x0c
	jr	00115$
00114$:
	ldhl	sp,	#20
	ld	a, (hl)
	add	a, #0x9a
00115$:
	ldhl	sp,	#12
	ld	(hl), a
;src/scripts/gui_management.c:302: exp[2] = (d1 == 0 && d2 == 0 && d3 == 0) ? 12 : (d1 + 154);
	ld	hl,#0xd
	add	hl,sp
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	jr	NZ, 00119$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00119$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00119$
	ld	a, #0x0c
	jr	00120$
00119$:
	ldhl	sp,	#21
	ld	a, (hl)
	add	a, #0x9a
00120$:
	ld	(de), a
;src/scripts/gui_management.c:303: exp[3] = d0 + 154;
	ldhl	sp,	#22
	ld	a, (hl)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
00109$:
;src/scripts/gui_management.c:306: mythril[0] = minerals / 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#15
	ld	(hl), a
;src/scripts/gui_management.c:307: mythril[1] = minerals % 10 + 154;
	ld	a, (_minerals)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#16
	ld	(hl), a
;src/scripts/gui_management.c:308: set_win_tiles(12, 6, 7, 1, hp);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x107
	push	hl
	ld	hl, #0x60c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:309: set_win_tiles(14, 4, 5, 1, player_name);
	ld	de, #_player_name
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x40e
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:310: set_win_tiles(12, 8, 2, 1, atk);
	ld	hl, #7
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x80c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:311: set_win_tiles(12, 10, 2, 1, def);
	ld	hl, #9
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0xa0c
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:312: set_win_tiles(15, 14, 4, 1, exp);
	ld	hl, #11
	add	hl, sp
	push	hl
	ld	hl, #0x104
	push	hl
	ld	hl, #0xe0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:313: set_win_tiles(14, 16, 2, 1, mythril);
	ld	hl, #15
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x100e
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:314: stat = sword_lvl + 154;
	ld	a, (_sword_lvl)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:315: set_win_tiles(4, 12, 1, 1, &stat);
	ld	hl, #14
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xc04
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:316: stat = shield_lvl + 154;
	ld	a, (_shield_lvl)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:317: set_win_tiles(4, 14, 1, 1, &stat);
	ld	hl, #14
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xe04
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:318: stat = arrow_lvl + 154;
	ld	a, (_arrow_lvl)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:319: set_win_tiles(4, 16, 1, 1, &stat);
	ld	hl, #14
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x1004
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:320: stat = quiver_lvl + 154;
	ld	a, (_quiver_lvl)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:321: set_win_tiles(9, 12, 1, 1, &stat);
	ld	hl, #14
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xc09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:322: stat = potion_quant_lvl + 154;
	ld	a, (_potion_quant_lvl)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:323: set_win_tiles(9, 14, 1, 1, &stat);
	ld	hl, #14
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xe09
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:324: stat = potion_heal_lvl + 154;
	ld	a, (_potion_heal_lvl)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:325: set_win_tiles(9, 16, 1, 1, &stat);
	ld	hl, #14
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x1009
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:326: stat = level + 154;
	ld	a, (_level)
	add	a, #0x9a
	ldhl	sp,	#14
	ld	(hl), a
;src/scripts/gui_management.c:327: set_win_tiles(15, 12, 1, 1, &stat);
	ld	hl, #14
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0xc0f
	push	hl
	call	_set_win_tiles
;src/scripts/gui_management.c:328: }
	add	sp, #29
	ret
;src/scripts/gui_management.c:330: void set_mini_menu() BANKED {
;	---------------------------------
; Function set_mini_menu
; ---------------------------------
	b_set_mini_menu	= 3
_set_mini_menu::
	add	sp, #-10
;src/scripts/gui_management.c:331: if (menu_opened != 0) {
	ld	a, (#_menu_opened)
	or	a, a
;src/scripts/gui_management.c:332: return;
	jp	NZ, 00110$
;src/scripts/gui_management.c:338: if (max_hp < 100) {
	ld	a, (#_max_hp)
	sub	a, #0x64
	jr	NC, 00104$
;src/scripts/gui_management.c:339: hp[0] = 187;
	ldhl	sp,	#0
	ld	(hl), #0xbb
	jr	00105$
00104$:
;src/scripts/gui_management.c:342: hp[0] = current_hp / 100 + 154;
	ld	a, (_current_hp)
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
00105$:
;src/scripts/gui_management.c:344: hp[1] = current_hp % 100 / 10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x64
	call	__moduchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/gui_management.c:345: hp[2] = current_hp % 10 + 154;
	ld	a, (_current_hp)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gui_management.c:346: n_arr[0] = num_arrows / 10 + 154;
	ld	a, (_num_arrows)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#3
	ld	(hl), a
;src/scripts/gui_management.c:347: n_arr[1] = num_arrows % 10 + 154;
	ld	a, (_num_arrows)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/gui_management.c:348: n_heals[0] = heals / 10 + 154;
	ld	a, (_heals)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#5
	ld	(hl), a
;src/scripts/gui_management.c:349: n_heals[1] = heals % 10 + 154;
	ld	a, (_heals)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#6
	ld	(hl), a
;src/scripts/gui_management.c:350: n_floor[0] = current_floor / 10 + 154;
	ld	a, (_current_floor)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#7
	ld	(hl), a
;src/scripts/gui_management.c:351: n_floor[1] = current_floor % 10 + 154;
	ld	a, (_current_floor)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#8
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/gui_management.c:353: set_win_tiles(0, 0, 20, 1, mini_gui);
	ld	de, #_mini_gui
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:354: uint8_t obtained = 223;
	ldhl	sp,	#9
	ld	(hl), #0xdf
;src/scripts/gui_management.c:355: if (key_obtained) {
	ld	a, (#_key_obtained)
	or	a, a
	jr	Z, 00107$
;src/scripts/gui_management.c:356: obtained = 223;
	ldhl	sp,	#9
	ld	(hl), #0xdf
	jr	00108$
00107$:
;src/scripts/gui_management.c:359: obtained = 187;
	ldhl	sp,	#9
	ld	(hl), #0xbb
00108$:
;src/scripts/gui_management.c:361: set_win_tiles(7, 0, 1, 1, &obtained);
	ld	hl, #9
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	hl, #0x07
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:363: set_win_tiles(3, 0, 3, 1, hp);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0x03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:364: set_win_tiles(10, 0, 2, 1, n_arr);
	ld	hl, #3
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:365: set_win_tiles(13, 0, 2, 1, n_heals);
	ld	hl, #5
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0d
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui_management.c:366: set_win_tiles(18, 0, 2, 1, n_floor);
	ld	hl, #7
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x12
	push	hl
	call	_set_win_tiles
	add	sp, #6
00110$:
;src/scripts/gui_management.c:367: }
	add	sp, #10
	ret
;src/scripts/gui_management.c:369: void show_number(uint8_t number, uint8_t mode, uint8_t target, uint8_t index) BANKED {
;	---------------------------------
; Function show_number
; ---------------------------------
	b_show_number	= 3
_show_number::
	add	sp, #-4
;src/scripts/gui_management.c:371: if (target == 0) {
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;src/scripts/gui_management.c:372: dmg_x = x;
	ld	a, (#_x)
	ldhl	sp,	#0
;src/scripts/gui_management.c:373: dmg_y = y-8;
	ld	(hl+), a
	ld	a, (_y)
	add	a, #0xf8
	ld	(hl), a
	jr	00106$
00105$:
;src/scripts/gui_management.c:376: if (index == 2) {
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00102$
;src/scripts/gui_management.c:377: dmg_x = boss.x+8;
	ld	a, (#(_boss + 1) + 0)
	add	a, #0x08
	ldhl	sp,	#0
;src/scripts/gui_management.c:378: dmg_y = boss.y-8;
	ld	(hl+), a
	ld	a, (#(_boss + 2) + 0)
	add	a, #0xf8
	ld	(hl), a
	jr	00106$
00102$:
;src/scripts/gui_management.c:381: dmg_x = current_enemies[index].x;
	ldhl	sp,	#13
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
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
;src/scripts/gui_management.c:382: dmg_y = current_enemies[index].y-8;
	ld	(hl+), a
	inc	bc
	ld	a, (bc)
	add	a, #0xf8
	ld	(hl), a
00106$:
;src/scripts/gui_management.c:385: if (mode == 0) { // damage
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x4c
;src/scripts/gui_management.c:386: set_sprite_tile(0, 76);
	jr	00109$
00108$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x4b
;src/scripts/gui_management.c:389: set_sprite_tile(0, 75);
00109$:
;src/scripts/gui_management.c:391: if (number / 10 != 0) {
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
;src/scripts/gui_management.c:392: set_sprite_tile(1, 65 + number / 10);
	ld	a, c
	add	a, #0x41
	ldhl	sp,	#3
	ld	(hl), a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	de, #(_shadow_OAM + 6)
	ld	a, (hl)
	ld	(de), a
;src/scripts/gui_management.c:392: set_sprite_tile(1, 65 + number / 10);
	jr	00112$
00111$:
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x32
;src/scripts/gui_management.c:395: set_sprite_tile(1, 50);
00112$:
;src/scripts/gui_management.c:398: set_sprite_tile(2, 65 + number % 10);
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
;src/scripts/gui_management.c:400: while (frame < 30) {
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
;src/scripts/gui_management.c:401: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/gui_management.c:402: if (frame %2) {
	ldhl	sp,	#3
	ld	a, (hl)
	and	a, #0x01
	jr	Z, 00117$
;src/scripts/gui_management.c:403: dmg_y--;
	dec	e
;src/scripts/gui_management.c:404: if (number / 10 == 0) {
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
;src/scripts/gui_management.c:405: move_sprite(0, dmg_x, dmg_y);
	jr	00115$
00114$:
;src/scripts/gui_management.c:408: move_sprite(0, dmg_x-8, dmg_y);
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
;src/scripts/gui_management.c:408: move_sprite(0, dmg_x-8, dmg_y);
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
;src/scripts/gui_management.c:411: move_sprite(2, dmg_x+8, dmg_y);
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
;src/scripts/gui_management.c:411: move_sprite(2, dmg_x+8, dmg_y);
00117$:
;src/scripts/gui_management.c:413: frame++;
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
;src/scripts/gui_management.c:417: move_sprite(2, 0, 0);
;src/scripts/gui_management.c:418: }
	add	sp, #4
	ret
;src/scripts/gui_management.c:420: void print_debug(uint8_t value) BANKED {
;	---------------------------------
; Function print_debug
; ---------------------------------
	b_print_debug	= 3
_print_debug::
	add	sp, #-3
;src/scripts/gui_management.c:422: values[0] = value / 100 + 154;
	ldhl	sp,	#9
	ld	c, (hl)
	push	bc
	ld	e, #0x64
	ld	a, c
	call	__divuchar
	ld	a, c
	pop	bc
	add	a, #0x9a
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/gui_management.c:423: values[1] = value % 100 / 10 + 154;
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
;src/scripts/gui_management.c:424: values[2] = value % 10 + 154;
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	ld	a, c
	add	a, #0x9a
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/gui_management.c:425: set_win_tiles(6, 0, 3, 1, values);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_win_tiles
;src/scripts/gui_management.c:426: }
	add	sp, #9
	ret
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
