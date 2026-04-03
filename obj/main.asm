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
	.globl b_set_mini_menu
	.globl _set_mini_menu
	.globl _return_to_camp
	.globl _change_room
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
00113$:
;main.c:17: check_open_menu();
	call	_check_open_menu
;main.c:18: switch (menu_opened) {
	ld	a, #0x06
	ld	hl, #_menu_opened
	sub	a, (hl)
	jp	C, 00109$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00146$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00146$:
	.dw	00101$
	.dw	00109$
	.dw	00102$
	.dw	00103$
	.dw	00109$
	.dw	00104$
	.dw	00105$
;main.c:19: case 0:
00101$:
;main.c:20: check_input_movement();
	call	_check_input_movement
;main.c:21: check_input_keys();
	call	_check_input_keys
;main.c:22: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:23: change_room();
	call	_change_room
;main.c:24: break;
	jr	00109$
;main.c:25: case 2:
00102$:
;main.c:26: check_menu_options(0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:27: break;
	jr	00109$
;main.c:28: case 3:
00103$:
;main.c:29: check_menu_options(1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	e, #b_check_menu_options
	ld	hl, #_check_menu_options
	call	___sdcc_bcall_ehl
	inc	sp
;main.c:30: break;
	jr	00109$
;main.c:31: case 5:
00104$:
;main.c:32: check_map_options();
	ld	e, #b_check_map_options
	ld	hl, #_check_map_options
	call	___sdcc_bcall_ehl
;main.c:33: break;
	jr	00109$
;main.c:34: case 6:
00105$:
;main.c:35: if (joypad() & J_A || joypad() & J_B) {
	call	_joypad
	bit	4, a
	jr	NZ, 00106$
	call	_joypad
	bit	5, a
	jr	Z, 00107$
00106$:
;main.c:36: DISPLAY_OFF;
	call	_display_off
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:38: menu_opened = 0;
	xor	a, a
	ld	(#_menu_opened),a
;main.c:39: set_mini_menu();
	ld	e, #b_set_mini_menu
	ld	hl, #_set_mini_menu
	call	___sdcc_bcall_ehl
;main.c:40: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:41: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:42: delay(300);
	ld	de, #0x012c
	call	_delay
00107$:
;main.c:44: show_time();
	ld	e, #b_show_time
	ld	hl, #_show_time
	call	___sdcc_bcall_ehl
;main.c:46: }
00109$:
;main.c:48: if (returning_to_camp) {
	ld	hl, #_returning_to_camp
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;main.c:49: returning_to_camp = 0;
	ld	(hl), #0x00
;main.c:50: return_to_camp();
	call	_return_to_camp
00111$:
;main.c:53: check_time();
	ld	e, #b_check_time
	ld	hl, #_check_time
	call	___sdcc_bcall_ehl
;main.c:54: wait_vbl_done();
	call	_wait_vbl_done
;main.c:56: }
	jp	00113$
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
