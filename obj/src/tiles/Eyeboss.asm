;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Eyeboss
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EyeBoss
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
	.area _CODE_3
_EyeBoss:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x12	; 18
	.db #0x1d	; 29
	.db #0x75	; 117	'u'
	.db #0x7b	; 123
	.db #0xaa	; 170
	.db #0xdd	; 221
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0xde	; 222
	.db #0xda	; 218
	.db #0x3d	; 61
	.db #0x3d	; 61
	.db #0xe2	; 226
	.db #0xd7	; 215
	.db #0xeb	; 235
	.db #0xed	; 237
	.db #0x16	; 22
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x05	; 5
	.db #0xfb	; 251
	.db #0xc6	; 198
	.db #0x3d	; 61
	.db #0x6b	; 107	'k'
	.db #0xdc	; 220
	.db #0x56	; 86	'V'
	.db #0xab	; 171
	.db #0xee	; 238
	.db #0xd3	; 211
	.db #0xb2	; 178
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0xa6	; 166
	.db #0x66	; 102	'f'
	.db #0xbb	; 187
	.db #0x7d	; 125
	.db #0xad	; 173
	.db #0x73	; 115	's'
	.db #0xeb	; 235
	.db #0x9d	; 157
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x33	; 51	'3'
	.db #0x3e	; 62
	.db #0x52	; 82	'R'
	.db #0x7f	; 127
	.db #0x93	; 147
	.db #0xfe	; 254
	.db #0xa2	; 162
	.db #0xff	; 255
	.db #0xa7	; 167
	.db #0xfc	; 252
	.db #0xa6	; 166
	.db #0xfd	; 253
	.db #0x17	; 23
	.db #0xed	; 237
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0x5a	; 90	'Z'
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x5b	; 91
	.db #0x7d	; 125
	.db #0xde	; 222
	.db #0xdf	; 223
	.db #0x65	; 101	'e'
	.db #0x7f	; 127
	.db #0xbd	; 189
	.db #0xe5	; 229
	.db #0x9e	; 158
	.db #0xee	; 238
	.db #0xb3	; 179
	.db #0xff	; 255
	.db #0xbc	; 188
	.db #0x5a	; 90	'Z'
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xda	; 218
	.db #0xbe	; 190
	.db #0x7b	; 123
	.db #0xfb	; 251
	.db #0xa6	; 166
	.db #0xfe	; 254
	.db #0xbd	; 189
	.db #0xa4	; 164
	.db #0x7b	; 123
	.db #0xb6	; 182
	.db #0x7e	; 126
	.db #0xa8	; 168
	.db #0x78	; 120	'x'
	.db #0x28	; 40
	.db #0xf8	; 248
	.db #0x4c	; 76	'L'
	.db #0xfc	; 252
	.db #0xea	; 234
	.db #0x1e	; 30
	.db #0x4a	; 74	'J'
	.db #0xfe	; 254
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0x67	; 103	'g'
	.db #0xa1	; 161
	.db #0xff	; 255
	.db #0xb1	; 177
	.db #0xfe	; 254
	.db #0xae	; 174
	.db #0xef	; 239
	.db #0xb9	; 185
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0xa4	; 164
	.db #0xbc	; 188
	.db #0xd4	; 212
	.db #0x54	; 84	'T'
	.db #0x6c	; 108	'l'
	.db #0x68	; 104	'h'
	.db #0x58	; 88	'X'
	.db #0x5b	; 91
	.db #0xa7	; 167
	.db #0xb6	; 182
	.db #0x69	; 105	'i'
	.db #0x5b	; 91
	.db #0xe4	; 228
	.db #0x07	; 7
	.db #0xfa	; 250
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x3b	; 59
	.db #0x2a	; 42
	.db #0x3b	; 59
	.db #0xcb	; 203
	.db #0xf7	; 247
	.db #0xbc	; 188
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0xbf	; 191
	.db #0xb3	; 179
	.db #0x4f	; 79	'O'
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0xf4	; 244
	.db #0xfc	; 252
	.db #0x94	; 148
	.db #0x9c	; 156
	.db #0x94	; 148
	.db #0x9c	; 156
	.db #0x45	; 69	'E'
	.db #0xc7	; 199
	.db #0x9d	; 157
	.db #0x9f	; 159
	.db #0xbd	; 189
	.db #0xa7	; 167
	.db #0x3d	; 61
	.db #0x2f	; 47
	.db #0x3d	; 61
	.db #0x2b	; 43
	.db #0x2a	; 42
	.db #0x36	; 54	'6'
	.db #0x16	; 22
	.db #0x1a	; 26
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x3b	; 59
	.db #0x3a	; 58
	.db #0x2b	; 43
	.db #0x51	; 81	'Q'
	.db #0x71	; 113	'q'
	.db #0x71	; 113	'q'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0x71	; 113	'q'
	.db #0x73	; 115	's'
	.db #0x52	; 82	'R'
	.db #0x73	; 115	's'
	.db #0x52	; 82	'R'
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x9c	; 156
	.db #0x94	; 148
	.db #0x4e	; 78	'N'
	.db #0xca	; 202
	.db #0x4a	; 74	'J'
	.db #0xce	; 206
	.db #0xde	; 222
	.db #0x52	; 82	'R'
	.db #0x54	; 84	'T'
	.db #0xdc	; 220
	.db #0xd6	; 214
	.db #0x5e	; 94
	.db #0x9f	; 159
	.db #0x91	; 145
	.db #0x0e	; 14
	.db #0x0e	; 14
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
