;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module TutorialMap
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TutorialMap
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
_TutorialMap:
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0x93	; 147
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x8e	; 142
	.db #0x91	; 145
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x8b	; 139
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x87	; 135
	.db #0x84	; 132
	.db #0x82	; 130
	.db #0x93	; 147
	.db #0x8e	; 142
	.db #0x91	; 145
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0xa6	; 166
	.db #0xbb	; 187
	.db #0x84	; 132
	.db #0x90	; 144
	.db #0x94	; 148
	.db #0x88	; 136
	.db #0x8f	; 143
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x92	; 146
	.db #0x80	; 128
	.db #0x85	; 133
	.db #0x98	; 152
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0xa6	; 166
	.db #0xbb	; 187
	.db #0x82	; 130
	.db #0x94	; 148
	.db #0x91	; 145
	.db #0x80	; 128
	.db #0xb0	; 176
	.db #0x8b	; 139
	.db #0x95	; 149
	.db #0xa6	; 166
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0xbb	; 187
	.db #0x92	; 146
	.db #0x80	; 128
	.db #0x8b	; 139
	.db #0x95	; 149
	.db #0x80	; 128
	.db #0xbb	; 187
	.db #0x8f	; 143
	.db #0x80	; 128
	.db #0x91	; 145
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0x93	; 147
	.db #0x80	; 128
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb6	; 182
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
	.area _INITIALIZER
	.area _CABS (ABS)
