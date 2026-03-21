;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module mugshot
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Mugshot
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
_Mugshot:
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa3	; 163
	.db #0xa3	; 163
	.db #0xa6	; 166
	.db #0xa7	; 167
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xe5	; 229
	.db #0xe5	; 229
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xcd	; 205
	.db #0xcd	; 205
	.db #0xe5	; 229
	.db #0xe5	; 229
	.db #0x35	; 53	'5'
	.db #0xf5	; 245
	.db #0xa6	; 166
	.db #0xa7	; 167
	.db #0xad	; 173
	.db #0xaf	; 175
	.db #0xae	; 174
	.db #0xaf	; 175
	.db #0xbc	; 188
	.db #0xbf	; 191
	.db #0xad	; 173
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xaf	; 175
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0x49	; 73	'I'
	.db #0xff	; 255
	.db #0xd3	; 211
	.db #0xff	; 255
	.db #0xa6	; 166
	.db #0xff	; 255
	.db #0x5c	; 92
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xf6	; 246
	.db #0xe2	; 226
	.db #0x2a	; 42
	.db #0xff	; 255
	.db #0x5b	; 91
	.db #0xff	; 255
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0x6b	; 107	'k'
	.db #0xdf	; 223
	.db #0x4f	; 79	'O'
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xbd	; 189
	.db #0xfe	; 254
	.db #0x19	; 25
	.db #0xbd	; 189
	.db #0x05	; 5
	.db #0xdd	; 221
	.db #0xfd	; 253
	.db #0x7d	; 125
	.db #0xfd	; 253
	.db #0x7d	; 125
	.db #0xfd	; 253
	.db #0x75	; 117	'u'
	.db #0xf5	; 245
	.db #0x55	; 85	'U'
	.db #0xf5	; 245
	.db #0xd5	; 213
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xf5	; 245
	.db #0xb5	; 181
	.db #0xf5	; 245
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0xa3	; 163
	.db #0xa3	; 163
	.db #0xa3	; 163
	.db #0xa3	; 163
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xe2	; 226
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0xb0	; 176
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xe8	; 232
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xd3	; 211
	.db #0x31	; 49	'1'
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0xa5	; 165
	.db #0xa5	; 165
	.db #0xc5	; 197
	.db #0xc5	; 197
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xae	; 174
	.db #0xb1	; 177
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xfa	; 250
	.db #0xe4	; 228
	.db #0x15	; 21
	.db #0xe3	; 227
	.db #0x67	; 103	'g'
	.db #0x98	; 152
	.db #0xf8	; 248
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0xf6	; 246
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0x1b	; 27
	.db #0x3c	; 60
	.db #0x1b	; 27
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0xe5	; 229
	.db #0xe5	; 229
	.db #0x15	; 21
	.db #0xf5	; 245
	.db #0x2d	; 45
	.db #0xdd	; 221
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0xfe	; 254
	.area _INITIALIZER
	.area _CABS (ABS)
