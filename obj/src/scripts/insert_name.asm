;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module insert_name
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _curr_letter
	.globl _option_y
	.globl _option_x
	.globl _char_option
	.globl _name_arrow
	.globl b_insert_name
	.globl _insert_name
	.globl _check_name_input
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
_char_option::
	.ds 1
_option_x::
	.ds 1
_option_y::
	.ds 1
_curr_letter::
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
	.area _CODE_3
;src/scripts/insert_name.c:23: void insert_name() BANKED {
;	---------------------------------
; Function insert_name
; ---------------------------------
	b_insert_name	= 3
_insert_name::
;src/scripts/insert_name.c:24: set_sprite_data(4, 1, name_arrow);
	ld	de, #_name_arrow
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x88
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x90
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 8)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x88
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x90
;src/scripts/insert_name.c:34: set_bkg_tiles(0, 0, 20, 18, NameMap);
	ld	de, #_NameMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/insert_name.c:35: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/scripts/insert_name.c:36: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/scripts/insert_name.c:37: while (1) {
00108$:
;src/scripts/insert_name.c:38: check_name_input();
	call	_check_name_input
;src/scripts/insert_name.c:39: move_sprite(4, option_x, option_y);
	ld	a, (_option_y)
	ld	b, a
	ld	a, (_option_x)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/scripts/insert_name.c:40: if (joypad() & J_START && player_name[0] != 164) {
	call	_joypad
	rlca
	jr	NC, 00105$
	ld	a, (#_player_name + 0)
	sub	a, #0xa4
	jr	Z, 00105$
;src/scripts/insert_name.c:41: for (int i = 0; i < 5; i++) {
	ld	c, #0x00
00125$:
	ld	a, c
	sub	a, #0x05
	jr	NC, 00103$
;src/scripts/insert_name.c:42: if (player_name[i] == 164) {
	ld	hl, #_player_name
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	sub	a, #0xa4
	jr	NZ, 00126$
;src/scripts/insert_name.c:43: player_name[i] = 187;
	ld	(hl), #0xbb
00126$:
;src/scripts/insert_name.c:41: for (int i = 0; i < 5; i++) {
	inc	c
	jr	00125$
00103$:
;src/scripts/insert_name.c:46: delay(150);
	ld	de, #0x0096
	call	_delay
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x32
;src/scripts/insert_name.c:51: return;
	ret
00105$:
;src/scripts/insert_name.c:53: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/insert_name.c:55: }
	jr	00108$
_name_arrow:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xff	; 255
;src/scripts/insert_name.c:57: void check_name_input() {
;	---------------------------------
; Function check_name_input
; ---------------------------------
_check_name_input::
;src/scripts/insert_name.c:58: if (joypad() & J_LEFT && char_option > 0) {
	call	_joypad
	bit	1, a
	jr	Z, 00129$
	ld	hl, #_char_option
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
;src/scripts/insert_name.c:59: char_option--;
	dec	(hl)
;src/scripts/insert_name.c:60: option_x -= 16;
	ld	a, (_option_x)
	add	a, #0xf0
	ld	(#_option_x),a
;src/scripts/insert_name.c:61: if (char_option % 8 == 7) {
	ld	a, (_char_option)
	and	a, #0x07
	sub	a, #0x07
	jr	NZ, 00102$
;src/scripts/insert_name.c:62: option_y-=16;
	ld	a, (_option_y)
	add	a, #0xf0
	ld	(#_option_y),a
00102$:
;src/scripts/insert_name.c:64: delay(100);
	ld	de, #0x0064
	call	_delay
	jp	00130$
00129$:
;src/scripts/insert_name.c:66: else if (joypad() & J_RIGHT && char_option < 35) {
	call	_joypad
	rrca
	jr	NC, 00125$
	ld	hl, #_char_option
	ld	a, (hl)
	sub	a, #0x23
	jr	NC, 00125$
;src/scripts/insert_name.c:67: char_option++;
	inc	(hl)
;src/scripts/insert_name.c:68: option_x += 16;
	ld	a, (_option_x)
	add	a, #0x10
	ld	(#_option_x),a
;src/scripts/insert_name.c:69: if (char_option % 8 == 0) {
	ld	a, (_char_option)
	and	a, #0x07
	jr	NZ, 00104$
;src/scripts/insert_name.c:70: option_y+=16;
	ld	a, (_option_y)
	add	a, #0x10
	ld	(#_option_y),a
00104$:
;src/scripts/insert_name.c:72: delay(100);
	ld	de, #0x0064
	call	_delay
	jp	00130$
00125$:
;src/scripts/insert_name.c:74: else if (joypad() & J_UP && char_option > 7) {
	call	_joypad
	bit	2, a
	jr	Z, 00121$
	ld	a, #0x07
	ld	hl, #_char_option
	sub	a, (hl)
	jr	NC, 00121$
;src/scripts/insert_name.c:75: char_option-=8;
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;src/scripts/insert_name.c:76: option_y-= 16;
	ld	a, (_option_y)
	add	a, #0xf0
	ld	(#_option_y),a
;src/scripts/insert_name.c:77: delay(100);
	ld	de, #0x0064
	call	_delay
	jp	00130$
00121$:
;src/scripts/insert_name.c:79: else if (joypad() & J_DOWN && char_option < 28) {
	call	_joypad
	bit	3, a
	jr	Z, 00117$
	ld	hl, #_char_option
;src/scripts/insert_name.c:80: char_option+=8;
	ld	a,(hl)
	cp	a,#0x1c
	jr	NC, 00117$
	add	a, #0x08
	ld	(hl), a
;src/scripts/insert_name.c:81: option_y+=16;
	ld	a, (_option_y)
	add	a, #0x10
	ld	(#_option_y),a
;src/scripts/insert_name.c:82: delay(100);
	ld	de, #0x0064
	call	_delay
	jr	00130$
00117$:
;src/scripts/insert_name.c:84: else if (joypad() & J_A && curr_letter < 5) {
	call	_joypad
	bit	4, a
	jr	Z, 00113$
	ld	hl, #_curr_letter
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00113$
;src/scripts/insert_name.c:85: player_name[curr_letter] = OFFSET + char_option;
	ld	bc, #_player_name+0
	ld	a, c
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (_char_option)
	add	a, #0x80
	ld	(de), a
;src/scripts/insert_name.c:86: curr_letter++;
	inc	(hl)
;src/scripts/insert_name.c:87: set_bkg_tiles(8, 4, 5, 1, player_name);
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x408
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/insert_name.c:88: if (curr_letter == 5) {
	ld	a, (#_curr_letter)
	sub	a, #0x05
	jr	NZ, 00106$
;src/scripts/insert_name.c:89: curr_letter = 4;
	ld	hl, #_curr_letter
	ld	(hl), #0x04
00106$:
;src/scripts/insert_name.c:91: delay(150);
	ld	de, #0x0096
	call	_delay
	jr	00130$
00113$:
;src/scripts/insert_name.c:93: else if (joypad() & J_B && curr_letter >= 0) {
	call	_joypad
	bit	5, a
	jr	Z, 00130$
;src/scripts/insert_name.c:95: player_name[curr_letter] = 164;
	ld	bc, #_player_name+0
	ld	a, c
	ld	hl, #_curr_letter
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, #0xa4
	ld	(de), a
;src/scripts/insert_name.c:96: curr_letter--;
	dec	(hl)
;src/scripts/insert_name.c:97: set_bkg_tiles(8, 4, 5, 1, player_name);
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x408
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;src/scripts/insert_name.c:98: if (curr_letter > 6) {
	ld	a, #0x06
	ld	hl, #_curr_letter
	sub	a, (hl)
	jr	NC, 00108$
;src/scripts/insert_name.c:99: curr_letter = 0;
	ld	(hl), #0x00
00108$:
;src/scripts/insert_name.c:101: delay(150);
	ld	de, #0x0096
	call	_delay
00130$:
;src/scripts/insert_name.c:103: if (char_option % 8 == 0) {
	ld	a, (_char_option)
	and	a, #0x07
	jr	NZ, 00141$
;src/scripts/insert_name.c:104: option_x = 24;
	ld	hl, #_option_x
	ld	(hl), #0x18
	ret
00141$:
;src/scripts/insert_name.c:106: else if (char_option % 8 == 3) {
	cp	a, #0x03
	jr	NZ, 00138$
;src/scripts/insert_name.c:107: option_x = 72;
	ld	hl, #_option_x
	ld	(hl), #0x48
	ret
00138$:
;src/scripts/insert_name.c:109: else if (char_option % 8 == 4) {
	cp	a, #0x04
	jr	NZ, 00135$
;src/scripts/insert_name.c:110: option_x = 96;
	ld	hl, #_option_x
	ld	(hl), #0x60
	ret
00135$:
;src/scripts/insert_name.c:112: else if (char_option % 8 == 7) {
	sub	a, #0x07
	ret	NZ
;src/scripts/insert_name.c:113: option_x = 144;
	ld	hl, #_option_x
	ld	(hl), #0x90
;src/scripts/insert_name.c:115: }
	ret
	.area _CODE_3
	.area _INITIALIZER
__xinit__char_option:
	.db #0x00	; 0
__xinit__option_x:
	.db #0x18	; 24
__xinit__option_y:
	.db #0x48	; 72	'H'
__xinit__curr_letter:
	.db #0x00	; 0
	.area _CABS (ABS)
