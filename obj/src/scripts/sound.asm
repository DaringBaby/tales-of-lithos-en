;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module sound
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _delay
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
;src/scripts/sound.c:4: void init_sound() BANKED {
;	---------------------------------
; Function init_sound
; ---------------------------------
	b_init_sound	= 3
_init_sound::
;src/scripts/sound.c:5: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/scripts/sound.c:6: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/scripts/sound.c:7: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/scripts/sound.c:8: }
	ret
;src/scripts/sound.c:10: void arrow_sfx() BANKED {
;	---------------------------------
; Function arrow_sfx
; ---------------------------------
	b_arrow_sfx	= 3
_arrow_sfx::
;src/scripts/sound.c:11: NR10_REG = 0x1E;
	ld	a, #0x1e
	ldh	(_NR10_REG + 0), a
;src/scripts/sound.c:12: NR11_REG = 0x41;
	ld	a, #0x41
	ldh	(_NR11_REG + 0), a
;src/scripts/sound.c:13: NR12_REG = 0x73;
	ld	a, #0x73
	ldh	(_NR12_REG + 0), a
;src/scripts/sound.c:14: NR13_REG = 0x00;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/scripts/sound.c:15: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/scripts/sound.c:16: }
	ret
;src/scripts/sound.c:18: void hit_sfx() BANKED {
;	---------------------------------
; Function hit_sfx
; ---------------------------------
	b_hit_sfx	= 3
_hit_sfx::
;src/scripts/sound.c:19: NR41_REG = 0x1F;
	ld	a, #0x1f
	ldh	(_NR41_REG + 0), a
;src/scripts/sound.c:20: NR42_REG = 0xA1;
	ld	a, #0xa1
	ldh	(_NR42_REG + 0), a
;src/scripts/sound.c:21: NR43_REG = 0x51;
	ld	a, #0x51
	ldh	(_NR43_REG + 0), a
;src/scripts/sound.c:22: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
;src/scripts/sound.c:23: }
	ret
;src/scripts/sound.c:25: void heal_sfx() BANKED {
;	---------------------------------
; Function heal_sfx
; ---------------------------------
	b_heal_sfx	= 3
_heal_sfx::
;src/scripts/sound.c:26: NR10_REG = 0x74; 
	ld	a, #0x74
	ldh	(_NR10_REG + 0), a
;src/scripts/sound.c:27: NR11_REG = 0x87; 
	ld	a, #0x87
	ldh	(_NR11_REG + 0), a
;src/scripts/sound.c:28: NR12_REG = 0x44; 
	ld	a, #0x44
	ldh	(_NR12_REG + 0), a
;src/scripts/sound.c:29: NR13_REG = 0x73; 
	ld	a, #0x73
	ldh	(_NR13_REG + 0), a
;src/scripts/sound.c:30: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/scripts/sound.c:31: }
	ret
;src/scripts/sound.c:33: void stairs_sfx() BANKED {
;	---------------------------------
; Function stairs_sfx
; ---------------------------------
	b_stairs_sfx	= 3
_stairs_sfx::
;src/scripts/sound.c:34: NR41_REG = 0x1E; 
	ld	a, #0x1e
	ldh	(_NR41_REG + 0), a
;src/scripts/sound.c:35: NR42_REG = 0xA1; 
	ld	a, #0xa1
	ldh	(_NR42_REG + 0), a
;src/scripts/sound.c:36: NR43_REG = 0x33; 
	ld	a, #0x33
	ldh	(_NR43_REG + 0), a
;src/scripts/sound.c:37: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
;src/scripts/sound.c:38: delay(200);
	ld	de, #0x00c8
	call	_delay
;src/scripts/sound.c:39: NR41_REG = 0x1E; 
	ld	a, #0x1e
	ldh	(_NR41_REG + 0), a
;src/scripts/sound.c:40: NR42_REG = 0xA1; 
	ld	a, #0xa1
	ldh	(_NR42_REG + 0), a
;src/scripts/sound.c:41: NR43_REG = 0x32; 
	ld	a, #0x32
	ldh	(_NR43_REG + 0), a
;src/scripts/sound.c:42: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
;src/scripts/sound.c:43: }
	ret
;src/scripts/sound.c:45: void unlock_sfx() BANKED {
;	---------------------------------
; Function unlock_sfx
; ---------------------------------
	b_unlock_sfx	= 3
_unlock_sfx::
;src/scripts/sound.c:46: NR41_REG = 0x14; 
	ld	a, #0x14
	ldh	(_NR41_REG + 0), a
;src/scripts/sound.c:47: NR42_REG = 0x81; 
	ld	a, #0x81
	ldh	(_NR42_REG + 0), a
;src/scripts/sound.c:48: NR43_REG = 0x34; 
	ld	a, #0x34
	ldh	(_NR43_REG + 0), a
;src/scripts/sound.c:49: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
;src/scripts/sound.c:50: }
	ret
;src/scripts/sound.c:52: void start_sfx() BANKED {
;	---------------------------------
; Function start_sfx
; ---------------------------------
	b_start_sfx	= 3
_start_sfx::
;src/scripts/sound.c:53: NR10_REG = 0x65;
	ld	a, #0x65
	ldh	(_NR10_REG + 0), a
;src/scripts/sound.c:54: NR11_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR11_REG + 0), a
;src/scripts/sound.c:55: NR12_REG = 0x54;
	ld	a, #0x54
	ldh	(_NR12_REG + 0), a
;src/scripts/sound.c:56: NR13_REG = 0x72;
	ld	a, #0x72
	ldh	(_NR13_REG + 0), a
;src/scripts/sound.c:57: NR14_REG = 0xC6;
	ld	a, #0xc6
	ldh	(_NR14_REG + 0), a
;src/scripts/sound.c:58: }
	ret
;src/scripts/sound.c:60: void death_sfx() BANKED {
;	---------------------------------
; Function death_sfx
; ---------------------------------
	b_death_sfx	= 3
_death_sfx::
;src/scripts/sound.c:61: NR10_REG = 0x7C;
	ld	a, #0x7c
	ldh	(_NR10_REG + 0), a
;src/scripts/sound.c:62: NR11_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR11_REG + 0), a
;src/scripts/sound.c:63: NR12_REG = 0x44;
	ld	a, #0x44
	ldh	(_NR12_REG + 0), a
;src/scripts/sound.c:64: NR13_REG = 0x73;
	ld	a, #0x73
	ldh	(_NR13_REG + 0), a
;src/scripts/sound.c:65: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/scripts/sound.c:66: }
	ret
;src/scripts/sound.c:68: void enemy_death_sfx() BANKED {
;	---------------------------------
; Function enemy_death_sfx
; ---------------------------------
	b_enemy_death_sfx	= 3
_enemy_death_sfx::
;src/scripts/sound.c:69: NR41_REG = 0x01; 
	ld	a, #0x01
	ldh	(_NR41_REG + 0), a
;src/scripts/sound.c:70: NR42_REG = 0xA2; 
	ld	a, #0xa2
	ldh	(_NR42_REG + 0), a
;src/scripts/sound.c:71: NR43_REG = 0x47; 
	ld	a, #0x47
	ldh	(_NR43_REG + 0), a
;src/scripts/sound.c:72: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
;src/scripts/sound.c:73: }
	ret
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
