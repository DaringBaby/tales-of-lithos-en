;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module utils
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hUGE_dosound
	.globl _debug_value
	.globl _music_vbl_interrupt
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
;src/scripts/utils.c:3: void debug_value(uint8_t value) {
;	---------------------------------
; Function debug_value
; ---------------------------------
_debug_value::
	ld	(#_debug),a
;src/scripts/utils.c:4: debug = value;
;src/scripts/utils.c:5: }
	ret
;src/scripts/utils.c:7: void music_vbl_interrupt() {
;	---------------------------------
; Function music_vbl_interrupt
; ---------------------------------
_music_vbl_interrupt::
;src/scripts/utils.c:8: uint8_t bank_precedente = _current_bank;
	ldh	a, (__current_bank + 0)
	ld	c, a
;src/scripts/utils.c:9: SWITCH_ROM(current_song_bank);
	ld	a, (_current_song_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;src/scripts/utils.c:10: hUGE_dosound();
	push	bc
	call	_hUGE_dosound
	pop	bc
;src/scripts/utils.c:11: SWITCH_ROM(bank_precedente);
	ld	a, c
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), c
;src/scripts/utils.c:12: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
