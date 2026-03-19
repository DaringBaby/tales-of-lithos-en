;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module minimap
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_win_tiles
	.globl _stats_menu
	.globl _map_menu
	.globl _Minimap
	.globl b_set_map_menu
	.globl _set_map_menu
	.globl b_empty_map_tiles
	.globl _empty_map_tiles
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
;src/tiles/minimap.c:101: void set_map_menu() BANKED {
;	---------------------------------
; Function set_map_menu
; ---------------------------------
	b_set_map_menu	= 3
_set_map_menu::
	dec	sp
;src/tiles/minimap.c:102: uint8_t p_pos = 124;
	ldhl	sp,	#0
	ld	(hl), #0x7c
;src/tiles/minimap.c:103: if (current_location == 1) {
	ld	a, (#_current_location)
;src/tiles/minimap.c:104: for (uint8_t i = 0; i<4; i++) {
	dec	a
	jr	NZ, 00107$
	ld	c, a
00114$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00107$
;src/tiles/minimap.c:105: for (uint8_t j = 0; j<4; j++) {
	ld	b, #0x00
00111$:
	ld	a, b
	sub	a, #0x04
	jr	NC, 00115$
;src/tiles/minimap.c:106: if (doors[i][j] == 0) {
	ld	l, c
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_doors
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
;src/tiles/minimap.c:107: map[j][i] = 123;
	ld	a, b
	ld	h, #0x00
	add	a, a
	rl	h
	add	a, a
	rl	h
;src/tiles/minimap.c:106: if (doors[i][j] == 0) {
	inc	l
	dec	l
	jr	NZ, 00102$
;src/tiles/minimap.c:107: map[j][i] = 123;
	ld	l, a
	ld	de, #_map
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0x7b
	jr	00112$
00102$:
;src/tiles/minimap.c:110: map[j][i] = 107 + doors[i][j];
	add	a, #<(_map)
	ld	e, a
	ld	a, h
	adc	a, #>(_map)
	ld	d, a
	ld	a, e
	add	a, c
	ld	e, a
	jr	NC, 00172$
	inc	d
00172$:
	ld	a, l
	add	a, #0x6b
	ld	(de), a
00112$:
;src/tiles/minimap.c:105: for (uint8_t j = 0; j<4; j++) {
	inc	b
	jr	00111$
00115$:
;src/tiles/minimap.c:104: for (uint8_t i = 0; i<4; i++) {
	inc	c
	jr	00114$
00107$:
;src/tiles/minimap.c:115: set_win_tiles(13, 11, 4, 4, (uint8_t *)map);
	ld	de, #_map
	push	de
	ld	hl, #0x404
	push	hl
	ld	hl, #0xb0d
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/tiles/minimap.c:116: if (current_location == 1) {
	ld	a, (#_current_location)
	dec	a
	jr	NZ, 00116$
;src/tiles/minimap.c:117: set_win_tiles(13+player_coords.x, 11+player_coords.y, 1, 1, &p_pos);
	ld	a, (#(_player_coords + 1) + 0)
	add	a, #0x0b
	ld	c, a
	ld	a, (#_player_coords + 0)
	add	a, #0x0d
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, c
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00116$:
;src/tiles/minimap.c:119: }
	inc	sp
	ret
_Minimap:
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
_map_menu:
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
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0x8c	; 140
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0xa4	; 164
	.db #0xa4	; 164
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
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x82	; 130
	.db #0x8e	; 142
	.db #0x8d	; 141
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0x80	; 128
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
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x80	; 128
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0x82	; 130
	.db #0x87	; 135
	.db #0x84	; 132
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
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x84	; 132
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x88	; 136
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0xb3	; 179
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0xb5	; 181
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
	.db #0xba	; 186
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0xb6	; 182
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
	.db #0xba	; 186
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0xb6	; 182
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
	.db #0xba	; 186
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0xb6	; 182
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
	.db #0xba	; 186
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0x7b	; 123
	.db #0xb6	; 182
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
	.db #0xb9	; 185
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb8	; 184
	.db #0xb7	; 183
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
_stats_menu:
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
	.db #0xba	; 186
	.db #0xbb	; 187
	.db #0x8d	; 141
	.db #0x84	; 132
	.db #0x8c	; 140
	.db #0x88	; 136
	.db #0x82	; 130
	.db #0x88	; 136
	.db #0xaf	; 175
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x8e	; 142
	.db #0x8d	; 141
	.db #0x85	; 133
	.db #0xa6	; 166
	.db #0xb1	; 177
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
	.db #0x8f	; 143
	.db #0x88	; 136
	.db #0x80	; 128
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0xaf	; 175
	.db #0x8c	; 140
	.db #0x80	; 128
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x88	; 136
	.db #0x8c	; 140
	.db #0x8e	; 142
	.db #0xb1	; 177
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
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0xa6	; 166
	.db #0xaf	; 175
	.db #0x8e	; 142
	.db #0x93	; 147
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8d	; 141
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x88	; 136
	.db #0xb1	; 177
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
	.db #0x93	; 147
	.db #0x84	; 132
	.db #0x8c	; 140
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0xb1	; 177
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
;src/tiles/minimap.c:121: void empty_map_tiles() BANKED {
;	---------------------------------
; Function empty_map_tiles
; ---------------------------------
	b_empty_map_tiles	= 3
_empty_map_tiles::
;src/tiles/minimap.c:122: for (uint8_t i=0; i<4; i++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x04
	ret	NC
;src/tiles/minimap.c:123: for (uint8_t j = 0; j<4; j++) {
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x04
	jr	NC, 00108$
;src/tiles/minimap.c:124: map[i][j] = 123;
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_map
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0x7b
;src/tiles/minimap.c:123: for (uint8_t j = 0; j<4; j++) {
	inc	b
	jr	00104$
00108$:
;src/tiles/minimap.c:122: for (uint8_t i=0; i<4; i++) {
	inc	c
;src/tiles/minimap.c:127: }
	jr	00107$
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
