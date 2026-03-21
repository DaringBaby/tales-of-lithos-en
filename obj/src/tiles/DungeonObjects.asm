;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module DungeonObjects
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Objects
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
_Objects:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xbf	; 191
	.db #0x95	; 149
	.db #0xaa	; 170
	.db #0x8a	; 138
	.db #0xb5	; 181
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xa8	; 168
	.db #0x56	; 86	'V'
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x95	; 149
	.db #0x6a	; 106	'j'
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xfd	; 253
	.db #0xa9	; 169
	.db #0x55	; 85	'U'
	.db #0x51	; 81	'Q'
	.db #0xad	; 173
	.db #0xf9	; 249
	.db #0x05	; 5
	.db #0xf9	; 249
	.db #0x05	; 5
	.db #0xf9	; 249
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x4a	; 74	'J'
	.db #0x55	; 85	'U'
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0x05	; 5
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0xa0	; 160
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xfa	; 250
	.db #0xf6	; 246
	.db #0x0a	; 10
	.db #0xf2	; 242
	.db #0x0a	; 10
	.db #0xa2	; 162
	.db #0x5a	; 90	'Z'
	.db #0x06	; 6
	.db #0xfa	; 250
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x4a	; 74	'J'
	.db #0x7f	; 127
	.db #0x57	; 87	'W'
	.db #0x7f	; 127
	.db #0x4a	; 74	'J'
	.db #0x7f	; 127
	.db #0x5f	; 95
	.db #0x7f	; 127
	.db #0x5d	; 93
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0x72	; 114	'r'
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0xfe	; 254
	.db #0xda	; 218
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x4a	; 74	'J'
	.db #0x55	; 85	'U'
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0xfa	; 250
	.db #0xf6	; 246
	.db #0x0a	; 10
	.db #0xf2	; 242
	.db #0x0a	; 10
	.db #0xa2	; 162
	.db #0x5a	; 90	'Z'
	.db #0x06	; 6
	.db #0xfa	; 250
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0xfc	; 252
	.db #0x5f	; 95
	.db #0xf4	; 244
	.db #0x5f	; 95
	.db #0xf6	; 246
	.db #0x5d	; 93
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0x87	; 135
	.db #0xfa	; 250
	.db #0xf7	; 247
	.db #0x8a	; 138
	.db #0xf7	; 247
	.db #0x8a	; 138
	.db #0xf7	; 247
	.db #0x8a	; 138
	.db #0xf6	; 246
	.db #0x5d	; 93
	.db #0xf6	; 246
	.db #0x5d	; 93
	.db #0xf6	; 246
	.db #0x5d	; 93
	.db #0xf6	; 246
	.db #0x5d	; 93
	.db #0xfe	; 254
	.db #0x5f	; 95
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x8a	; 138
	.db #0xf7	; 247
	.db #0x8a	; 138
	.db #0xf7	; 247
	.db #0x8a	; 138
	.db #0xf7	; 247
	.db #0x8a	; 138
	.db #0x07	; 7
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
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
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
