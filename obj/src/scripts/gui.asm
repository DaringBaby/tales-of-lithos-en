;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module gui
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_set_map_menu
	.globl _set_map_menu
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl b_set_stats
	.globl _set_stats
	.globl _set_win_tiles
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
	.globl _game_saved
	.globl _boss_defeated
	.globl _obtained_mythril
	.globl _obtained_key
	.globl _safy_menu
	.globl _hector_menu
	.globl _mini_gui
	.globl _gui_map
	.globl _check_open_menu
	.globl _set_textbox
	.globl _set_tutorial
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
;src/scripts/gui.c:119: void check_open_menu() {
;	---------------------------------
; Function check_open_menu
; ---------------------------------
_check_open_menu::
;src/scripts/gui.c:120: current_joypad = joypad();
	call	_joypad
	ld	hl, #_current_joypad
	ld	(hl), a
;src/scripts/gui.c:121: if ((current_joypad & J_START) && !(last_joypad & J_START)) {
	ld	a, (hl)
	rlca
	jr	NC, 00107$
	ld	a, (_last_joypad)
	rlca
	jr	C, 00107$
;src/scripts/gui.c:122: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00104$
;src/scripts/gui.c:123: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/scripts/gui.c:125: set_win_tiles(0, 0, 20, 18, gui_map);
	ld	de, #_gui_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui.c:126: set_stats();
	ld	e, #b_set_stats
	ld	hl, #_set_stats
	call	___sdcc_bcall_ehl
;src/scripts/gui.c:127: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:128: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:129: menu_opened = 1;
	ld	hl, #_menu_opened
	ld	(hl), #0x01
	jr	00107$
00104$:
;src/scripts/gui.c:131: else if (menu_opened == 1) {
	ld	a, (#_menu_opened)
	dec	a
	jr	NZ, 00107$
;src/scripts/gui.c:132: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/gui.c:134: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;src/scripts/gui.c:136: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:137: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui.c:138: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00107$:
;src/scripts/gui.c:141: if ((current_joypad & J_SELECT) && !(last_joypad & J_SELECT)) {
	ld	a, (_current_joypad)
	bit	6, a
	jp	Z, 00115$
	ld	a, (_last_joypad)
	bit	6, a
	jp	NZ, 00115$
;src/scripts/gui.c:142: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00112$
;src/scripts/gui.c:143: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/scripts/gui.c:145: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;src/scripts/gui.c:146: set_win_tiles(0, 0, 20, 18, map_menu);
	ld	de, #_map_menu
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui.c:147: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/scripts/gui.c:148: set_map_menu();
	ld	e, #b_set_map_menu
	ld	hl, #_set_map_menu
	call	___sdcc_bcall_ehl
;src/scripts/gui.c:149: map_option = 0;
	xor	a, a
	ld	(#_map_option),a
;src/scripts/gui.c:150: set_win_tiles(2, 4, 1, 1, &arrow_tile);
	ld	de, #_arrow_tile
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x402
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui.c:151: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:152: menu_opened = 5;
	ld	hl, #_menu_opened
	ld	(hl), #0x05
;src/scripts/gui.c:153: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00115$
00112$:
;src/scripts/gui.c:155: else if (menu_opened == 5) {
	ld	a, (#_menu_opened)
	sub	a, #0x05
	jr	NZ, 00115$
;src/scripts/gui.c:156: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/scripts/gui.c:158: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;src/scripts/gui.c:160: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:161: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui.c:162: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00115$:
;src/scripts/gui.c:165: last_joypad = current_joypad;
	ld	a, (#_current_joypad)
	ld	(#_last_joypad),a
;src/scripts/gui.c:166: }
	ret
_gui_map:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0x8c	; 140
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbc	; 188
	.db #0xbd	; 189
	.db #0xbe	; 190
	.db #0xbf	; 191
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xc2	; 194
	.db #0xc3	; 195
	.db #0xbb	; 187
	.db #0x8d	; 141
	.db #0x80	; 128
	.db #0x8c	; 140
	.db #0x84	; 132
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc4	; 196
	.db #0xc5	; 197
	.db #0xc6	; 198
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xc8	; 200
	.db #0xc9	; 201
	.db #0xca	; 202
	.db #0xcb	; 203
	.db #0xbb	; 187
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x80	; 128
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x8a	; 138
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x92	; 146
	.db #0x84	; 132
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xa9	; 169
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xac	; 172
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x8b	; 139
	.db #0x95	; 149
	.db #0xa6	; 166
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xaa	; 170
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xad	; 173
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x84	; 132
	.db #0x92	; 146
	.db #0xa6	; 166
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xab	; 171
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xae	; 174
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb2	; 178
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
_mini_gui:
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xdc	; 220
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xdd	; 221
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xde	; 222
	.db #0xa4	; 164
	.db #0xbb	; 187
	.db #0xbb	; 187
_hector_menu:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x99	; 153
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x92	; 146
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x99	; 153
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x94	; 148
	.db #0x83	; 131
	.db #0x8e	; 142
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x99	; 153
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x85	; 133
	.db #0x91	; 145
	.db #0x84	; 132
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x84	; 132
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x99	; 153
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x85	; 133
	.db #0x80	; 128
	.db #0x91	; 145
	.db #0x84	; 132
	.db #0x93	; 147
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x82	; 130
	.db #0x8e	; 142
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x8e	; 142
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
_safy_menu:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x99	; 153
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x90	; 144
	.db #0x94	; 148
	.db #0x80	; 128
	.db #0x8d	; 141
	.db #0x93	; 147
	.db #0xa6	; 166
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x99	; 153
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x82	; 130
	.db #0x94	; 148
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x80	; 128
	.db #0x94	; 148
	.db #0x8c	; 140
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x93	; 147
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x8b	; 139
	.db #0x88	; 136
	.db #0x95	; 149
	.db #0x84	; 132
	.db #0x8b	; 139
	.db #0x8b	; 139
	.db #0x8e	; 142
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x82	; 130
	.db #0x8e	; 142
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x8e	; 142
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0xb1	; 177
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
_obtained_key:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0x82	; 130
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x95	; 149
	.db #0x84	; 132
	.db #0xbb	; 187
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x8b	; 139
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x80	; 128
	.db #0xa7	; 167
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
_obtained_mythril:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0x8c	; 140
	.db #0x98	; 152
	.db #0x93	; 147
	.db #0x87	; 135
	.db #0x91	; 145
	.db #0x88	; 136
	.db #0x8b	; 139
	.db #0xbb	; 187
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x8e	; 142
	.db #0xa7	; 167
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
_boss_defeated:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0x81	; 129
	.db #0x8e	; 142
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0xaf	; 175
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x8e	; 142
	.db #0x8d	; 141
	.db #0x85	; 133
	.db #0x88	; 136
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x8e	; 142
	.db #0xa7	; 167
	.db #0xaf	; 175
	.db #0x9c	; 156
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0x8c	; 140
	.db #0x98	; 152
	.db #0x93	; 147
	.db #0x87	; 135
	.db #0x91	; 145
	.db #0x88	; 136
	.db #0x8b	; 139
	.db #0xbb	; 187
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x8e	; 142
	.db #0xa7	; 167
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
_game_saved:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x91	; 145
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0x93	; 147
	.db #0x80	; 128
	.db #0xaf	; 175
	.db #0x92	; 146
	.db #0x80	; 128
	.db #0x8b	; 139
	.db #0x95	; 149
	.db #0x80	; 128
	.db #0x93	; 147
	.db #0x80	; 128
	.db #0xa7	; 167
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
;src/scripts/gui.c:169: void set_textbox(uint8_t item) {
;	---------------------------------
; Function set_textbox
; ---------------------------------
_set_textbox::
	ld	c, a
;src/scripts/gui.c:170: menu_opened = 4;
	ld	hl, #_menu_opened
	ld	(hl), #0x04
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x68
	ldh	(_WY_REG + 0), a
;src/scripts/gui.c:172: if (item == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00110$
;src/scripts/gui.c:173: set_win_tiles(0, 0, 20, 5, game_saved);
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
;src/scripts/gui.c:176: move_sprite(33, x, y-32);
	ld	a, (_y)
	ld	hl, #_x
	ld	l, (hl)
	add	a, #0xe0
	ld	e, a
;src/scripts/gui.c:175: else if (item == 1) {
	ld	a, c
	dec	a
	jr	NZ, 00107$
;src/scripts/gui.c:176: move_sprite(33, x, y-32);
	ld	c, l
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 132)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;src/scripts/gui.c:177: move_sprite(34, x+8, y-32);
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
;src/scripts/gui.c:178: set_win_tiles(0, 0, 20, 5, obtained_key);
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
;src/scripts/gui.c:180: else if (item == 2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00104$
;src/scripts/gui.c:181: move_sprite(35, x, y-32);
	ld	c, l
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 140)
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;src/scripts/gui.c:182: move_sprite(36, x+8, y-32);
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
;src/scripts/gui.c:183: move_sprite(37, x, y-24);
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
;src/scripts/gui.c:184: move_sprite(38, x+8, y-24);
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
;src/scripts/gui.c:185: set_win_tiles(0, 0, 20, 5, obtained_mythril);
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
;src/scripts/gui.c:187: else if (item == 3) {
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00111$
;src/scripts/gui.c:188: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:189: set_win_tiles(0, 0, 20, 5, boss_defeated);
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
;src/scripts/gui.c:192: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/gui.c:194: while(!(joypad() & (J_A))) {
00112$:
	call	_joypad
	bit	4, a
	jr	NZ, 00115$
;src/scripts/gui.c:195: wait_vbl_done();
	call	_wait_vbl_done
	jr	00112$
;src/scripts/gui.c:198: while(joypad() & (J_A)) {
00115$:
	call	_joypad
	bit	4, a
	jr	Z, 00117$
;src/scripts/gui.c:199: wait_vbl_done();
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
;src/scripts/gui.c:208: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;src/scripts/gui.c:209: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:210: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
;src/scripts/gui.c:211: }
	jp  ___sdcc_bcall_ehl
;src/scripts/gui.c:213: void set_tutorial() {
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
;src/scripts/gui.c:224: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
;src/scripts/gui.c:225: set_win_tiles(0, 0, 20, 18, TutorialMap);
	ld	de, #_TutorialMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;src/scripts/gui.c:226: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:227: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/scripts/gui.c:228: while (1) {
00104$:
;src/scripts/gui.c:229: if (joypad() & J_A) {
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
;src/scripts/gui.c:238: return;
;src/scripts/gui.c:241: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
