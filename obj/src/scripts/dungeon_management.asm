;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module dungeon_management
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_bkg_tiles
	.globl b_assign_obstacles
	.globl _assign_obstacles
	.globl b_put_on_room
	.globl _put_on_room
	.globl b_set_room_tiles
	.globl _set_room_tiles
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
	.area _CODE_2
;src/scripts/dungeon_management.c:8: void assign_obstacles(uint8_t x, uint8_t y) BANKED {
;	---------------------------------
; Function assign_obstacles
; ---------------------------------
	b_assign_obstacles	= 2
_assign_obstacles::
	add	sp, #-3
;src/scripts/dungeon_management.c:10: uint8_t high_obj = obstacles[x][y] >> 4;
	ld	bc, #_obstacles+0
	ldhl	sp,	#9
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	push	af
	swap	a
	and	a, #0x0f
	ld	c, a
	pop	af
;src/scripts/dungeon_management.c:11: uint8_t low_obj = obstacles[x][y] & 0x0F;
	and	a, #0x0f
	ldhl	sp,	#2
	ld	(hl), a
;src/scripts/dungeon_management.c:12: switch (high_obj) {
	ld	a, #0x06
	sub	a, c
	jp	C, 00107$
	ld	b, #0x00
	ld	hl, #00131$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00131$:
	.dw	00107$
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00104$
	.dw	00105$
	.dw	00106$
;src/scripts/dungeon_management.c:13: case 1:
00101$:
;src/scripts/dungeon_management.c:14: put_on_room(deco1, 0, 12, 6);
	ld	hl, #0x60c
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	de, #_deco1
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:15: break;
	jr	00107$
;src/scripts/dungeon_management.c:16: case 2:
00102$:
;src/scripts/dungeon_management.c:17: put_on_room(deco2, 14, 12, 6);
	ld	hl, #0x60c
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	ld	de, #_deco2
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:18: break;
	jr	00107$
;src/scripts/dungeon_management.c:19: case 3:
00103$:
;src/scripts/dungeon_management.c:20: put_on_room(deco3, 14, 0, 6);
	ld	a, #0x06
	push	af
	inc	sp
	ld	hl, #0x0e
	push	hl
	ld	de, #_deco3
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:21: break;
	jr	00107$
;src/scripts/dungeon_management.c:22: case 4:
00104$:
;src/scripts/dungeon_management.c:23: put_on_room(deco4, 0, 0, 6);
	ld	a, #0x06
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	ld	de, #_deco4
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:24: break;
	jr	00107$
;src/scripts/dungeon_management.c:25: case 5:
00105$:
;src/scripts/dungeon_management.c:26: put_on_room(deco5, 10, 4, 4);
	ld	hl, #0x404
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	de, #_deco5
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:27: break;
	jr	00107$
;src/scripts/dungeon_management.c:28: case 6:
00106$:
;src/scripts/dungeon_management.c:29: put_on_room(deco5, 6, 8, 4);
	ld	hl, #0x408
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	de, #_deco5
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:31: }
00107$:
;src/scripts/dungeon_management.c:33: switch (low_obj) {
	ld	a, #0x06
	ldhl	sp,	#2
	sub	a, (hl)
	jp	C, 00115$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00132$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00132$:
	.dw	00115$
	.dw	00108$
	.dw	00109$
	.dw	00110$
	.dw	00111$
	.dw	00112$
	.dw	00113$
;src/scripts/dungeon_management.c:34: case 1:
00108$:
;src/scripts/dungeon_management.c:35: put_on_room(deco1, 0, 12, 6);
	ld	hl, #0x60c
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	de, #_deco1
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:36: break;
	jr	00115$
;src/scripts/dungeon_management.c:37: case 2:
00109$:
;src/scripts/dungeon_management.c:38: put_on_room(deco2, 14, 12, 6);
	ld	hl, #0x60c
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	ld	de, #_deco2
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:39: break;
	jr	00115$
;src/scripts/dungeon_management.c:40: case 3:
00110$:
;src/scripts/dungeon_management.c:41: put_on_room(deco3, 14, 0, 6);
	ld	a, #0x06
	push	af
	inc	sp
	ld	hl, #0x0e
	push	hl
	ld	de, #_deco3
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:42: break;
	jr	00115$
;src/scripts/dungeon_management.c:43: case 4:
00111$:
;src/scripts/dungeon_management.c:44: put_on_room(deco4, 0, 0, 6);
	ld	bc, #_deco4
	ld	a, #0x06
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	push	bc
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:45: break;
	jr	00115$
;src/scripts/dungeon_management.c:46: case 5:
00112$:
;src/scripts/dungeon_management.c:47: put_on_room(deco5, 10, 4, 4);
	ld	hl, #0x404
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	de, #_deco5
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:48: break;
	jr	00115$
;src/scripts/dungeon_management.c:49: case 6:
00113$:
;src/scripts/dungeon_management.c:50: put_on_room(deco5, 6, 8, 4);
	ld	hl, #0x408
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	de, #_deco5
	push	de
	ld	e, #b_put_on_room
	ld	hl, #_put_on_room
	call	___sdcc_bcall_ehl
	add	sp, #5
;src/scripts/dungeon_management.c:52: }
00115$:
;src/scripts/dungeon_management.c:53: }
	add	sp, #3
	ret
