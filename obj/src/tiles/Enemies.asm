;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module Enemies
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Trisguardo
	.globl _PredatoreOmbra
	.globl _LarvaOscura
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
_LarvaOscura:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x7e	; 126
	.db #0x4f	; 79	'O'
	.db #0xcf	; 207
	.db #0xb4	; 180
	.db #0xb7	; 183
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe2	; 226
	.db #0xe2	; 226
	.db #0x75	; 117	'u'
	.db #0x97	; 151
	.db #0xfb	; 251
	.db #0x0d	; 13
	.db #0xef	; 239
	.db #0x35	; 53	'5'
	.db #0xdf	; 223
	.db #0x71	; 113	'q'
	.db #0xb6	; 182
	.db #0xfd	; 253
	.db #0xb6	; 182
	.db #0xfd	; 253
	.db #0xcd	; 205
	.db #0xb7	; 183
	.db #0x7a	; 122	'z'
	.db #0x4e	; 78	'N'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x96	; 150
	.db #0x9a	; 154
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_PredatoreOmbra:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x29	; 41
	.db #0x39	; 57	'9'
	.db #0x5f	; 95
	.db #0x6e	; 110	'n'
	.db #0x5b	; 91
	.db #0x67	; 103	'g'
	.db #0x7e	; 126
	.db #0x45	; 69	'E'
	.db #0x35	; 53	'5'
	.db #0x2e	; 46
	.db #0x5d	; 93
	.db #0x7f	; 127
	.db #0xf7	; 247
	.db #0xaa	; 170
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0x94	; 148
	.db #0xfc	; 252
	.db #0xfa	; 250
	.db #0x76	; 118	'v'
	.db #0xda	; 218
	.db #0xe6	; 230
	.db #0x7e	; 126
	.db #0xa2	; 162
	.db #0xac	; 172
	.db #0xf4	; 244
	.db #0xba	; 186
	.db #0xfe	; 254
	.db #0xef	; 239
	.db #0x55	; 85	'U'
	.db #0xeb	; 235
	.db #0xbf	; 191
	.db #0xf6	; 246
	.db #0xab	; 171
	.db #0xdf	; 223
	.db #0xbc	; 188
	.db #0x7e	; 126
	.db #0x47	; 71	'G'
	.db #0x6f	; 111	'o'
	.db #0x79	; 121	'y'
	.db #0xa7	; 167
	.db #0xfe	; 254
	.db #0xdd	; 221
	.db #0xbd	; 189
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xd7	; 215
	.db #0xfd	; 253
	.db #0x6f	; 111	'o'
	.db #0xd5	; 213
	.db #0xfb	; 251
	.db #0x3d	; 61
	.db #0x7e	; 126
	.db #0xe2	; 226
	.db #0xf6	; 246
	.db #0x9e	; 158
	.db #0xe5	; 229
	.db #0x7f	; 127
	.db #0xbb	; 187
	.db #0xbd	; 189
	.db #0x1f	; 31
	.db #0x1f	; 31
_Trisguardo:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0x3f	; 63
	.db #0x3a	; 58
	.db #0x6d	; 109	'm'
	.db #0x57	; 87	'W'
	.db #0x57	; 87	'W'
	.db #0x7f	; 127
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0xf8	; 248
	.db #0xb8	; 184
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xb8	; 184
	.db #0x6c	; 108	'l'
	.db #0xd4	; 212
	.db #0xd4	; 212
	.db #0xfc	; 252
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x3e	; 62
	.db #0x3a	; 58
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
