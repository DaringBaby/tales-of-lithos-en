;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module numbers
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Numbers
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
	.area _CODE_1
	.area _CODE_1
_Numbers:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0xfe	; 254
	.db #0x4c	; 76	'L'
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x64	; 100	'd'
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x0c	; 12
	.db #0x7e	; 126
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0xfe	; 254
	.db #0x6c	; 108	'l'
	.db #0xfe	; 254
	.db #0xcc	; 204
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xde	; 222
	.db #0x0c	; 12
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0xfe	; 254
	.db #0x10	; 16
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
