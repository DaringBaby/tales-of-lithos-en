;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _check_input_keys
	.globl _game_init
	.globl _return_to_camp
	.globl _change_room
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl _check_input_movement
	.globl _check_open_menu
	.globl b_check_time
	.globl _check_time
	.globl b_check_menu_options
	.globl _check_menu_options
	.globl b_show_time
	.globl _show_time
	.globl b_check_map_options
	.globl _check_map_options
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _current_room
	.globl _arrow_tile
	.globl _menu_body
	.globl _stairs
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
;main.c:11: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:12: game_init();
	call	_game_init
;main.c:13: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:16: while(1) {
00124$:
;main.c:17: check_open_menu();
	call	_check_open_menu
;main.c:18: if (menu_opened == 0){
	ld	a, (#_menu_opened)
	or	a, a
	jr	NZ, 00119$
;main.c:19: check_input_movement();
	call	_check_input_movement
;main.c:20: check_input_keys();
	call	_check_input_keys
;main.c:21: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:22: change_room();
	call	_change_room
	jp	00120$
00119$:
;main.c:24: else if (menu_opened == 2) {
	ld	a, (#_menu_opened)
	sub	a, #0x02
	jr	NZ, 00116$
;main.c:25: check_menu_options(0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
	jr	00120$
00116$:
;main.c:27: else if (menu_opened == 3) {
	ld	a, (#_menu_opened)
	sub	a, #0x03
	jr	NZ, 00113$
;main.c:28: check_menu_options(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
	jr	00120$
00113$:
;main.c:30: else if (menu_opened == 4) {
	ld	a, (#_menu_opened)
	sub	a, #0x04
	jr	Z, 00120$
;main.c:33: else if (menu_opened == 5) {
	ld	a, (#_menu_opened)
	sub	a, #0x05
	jr	NZ, 00107$
;main.c:34: check_map_options();
	ld	e, #b_check_map_options
	ld	hl, #_check_map_options
	call	___sdcc_bcall_ehl
	jr	00120$
00107$:
;main.c:36: else if (menu_opened == 6) {
	ld	a, (#_menu_opened)
	sub	a, #0x06
	jr	NZ, 00120$
;main.c:37: if (joypad() & J_A || joypad() & J_B) {
	call	_joypad
	bit	4, a
	jr	NZ, 00101$
	call	_joypad
	bit	5, a
	jr	Z, 00102$
00101$:
;main.c:38: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:40: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:41: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:42: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:43: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:44: delay(300);
	ld	de, #0x012c
	call	_delay
00102$:
;main.c:46: show_time();
	ld	e, #b_show_time
	ld	hl, #_show_time
	call	___sdcc_bcall_ehl
00120$:
;main.c:49: if (returning_to_camp) {
	ld	hl, #_returning_to_camp
	ld	a, (hl)
	or	a, a
	jr	Z, 00122$
;main.c:50: returning_to_camp = 0;
	ld	(hl), #0x00
;main.c:51: return_to_camp();
	call	_return_to_camp
00122$:
;main.c:53: check_time();
	ld	e, #b_check_time
	ld	hl, #_check_time
	call	___sdcc_bcall_ehl
;main.c:54: wait_vbl_done();
	call	_wait_vbl_done
;main.c:56: }
	jp	00124$
_stairs:
	.db #0xf1	; 241
	.db #0xf2	; 242
	.db #0xf3	; 243
	.db #0xf4	; 244
_menu_body:
	.db #0xbb	; 187
_arrow_tile:
	.db #0xf5	; 245
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