;src/scripts/dungeon_management.c:55: void put_on_room(unsigned char *obstacle, uint8_t x, uint8_t y, uint8_t size) BANKED {
;	---------------------------------
; Function put_on_room
; ---------------------------------
	b_put_on_room	= 2
_put_on_room::
	add	sp, #-9
;src/scripts/dungeon_management.c:59: for (uint8_t r=0; r < size; r++) {
	ldhl	sp,	#7
	ld	(hl), #0x00
00109$:
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#19
	sub	a, (hl)
	jp	NC, 00111$
;src/scripts/dungeon_management.c:60: for (uint8_t c = 0; c < size; c++) {
	ld	e, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	call	__muluchar
	ldhl	sp,	#8
	ld	(hl), #0x00
00106$:
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#19
	sub	a, (hl)
	jr	NC, 00110$
;src/scripts/dungeon_management.c:61: tile = obstacle[(r*size) + c];
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl), a
;src/scripts/dungeon_management.c:62: if (tile > 3) {
	ld	a, #0x03
	sub	a, (hl)
	jr	NC, 00107$
;src/scripts/dungeon_management.c:63: room_idx = ((y+r) * 20) + (x + c);
	ldhl	sp,	#18
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#17
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
;src/scripts/dungeon_management.c:64: current_room[room_idx] = tile;
	ld	hl, #_current_room
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
00107$:
;src/scripts/dungeon_management.c:60: for (uint8_t c = 0; c < size; c++) {
	ldhl	sp,	#8
	inc	(hl)
	jr	00106$
00110$:
;src/scripts/dungeon_management.c:59: for (uint8_t r=0; r < size; r++) {
	ldhl	sp,	#7
	inc	(hl)
	jp	00109$
00111$:
;src/scripts/dungeon_management.c:68: }
	add	sp, #9
	ret
;src/scripts/dungeon_management.c:70: void set_room_tiles(uint8_t door, const unsigned char* room_ptr, Coords coord) BANKED {
;	---------------------------------
; Function set_room_tiles
; ---------------------------------
	b_set_room_tiles	= 2
_set_room_tiles::
	dec	sp
	dec	sp
;src/scripts/dungeon_management.c:71: switch (door) {
	ld	a, #0x0f
	ldhl	sp,	#8
	sub	a, (hl)
	jp	C, 00128$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00155$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00155$:
	.dw	00128$
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00104$
	.dw	00105$
	.dw	00106$
	.dw	00107$
	.dw	00108$
	.dw	00109$
	.dw	00110$
	.dw	00111$
	.dw	00112$
	.dw	00113$
	.dw	00114$
	.dw	00115$
;src/scripts/dungeon_management.c:72: case 1:
00101$:
;src/scripts/dungeon_management.c:73: room_ptr = room1;
	ldhl	sp,	#9
	ld	a, #<(_room1)
	ld	(hl+), a
	ld	(hl), #>(_room1)
;src/scripts/dungeon_management.c:74: break;
	jr	00128$
;src/scripts/dungeon_management.c:75: case 2:
00102$:
;src/scripts/dungeon_management.c:76: room_ptr = room2;
	ldhl	sp,	#9
	ld	a, #<(_room2)
	ld	(hl+), a
	ld	(hl), #>(_room2)
;src/scripts/dungeon_management.c:77: break;
	jr	00128$
;src/scripts/dungeon_management.c:78: case 3:
00103$:
;src/scripts/dungeon_management.c:79: room_ptr = room3;
	ldhl	sp,	#9
	ld	a, #<(_room3)
	ld	(hl+), a
	ld	(hl), #>(_room3)
;src/scripts/dungeon_management.c:80: break;
	jr	00128$
;src/scripts/dungeon_management.c:81: case 4:
00104$:
;src/scripts/dungeon_management.c:82: room_ptr = room4;
	ldhl	sp,	#9
	ld	a, #<(_room4)
	ld	(hl+), a
	ld	(hl), #>(_room4)
;src/scripts/dungeon_management.c:83: break;
	jr	00128$
;src/scripts/dungeon_management.c:84: case 5:
00105$:
;src/scripts/dungeon_management.c:85: room_ptr = room5;
	ldhl	sp,	#9
	ld	a, #<(_room5)
	ld	(hl+), a
	ld	(hl), #>(_room5)
;src/scripts/dungeon_management.c:86: break;
	jr	00128$
;src/scripts/dungeon_management.c:87: case 6:
00106$:
;src/scripts/dungeon_management.c:88: room_ptr = room6;
	ldhl	sp,	#9
	ld	a, #<(_room6)
	ld	(hl+), a
	ld	(hl), #>(_room6)
;src/scripts/dungeon_management.c:89: break;
	jr	00128$
;src/scripts/dungeon_management.c:90: case 7:
00107$:
;src/scripts/dungeon_management.c:91: room_ptr = room7;
	ldhl	sp,	#9
	ld	a, #<(_room7)
	ld	(hl+), a
	ld	(hl), #>(_room7)
;src/scripts/dungeon_management.c:92: break;
	jr	00128$
;src/scripts/dungeon_management.c:93: case 8:
00108$:
;src/scripts/dungeon_management.c:94: room_ptr = room8;
	ldhl	sp,	#9
	ld	a, #<(_room8)
	ld	(hl+), a
	ld	(hl), #>(_room8)
;src/scripts/dungeon_management.c:95: break;
	jr	00128$
;src/scripts/dungeon_management.c:96: case 9:
00109$:
;src/scripts/dungeon_management.c:97: room_ptr = room9;
	ldhl	sp,	#9
	ld	a, #<(_room9)
	ld	(hl+), a
	ld	(hl), #>(_room9)
;src/scripts/dungeon_management.c:98: break;
	jr	00128$
;src/scripts/dungeon_management.c:99: case 10:
00110$:
;src/scripts/dungeon_management.c:100: room_ptr = room10;
	ldhl	sp,	#9
	ld	a, #<(_room10)
	ld	(hl+), a
	ld	(hl), #>(_room10)
;src/scripts/dungeon_management.c:101: break;
	jr	00128$
;src/scripts/dungeon_management.c:102: case 11:
00111$:
;src/scripts/dungeon_management.c:103: room_ptr = room11;
	ldhl	sp,	#9
	ld	a, #<(_room11)
	ld	(hl+), a
	ld	(hl), #>(_room11)
;src/scripts/dungeon_management.c:104: break;
	jr	00128$
;src/scripts/dungeon_management.c:105: case 12:
00112$:
;src/scripts/dungeon_management.c:106: room_ptr = room12;
	ldhl	sp,	#9
	ld	a, #<(_room12)
	ld	(hl+), a
	ld	(hl), #>(_room12)
;src/scripts/dungeon_management.c:107: break;
	jr	00128$
;src/scripts/dungeon_management.c:108: case 13:
00113$:
;src/scripts/dungeon_management.c:109: room_ptr = room13;
	ldhl	sp,	#9
	ld	a, #<(_room13)
	ld	(hl+), a
	ld	(hl), #>(_room13)
;src/scripts/dungeon_management.c:110: break;
	jr	00128$
;src/scripts/dungeon_management.c:111: case 14:
00114$:
;src/scripts/dungeon_management.c:112: room_ptr = room14;
	ldhl	sp,	#9
	ld	a, #<(_room14)
	ld	(hl+), a
	ld	(hl), #>(_room14)
;src/scripts/dungeon_management.c:113: break;
	jr	00128$
;src/scripts/dungeon_management.c:114: case 15:
00115$:
;src/scripts/dungeon_management.c:115: room_ptr = room15;
	ldhl	sp,	#9
	ld	a, #<(_room15)
	ld	(hl+), a
	ld	(hl), #>(_room15)
;src/scripts/dungeon_management.c:118: for (uint16_t i = 0; i<360; i++) {
00128$:
	ld	bc, #0x0000
00122$:
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0x68
	ld	a, d
	sbc	a, #0x01
	jr	NC, 00117$
;src/scripts/dungeon_management.c:119: current_room[i] = room_ptr[i];
	ld	hl, #_current_room
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	pop	hl
	push	hl
	ld	(hl), a
;src/scripts/dungeon_management.c:118: for (uint16_t i = 0; i<360; i++) {
	inc	bc
	jr	00122$
00117$:
;src/scripts/dungeon_management.c:121: if (dungeon[coord.x][coord.y] == 'A' || dungeon[coord.x][coord.y] == 'B') {
	ldhl	sp,	#11
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_dungeon
	add	hl, de
	pop	de
	inc	bc
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	cp	a, #0x41
	jr	Z, 00118$
	sub	a, #0x42
	jr	NZ, 00119$
00118$:
;src/scripts/dungeon_management.c:122: assign_obstacles(coord.x, coord.y);
	ld	d, c
	push	de
	ld	e, #b_assign_obstacles
	ld	hl, #_assign_obstacles
	call	___sdcc_bcall_ehl
	pop	hl
00119$:
;src/scripts/dungeon_management.c:124: set_bkg_tiles(0, 0, 20, 18, current_room);
	ld	de, #_current_room
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
;src/scripts/dungeon_management.c:125: }
	add	sp, #8
	ret
	.area _CODE_2
	.area _INITIALIZER
	.area _CABS (ABS)
