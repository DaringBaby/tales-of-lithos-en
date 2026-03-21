;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module generate_dungeon
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_generate_enemies
	.globl _generate_enemies
	.globl b_get_num_enemies
	.globl _get_num_enemies
	.globl _rand
	.globl _display_off
	.globl _wait_vbl_done
	.globl _locked_door
	.globl _obstacles
	.globl _doors
	.globl _dungeon
	.globl _max_length
	.globl _min_length
	.globl b_generate_dungeon
	.globl _generate_dungeon
	.globl _empty_array
	.globl _create_layout
	.globl _append
	.globl _add_branch
	.globl _find_near_void_cell
	.globl _shuffle_starts
	.globl _create_doors
	.globl _add_obstacles
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_dungeon::
	.ds 16
_doors::
	.ds 16
_obstacles::
	.ds 16
_locked_door::
	.ds 1
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
;src/scripts/generate_dungeon.c:23: void generate_dungeon(uint8_t current_floor) BANKED {
;	---------------------------------
; Function generate_dungeon
; ---------------------------------
	b_generate_dungeon	= 1
_generate_dungeon::
	add	sp, #-3
;src/scripts/generate_dungeon.c:24: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/generate_dungeon.c:25: DISPLAY_OFF;
	call	_display_off
;src/scripts/generate_dungeon.c:26: uint8_t dungeon_complete = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;src/scripts/generate_dungeon.c:27: uint8_t floor = current_floor;
;src/scripts/generate_dungeon.c:28: uint8_t num_enemies = get_num_enemies(floor);
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_get_num_enemies
	ld	hl, #_get_num_enemies
	call	___sdcc_bcall_ehl
	inc	sp
	ldhl	sp,	#1
	ld	(hl), a
;src/scripts/generate_dungeon.c:29: while (!dungeon_complete){
	ldhl	sp,	#2
	ld	(hl), #0x00
00111$:
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	NZ, 00113$
;src/scripts/generate_dungeon.c:30: empty_array();
	call	_empty_array
;src/scripts/generate_dungeon.c:31: uint8_t start_x = rand() % 4;
	call	_rand
	ld	a, e
	and	a, #0x03
	ld	c, a
;src/scripts/generate_dungeon.c:32: uint8_t start_y = rand() % 4;
	call	_rand
	ld	a, e
	and	a, #0x03
	ld	b, a
;src/scripts/generate_dungeon.c:35: switch (current_floor % 5) {
	ldhl	sp,	#9
	ld	a, (hl)
	push	bc
	ld	e, #0x05
	call	__moduchar
	ld	a, c
	pop	bc
	or	a, a
	jr	Z, 00105$
	cp	a, #0x01
	jr	Z, 00101$
	cp	a, #0x02
	jr	Z, 00102$
	cp	a, #0x03
	jr	Z, 00103$
	sub	a, #0x04
	jr	Z, 00104$
	jr	00106$
;src/scripts/generate_dungeon.c:36: case 1:
00101$:
;src/scripts/generate_dungeon.c:37: length = 6;
	ldhl	sp,	#2
	ld	(hl), #0x06
;src/scripts/generate_dungeon.c:38: break;
	jr	00106$
;src/scripts/generate_dungeon.c:39: case 2:
00102$:
;src/scripts/generate_dungeon.c:40: length = 7;
	ldhl	sp,	#2
	ld	(hl), #0x07
;src/scripts/generate_dungeon.c:41: break;
	jr	00106$
;src/scripts/generate_dungeon.c:42: case 3:
00103$:
;src/scripts/generate_dungeon.c:43: length = 8;
	ldhl	sp,	#2
	ld	(hl), #0x08
;src/scripts/generate_dungeon.c:44: break;
	jr	00106$
;src/scripts/generate_dungeon.c:45: case 4:
00104$:
;src/scripts/generate_dungeon.c:46: length = 9;
	ldhl	sp,	#2
	ld	(hl), #0x09
;src/scripts/generate_dungeon.c:47: break;
	jr	00106$
;src/scripts/generate_dungeon.c:48: case 0:
00105$:
;src/scripts/generate_dungeon.c:49: length = 10;
	ldhl	sp,	#2
	ld	(hl), #0x0a
;src/scripts/generate_dungeon.c:51: };
00106$:
;src/scripts/generate_dungeon.c:53: dungeon[start_x][start_y] = 'S';
	ld	l, c
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_dungeon
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0x53
;src/scripts/generate_dungeon.c:54: if (create_layout(start_x, start_y, length)) {
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, b
	ld	a, c
	call	_create_layout
	or	a, a
	jr	Z, 00111$
;src/scripts/generate_dungeon.c:55: uint8_t key = add_branch('A', 'K');
	ld	e, #0x4b
	ld	a, #0x41
	call	_add_branch
;src/scripts/generate_dungeon.c:56: if (key) {
	or	a, a
	jr	Z, 00111$
;src/scripts/generate_dungeon.c:57: dungeon_complete = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;src/scripts/generate_dungeon.c:58: add_branch('B', 'T');
	ld	e, #0x54
	ld	a, #0x42
	call	_add_branch
	jp	00111$
00113$:
;src/scripts/generate_dungeon.c:62: generate_enemies(num_enemies, dungeon, floor);
	ld	bc, #_dungeon
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_generate_enemies
	ld	hl, #_generate_enemies
	call	___sdcc_bcall_ehl
	add	sp, #4
;src/scripts/generate_dungeon.c:63: wait_vbl_done();
	call	_wait_vbl_done
;src/scripts/generate_dungeon.c:64: }
	add	sp, #3
	ret
_min_length:
	.db #0x06	; 6
_max_length:
	.db #0x0a	; 10
;src/scripts/generate_dungeon.c:66: void empty_array(){
;	---------------------------------
; Function empty_array
; ---------------------------------
_empty_array::
	add	sp, #-5
;src/scripts/generate_dungeon.c:67: for (int i=0; i<4; i++) {
	ld	bc, #0x0000
00107$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00109$
;src/scripts/generate_dungeon.c:68: for (int j=0; j<4; j++) {
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	sla	e
	rl	d
	push	de
	ld	hl, #_dungeon
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_doors
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00108$
;src/scripts/generate_dungeon.c:69: dungeon[i][j] = '0';
	pop	de
	push	de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x30
;src/scripts/generate_dungeon.c:70: doors[i][j] = 0;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;src/scripts/generate_dungeon.c:68: for (int j=0; j<4; j++) {
	ldhl	sp,	#4
	inc	(hl)
	jr	00104$
00108$:
;src/scripts/generate_dungeon.c:67: for (int i=0; i<4; i++) {
	inc	bc
	jr	00107$
00109$:
;src/scripts/generate_dungeon.c:73: }
	add	sp, #5
	ret
;src/scripts/generate_dungeon.c:75: uint8_t create_layout(uint8_t curr_x, uint8_t curr_y, uint8_t target_rooms) {
;	---------------------------------
; Function create_layout
; ---------------------------------
_create_layout::
	add	sp, #-15
	ldhl	sp,	#13
	ld	(hl-), a
;src/scripts/generate_dungeon.c:78: while (curr_room < target_rooms) {
	ld	a, e
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x01
	ldhl	sp,	#5
	ld	(hl), #0x00
00134$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#17
	sub	a, (hl)
	jp	NC, 00136$
;src/scripts/generate_dungeon.c:80: uint8_t num_dirs = 0;
	ldhl	sp,	#4
	ld	(hl), #0x00
;src/scripts/generate_dungeon.c:82: if (curr_y > 0 && dungeon[curr_x][curr_y - 1] == '0') {
	ldhl	sp,	#13
	ld	a, (hl-)
	ld	c, a
	xor	a, a
	push	af
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	pop	af
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#6
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	ld	de, #_dungeon
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	dec	e
	ld	d, #0x00
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x30
	jr	NZ, 00102$
;src/scripts/generate_dungeon.c:83: append(directions, '1', &num_dirs);
	ldhl	sp,	#4
	push	hl
	ld	a, #0x31
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_append
00102$:
;src/scripts/generate_dungeon.c:85: if (curr_x < 3 && dungeon[curr_x+1][curr_y] == '0') {
	ldhl	sp,	#13
	ld	a,(hl)
	ld	c,a
	sub	a, #0x03
	jr	NC, 00105$
	ld	a, c
	inc	a
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_dungeon)
	ld	e, a
	ld	a, h
	adc	a, #>(_dungeon)
	ld	d, a
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	sub	a, #0x30
	jr	NZ, 00105$
;src/scripts/generate_dungeon.c:86: append(directions, '2', &num_dirs);
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	push	bc
	push	de
	ld	a, #0x32
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_append
	pop	bc
00105$:
;src/scripts/generate_dungeon.c:88: if (curr_y < 3 && dungeon[curr_x][curr_y+1] == '0') {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00108$
	ld	de, #_dungeon
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	l, (hl)
	inc	l
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	sub	a, #0x30
	jr	NZ, 00108$
;src/scripts/generate_dungeon.c:89: append(directions, '3', &num_dirs);
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	push	bc
	push	de
	ld	a, #0x33
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_append
	pop	bc
00108$:
;src/scripts/generate_dungeon.c:91: if (curr_x > 0 && dungeon[curr_x-1][curr_y] == '0') {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	ld	a, c
	dec	a
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_dungeon)
	ld	c, a
	ld	a, h
	adc	a, #>(_dungeon)
	ld	b, a
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x30
	jr	NZ, 00111$
;src/scripts/generate_dungeon.c:92: append(directions, '4', &num_dirs);
	ldhl	sp,	#4
	push	hl
	ld	a, #0x34
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_append
00111$:
;src/scripts/generate_dungeon.c:95: if (num_dirs == 0) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
;src/scripts/generate_dungeon.c:96: return 0;
	xor	a, a
	jp	00137$
00114$:
;src/scripts/generate_dungeon.c:100: uint8_t vx = curr_x;
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#10
;src/scripts/generate_dungeon.c:101: uint8_t vy = curr_y;
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl), a
;src/scripts/generate_dungeon.c:104: uint8_t dir = directions[rand() % num_dirs];
	call	_rand
	ld	a, e
	ldhl	sp,	#4
	ld	e, (hl)
	call	__moduchar
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	a, (hl)
;src/scripts/generate_dungeon.c:108: switch (dir) {
	cp	a, #0x31
	jr	Z, 00115$
;src/scripts/generate_dungeon.c:117: doors[vx][vy] |= EST;
	ldhl	sp,	#10
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	sla	c
	rl	b
;src/scripts/generate_dungeon.c:108: switch (dir) {
	cp	a, #0x32
	jr	Z, 00116$
	cp	a, #0x33
	jr	Z, 00117$
	sub	a, #0x34
	jp	Z, 00118$
	jp	00119$
;src/scripts/generate_dungeon.c:109: case '1':
00115$:
;src/scripts/generate_dungeon.c:110: curr_y--;
	ldhl	sp,	#12
	dec	(hl)
;src/scripts/generate_dungeon.c:111: doors[vx][vy] |= NORD;
	ld	de, #_doors
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	set	0, a
	ld	(de), a
;src/scripts/generate_dungeon.c:112: current_door = NORD;
	ldhl	sp,	#5
	ld	(hl), #0x01
;src/scripts/generate_dungeon.c:113: doors[curr_x][curr_y] |= SUD;
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	2, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:114: break;
	jp	00119$
;src/scripts/generate_dungeon.c:115: case '2':
00116$:
;src/scripts/generate_dungeon.c:116: curr_x++;
	ldhl	sp,	#13
	inc	(hl)
;src/scripts/generate_dungeon.c:117: doors[vx][vy] |= EST;
	ld	hl, #_doors
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	1, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:118: current_door = EST;
	ldhl	sp,	#5
	ld	(hl), #0x02
;src/scripts/generate_dungeon.c:82: if (curr_y > 0 && dungeon[curr_x][curr_y - 1] == '0') {
	ldhl	sp,	#13
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#6
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/scripts/generate_dungeon.c:119: doors[curr_x][curr_y] |= OVEST;
	ld	de, #_doors
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	3, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:120: break;
	jr	00119$
;src/scripts/generate_dungeon.c:121: case '3':
00117$:
;src/scripts/generate_dungeon.c:122: curr_y++;
	ldhl	sp,	#12
	inc	(hl)
;src/scripts/generate_dungeon.c:123: doors[vx][vy] |= SUD;
	ld	de, #_doors
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	set	2, a
	ld	(de), a
;src/scripts/generate_dungeon.c:124: current_door = SUD;
	ldhl	sp,	#5
	ld	(hl), #0x04
;src/scripts/generate_dungeon.c:125: doors[curr_x][curr_y] |= NORD;
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	0, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:126: break;
	jr	00119$
;src/scripts/generate_dungeon.c:127: case '4':
00118$:
;src/scripts/generate_dungeon.c:128: curr_x--;
	ldhl	sp,	#13
	dec	(hl)
;src/scripts/generate_dungeon.c:129: doors[vx][vy] |= OVEST;
	ld	hl, #_doors
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	3, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:130: current_door = OVEST;
	ldhl	sp,	#5
	ld	(hl), #0x08
;src/scripts/generate_dungeon.c:82: if (curr_y > 0 && dungeon[curr_x][curr_y - 1] == '0') {
	ldhl	sp,	#13
	ld	c, (hl)
	xor	a, a
	sla	c
	adc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#6
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/scripts/generate_dungeon.c:131: doors[curr_x][curr_y] |= EST;
	ld	de, #_doors
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	1, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:133: }
00119$:
;src/scripts/generate_dungeon.c:135: curr_room++;
	ldhl	sp,	#14
	inc	(hl)
;src/scripts/generate_dungeon.c:138: if (curr_room == target_rooms) {
	ld	a, (hl)
	ldhl	sp,	#17
	sub	a, (hl)
	jr	NZ, 00132$
;src/scripts/generate_dungeon.c:139: dungeon[curr_x][curr_y] = 'E';
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_dungeon
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x45
	jp	00134$
00132$:
;src/scripts/generate_dungeon.c:141: else if (curr_room == (int)(target_rooms / 2) + 1) {
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	c, (hl)
	ld	b, #0x00
	sra	b
	rr	c
	inc	bc
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00129$
	xor	a, a
	sub	a, b
	jr	NZ, 00129$
;src/scripts/generate_dungeon.c:142: dungeon[curr_x][curr_y] = 'L';
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_dungeon
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	(hl), #0x4c
;src/scripts/generate_dungeon.c:143: add_obstacles(curr_x, curr_y);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
	call	_add_obstacles
	jp	00134$
00129$:
;src/scripts/generate_dungeon.c:145: else if (curr_room == (int)(target_rooms / 2) + 2) {
	ldhl	sp,	#8
	ld	a, (hl+)
	inc	hl
	ld	c, a
	ld	b, #0x00
	sra	b
	rr	c
	inc	bc
	inc	bc
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00126$
	xor	a, a
	sub	a, b
	jr	NZ, 00126$
;src/scripts/generate_dungeon.c:146: locked_door = current_door;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_locked_door),a
;src/scripts/generate_dungeon.c:147: add_obstacles(curr_x, curr_y);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
	call	_add_obstacles
	jp	00134$
00126$:
;src/scripts/generate_dungeon.c:149: else if (curr_room < (int)(target_rooms / 2) + 1) {
	ldhl	sp,	#8
	ld	a, (hl+)
	inc	hl
	ld	c, a
	ld	b, #0x00
	sra	b
	rr	c
	inc	bc
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00123$
;src/scripts/generate_dungeon.c:150: dungeon[curr_x][curr_y] = 'A';
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_dungeon
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x41
;src/scripts/generate_dungeon.c:151: add_obstacles(curr_x, curr_y);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
	call	_add_obstacles
	jp	00134$
00123$:
;src/scripts/generate_dungeon.c:153: else if (curr_room > (int) (target_rooms / 2) + 1) {
	ldhl	sp,	#8
	ld	a, (hl+)
	inc	hl
	ld	c, a
	ld	b, #0x00
	sra	b
	rr	c
	inc	bc
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	NC, 00134$
;src/scripts/generate_dungeon.c:154: dungeon[curr_x][curr_y] = 'B';
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_dungeon
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	(hl), #0x42
;src/scripts/generate_dungeon.c:155: add_obstacles(curr_x, curr_y);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
	call	_add_obstacles
	jp	00134$
00136$:
;src/scripts/generate_dungeon.c:159: return 1;
	ld	a, #0x01
00137$:
;src/scripts/generate_dungeon.c:160: }
	add	sp, #15
	pop	hl
	inc	sp
	jp	(hl)
;src/scripts/generate_dungeon.c:163: void append(char directions[], char value, uint8_t *num_dirs) {
;	---------------------------------
; Function append
; ---------------------------------
_append::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/generate_dungeon.c:164: if (*num_dirs < 4) {
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	cp	a, #0x04
	jr	NC, 00103$
;src/scripts/generate_dungeon.c:165: directions[*num_dirs] = value;
	add	a, e
	ld	e, a
	ld	a, #0x00
	adc	a, d
	ld	d, a
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;src/scripts/generate_dungeon.c:166: (*num_dirs)++;
	ld	a, (bc)
	inc	a
	ld	(bc), a
00103$:
;src/scripts/generate_dungeon.c:168: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;src/scripts/generate_dungeon.c:170: uint8_t add_branch(char zone, char item) {
;	---------------------------------
; Function add_branch
; ---------------------------------
_add_branch::
	add	sp, #-61
	ldhl	sp,	#57
	ld	(hl-), a
	ld	(hl), e
;src/scripts/generate_dungeon.c:172: uint8_t starts_count = 0;
	ldhl	sp,	#44
	ld	(hl), #0x00
;src/scripts/generate_dungeon.c:175: for (int i=0; i<4; i++) {
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, #0x4b
	ld	a, #0x01
	jr	Z, 00219$
	xor	a, a
00219$:
	ldhl	sp,	#45
	ld	(hl), a
	ldhl	sp,	#56
	ld	a, (hl)
	sub	a, #0x54
	ld	a, #0x01
	jr	Z, 00221$
	xor	a, a
00221$:
	ldhl	sp,	#46
	ld	(hl), a
	xor	a, a
	ldhl	sp,	#58
	ld	(hl+), a
	ld	(hl), a
00125$:
	ldhl	sp,	#58
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jp	NC, 00113$
;src/scripts/generate_dungeon.c:176: for (int j=0; j<4; j++) {
	dec	hl
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #_dungeon
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#49
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#48
	ld	(hl), a
	ld	hl, #_dungeon
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#51
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#50
	ld	(hl), a
	ldhl	sp,	#60
	ld	(hl), #0x00
00122$:
	ldhl	sp,	#60
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00126$
;src/scripts/generate_dungeon.c:179: possible_starts[starts_count].x = i;
	ldhl	sp,	#44
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#58
	ld	a, (hl)
	ldhl	sp,	#51
	ld	(hl), a
;src/scripts/generate_dungeon.c:180: possible_starts[starts_count].y = j;
	ldhl	sp,	#60
	ld	a, (hl)
	ldhl	sp,	#52
	ld	(hl), a
;src/scripts/generate_dungeon.c:181: starts_count++;
	ldhl	sp,	#44
	ld	a, (hl)
	inc	a
	ldhl	sp,	#53
;src/scripts/generate_dungeon.c:179: possible_starts[starts_count].x = i;
	ld	(hl+), a
	sla	c
	rl	b
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/scripts/generate_dungeon.c:177: if (item == 'K') {
	ldhl	sp,	#45
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
;src/scripts/generate_dungeon.c:178: if (dungeon[i][j] == zone || dungeon[i][j] == 'S') {
	ldhl	sp,#47
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#60
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#57
	ld	a, (hl)
	sub	a, c
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x53
	jr	NZ, 00123$
00101$:
;src/scripts/generate_dungeon.c:179: possible_starts[starts_count].x = i;
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#54
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#51
;src/scripts/generate_dungeon.c:180: possible_starts[starts_count].y = j;
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
;src/scripts/generate_dungeon.c:181: starts_count++;
	ld	a, (hl+)
	ld	(bc), a
	ld	a, (hl)
	ldhl	sp,	#44
	ld	(hl), a
	jr	00123$
00110$:
;src/scripts/generate_dungeon.c:184: else if (item == 'T') {
	ldhl	sp,	#46
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
;src/scripts/generate_dungeon.c:185: if (dungeon[i][j] == zone || dungeon[i][j] == 'G') {
	ldhl	sp,#49
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#60
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#57
	cp	a, (hl)
	jr	Z, 00104$
	sub	a, #0x47
	jr	NZ, 00123$
00104$:
;src/scripts/generate_dungeon.c:186: possible_starts[starts_count].x = i;
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#54
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#51
;src/scripts/generate_dungeon.c:187: possible_starts[starts_count].y = j;
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
;src/scripts/generate_dungeon.c:188: starts_count++;
	ld	a, (hl+)
	ld	(bc), a
	ld	a, (hl)
	ldhl	sp,	#44
	ld	(hl), a
00123$:
;src/scripts/generate_dungeon.c:176: for (int j=0; j<4; j++) {
	ldhl	sp,	#60
	inc	(hl)
	jp	00122$
00126$:
;src/scripts/generate_dungeon.c:175: for (int i=0; i<4; i++) {
	ldhl	sp,	#58
	inc	(hl)
	jp	00125$
00113$:
;src/scripts/generate_dungeon.c:194: shuffle_starts(possible_starts, starts_count);
	ldhl	sp,	#44
	ld	a, (hl)
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_shuffle_starts
;src/scripts/generate_dungeon.c:196: for (uint8_t i=0; i<starts_count; i++) {
	ldhl	sp,	#60
	ld	(hl), #0x00
00128$:
	ldhl	sp,	#60
	ld	a, (hl)
	ldhl	sp,	#44
	sub	a, (hl)
	jp	NC, 00120$
;src/scripts/generate_dungeon.c:197: Coords start = possible_starts[i];
	ldhl	sp,	#60
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	hl, #34
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scripts/generate_dungeon.c:198: Coords dir_branch = find_near_void_cell(start);
	ld	hl,#0x21
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#42
	push	hl
	call	_find_near_void_cell
	ld	de, #0x0002
	push	de
	ld	hl, #42
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #36
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scripts/generate_dungeon.c:199: if (dir_branch.x != 0 || dir_branch.y != 0) {
	ldhl	sp,	#34
	ld	a, (hl)
	or	a, a
	jr	NZ, 00117$
	inc	hl
	ld	c, (hl)
	inc	c
	dec	c
	jp	Z, 00129$
00117$:
;src/scripts/generate_dungeon.c:200: uint8_t br_x = start.x + dir_branch.x;
	ldhl	sp,	#32
	ld	c, (hl)
	add	a, c
	ldhl	sp,	#54
	ld	(hl), a
;src/scripts/generate_dungeon.c:201: uint8_t br_y = start.y + dir_branch.y;
	ldhl	sp,	#33
	ld	a, (hl+)
	inc	hl
	ld	c, (hl)
	add	a, c
	ldhl	sp,	#55
;src/scripts/generate_dungeon.c:202: dungeon[br_x][br_y] = zone;
	ld	(hl-), a
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_dungeon)
	ld	c, a
	ld	a, h
	adc	a, #>(_dungeon)
	ld	b, a
	ldhl	sp,	#55
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#57
;src/scripts/generate_dungeon.c:203: add_obstacles(br_x, br_y);
	ld	a, (hl-)
	dec	hl
	ld	(bc), a
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	call	_add_obstacles
;src/scripts/generate_dungeon.c:204: create_doors(start.x, start.y, br_x, br_y, dir_branch);
	ldhl	sp,	#33
	ld	a, (hl-)
	ld	c, a
	ld	b, (hl)
	ld	hl,#0x23
	add	hl,sp
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	ldhl	sp,	#57
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	ld	e, c
	ld	a, b
	call	_create_doors
;src/scripts/generate_dungeon.c:205: Coords br = {br_x, br_y};
	ldhl	sp,	#54
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#55
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl), a
;src/scripts/generate_dungeon.c:206: Coords final_dir = find_near_void_cell(br);
	ld	hl,#0x25
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#44
	push	hl
	call	_find_near_void_cell
	ld	de, #0x0002
	push	de
	ld	hl, #44
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #40
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scripts/generate_dungeon.c:207: if (final_dir.x != 0 || final_dir.y != 0) {
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#58
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#59
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00114$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
00114$:
;src/scripts/generate_dungeon.c:208: uint8_t obj_x = br_x + final_dir.x;
	ldhl	sp,	#54
	ld	a, (hl)
	ldhl	sp,	#58
	add	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
;src/scripts/generate_dungeon.c:209: uint8_t obj_y = br_y + final_dir.y;
	ldhl	sp,	#55
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#59
	add	a, (hl)
;src/scripts/generate_dungeon.c:210: dungeon[obj_x][obj_y] = item;
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#52
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00232$:
	ldhl	sp,	#52
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00232$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_dungeon
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#59
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#56
	ld	a, (hl)
	ld	(bc), a
;src/scripts/generate_dungeon.c:211: create_doors(br_x, br_y, obj_x, obj_y, final_dir);
	ld	hl,#0x27
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	ldhl	sp,	#61
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	ldhl	sp,	#59
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	call	_create_doors
;src/scripts/generate_dungeon.c:212: return 1;
	ld	a, #0x01
	jr	00130$
00129$:
;src/scripts/generate_dungeon.c:196: for (uint8_t i=0; i<starts_count; i++) {
	ldhl	sp,	#60
	inc	(hl)
	jp	00128$
00120$:
;src/scripts/generate_dungeon.c:216: return 0;
	xor	a, a
00130$:
;src/scripts/generate_dungeon.c:217: }
	add	sp, #61
	ret
;src/scripts/generate_dungeon.c:219: Coords find_near_void_cell(Coords start) {
;	---------------------------------
; Function find_near_void_cell
; ---------------------------------
_find_near_void_cell::
	add	sp, #-19
;src/scripts/generate_dungeon.c:220: Coords dirs[4] = {{0 , -1}, {1 , 0}, {0 , 1}, {-1 , 0}};
	ldhl	sp,	#2
	xor	a, a
	ld	(hl+), a
	ld	a, #0xff
	ld	(hl+), a
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	a, #0x01
	ld	(hl+), a
	ld	a, #0xff
	ld	(hl+), a
;src/scripts/generate_dungeon.c:221: Coords fail = {0 , 0};
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/generate_dungeon.c:224: for (uint8_t i = 3; i > 0; i--) {
	ldhl	sp,	#18
	ld	(hl), #0x03
00111$:
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	Z, 00126$
;src/scripts/generate_dungeon.c:225: uint8_t j = rand() % (i+1);
	call	_rand
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	xor	a, a
	ld	d, a
	call	__modsint
	ldhl	sp,	#17
;src/scripts/generate_dungeon.c:226: Coords temp = dirs[i];
	ld	a, c
	ld	(hl-), a
	dec	hl
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	ld	hl, #2
	add	hl, sp
	add	hl, bc
	ld	e, l
	ld	d, h
	push	de
	ld	bc, #0x0002
	push	bc
	ld	c, e
	ld	b, d
	ld	hl, #16
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	pop	de
;src/scripts/generate_dungeon.c:227: dirs[i] = dirs[j];
	ldhl	sp,	#17
	ld	c, (hl)
	xor	a, a
	ld	b, a
	sla	c
	rl	b
	ld	hl, #2
	add	hl, sp
	add	hl, bc
	push	hl
	ld	bc, #0x0002
	push	bc
	ld	c, l
	ld	b, h
	call	___memcpy
	pop	hl
;src/scripts/generate_dungeon.c:228: dirs[j] = temp;
	ld	de, #0x0002
	push	de
	push	hl
	ld	hl, #16
	add	hl, sp
	ld	c, l
	ld	b, h
	pop	de
	call	___memcpy
;src/scripts/generate_dungeon.c:224: for (uint8_t i = 3; i > 0; i--) {
	ldhl	sp,	#18
	dec	(hl)
	jr	00111$
;src/scripts/generate_dungeon.c:231: for (uint8_t i = 0; i < 4; i++) {
00126$:
	ldhl	sp,	#18
	ld	(hl), #0x00
00114$:
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00109$
;src/scripts/generate_dungeon.c:232: Coords dir = dirs[i];
	ld	c, (hl)
	xor	a, a
	ld	b, a
	sla	c
	rl	b
	ld	hl, #2
	add	hl, sp
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	hl, #14
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/scripts/generate_dungeon.c:233: uint8_t nx = start.x + dir.x;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#12
	ld	c, (hl)
	add	a, c
	ld	c, a
;src/scripts/generate_dungeon.c:234: uint8_t ny = start.y + dir.y;
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#13
	ld	b, (hl)
	add	a, b
	ldhl	sp,	#17
	ld	(hl), a
;src/scripts/generate_dungeon.c:235: if (nx >= 0 && nx < 4 && ny >= 0 && ny < 4) {
	ld	a, c
	sub	a, #0x04
	jr	NC, 00115$
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00115$
;src/scripts/generate_dungeon.c:236: if (dungeon[nx][ny] == '0') {
	dec	hl
	dec	hl
	ld	a, c
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00173$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00173$
	pop	de
	push	de
	ld	hl, #_dungeon
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	sub	a, #0x30
	jr	NZ, 00115$
;src/scripts/generate_dungeon.c:237: return dir;
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jr	00116$
00115$:
;src/scripts/generate_dungeon.c:231: for (uint8_t i = 0; i < 4; i++) {
	ldhl	sp,	#18
	inc	(hl)
	jp	00114$
00109$:
;src/scripts/generate_dungeon.c:241: return fail;
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
00116$:
;src/scripts/generate_dungeon.c:242: }
	add	sp, #19
	pop	hl
	add	sp, #4
	jp	(hl)
;src/scripts/generate_dungeon.c:245: void shuffle_starts(Coords possible_starts[], uint8_t starts_count) {
;	---------------------------------
; Function shuffle_starts
; ---------------------------------
_shuffle_starts::
	add	sp, #-8
	ldhl	sp,	#5
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
;src/scripts/generate_dungeon.c:246: if (starts_count < 2) {
	ld	(hl), a
	sub	a, #0x02
;src/scripts/generate_dungeon.c:247: return;
	jr	C, 00107$
;src/scripts/generate_dungeon.c:249: for (uint8_t i = starts_count - 1; i > 0; i--) {
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	ldhl	sp,	#7
	ld	(hl), a
00105$:
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
;src/scripts/generate_dungeon.c:250: uint8_t j = rand() % (i+1);
	call	_rand
	ld	a, e
	ldhl	sp,	#7
	ld	e, (hl)
	ld	d, #0x00
	ld	c, e
	ld	b, d
	inc	bc
	ld	l, #0x00
	push	de
	ld	e, a
	ld	d, l
	call	__modsint
	pop	de
	ldhl	sp,	#3
;src/scripts/generate_dungeon.c:251: Coords temp = possible_starts[i];
	ld	a, c
	ld	(hl+), a
	inc	hl
	sla	e
	rl	d
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	push	de
	ld	bc, #0x0002
	push	bc
	ld	c, e
	ld	b, d
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	pop	de
;src/scripts/generate_dungeon.c:252: possible_starts[i] = possible_starts[j];
	ldhl	sp,	#3
	ld	a, (hl+)
	inc	hl
	ld	c, a
	xor	a, a
	ld	b, a
	sla	c
	rl	b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	bc, #0x0002
	push	bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	___memcpy
;src/scripts/generate_dungeon.c:253: possible_starts[j] = temp;
	ld	de, #0x0002
	push	de
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	___memcpy
;src/scripts/generate_dungeon.c:249: for (uint8_t i = starts_count - 1; i > 0; i--) {
	ldhl	sp,	#7
	dec	(hl)
	jr	00105$
00107$:
;src/scripts/generate_dungeon.c:255: }
	add	sp, #8
	ret
;src/scripts/generate_dungeon.c:257: void create_doors(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, Coords dir) {
;	---------------------------------
; Function create_doors
; ---------------------------------
_create_doors::
	add	sp, #-4
	ld	c, a
	ldhl	sp,	#3
	ld	(hl), e
;src/scripts/generate_dungeon.c:258: if (dir.x == 0 && dir.y == -1) {
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/scripts/generate_dungeon.c:259: doors[x1][y1] |= NORD;
	ld	b, #0x00
;src/scripts/generate_dungeon.c:260: doors[x2][y2] |= SUD;
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
;src/scripts/generate_dungeon.c:259: doors[x1][y1] |= NORD;
	sla	c
	rl	b
	sla	c
	rl	b
;src/scripts/generate_dungeon.c:260: doors[x2][y2] |= SUD;
	sla	e
	rl	d
	sla	e
	rl	d
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
;src/scripts/generate_dungeon.c:258: if (dir.x == 0 && dir.y == -1) {
	ld	a, d
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
	ldhl	sp,	#9
	ld	a, (hl)
	inc	a
	jr	NZ, 00113$
;src/scripts/generate_dungeon.c:259: doors[x1][y1] |= NORD;
	ld	de, #_doors+0
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	0, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:260: doors[x2][y2] |= SUD;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	2, a
	ld	(bc), a
	jp	00116$
00113$:
;src/scripts/generate_dungeon.c:262: else if (dir.x == 1 && dir.y == 0) {
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00109$
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
;src/scripts/generate_dungeon.c:263: doors[x1][y1] |= EST;
	ld	de, #_doors+0
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	1, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:264: doors[x2][y2] |= OVEST;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	3, a
	ld	(bc), a
	jr	00116$
00109$:
;src/scripts/generate_dungeon.c:266: else if (dir.x == 0 && dir.y == 1) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
	ldhl	sp,	#9
	ld	a, (hl)
	dec	a
	jr	NZ, 00105$
;src/scripts/generate_dungeon.c:267: doors[x1][y1] |= SUD;
	ld	de, #_doors+0
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	2, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:268: doors[x2][y2] |= NORD;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	0, a
	ld	(bc), a
	jr	00116$
00105$:
;src/scripts/generate_dungeon.c:270: else if (dir.x == -1 && dir.y == 0) {
	ldhl	sp,	#0
	ld	a, (hl)
	inc	a
	jr	NZ, 00116$
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
;src/scripts/generate_dungeon.c:271: doors[x1][y1] |= OVEST;
	ld	de, #_doors+0
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	3, a
	ld	(bc), a
;src/scripts/generate_dungeon.c:272: doors[x2][y2] |= EST;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	set	1, a
	ld	(bc), a
00116$:
;src/scripts/generate_dungeon.c:274: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
;src/scripts/generate_dungeon.c:276: void add_obstacles(uint8_t x, uint8_t y) {
;	---------------------------------
; Function add_obstacles
; ---------------------------------
_add_obstacles::
	ld	b, a
	ld	c, e
;src/scripts/generate_dungeon.c:279: high_obs = rand() & 7;
	call	_rand
	ld	a, e
	and	a, #0x07
	ld	e, a
;src/scripts/generate_dungeon.c:280: obstacles[x][y] = (high_obs << 4);
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_obstacles
	add	hl, de
	pop	de
	ld	b, #0x00
	add	hl, bc
	ld	a, e
	swap	a
	and	a, #0xf0
	ld	(hl), a
;src/scripts/generate_dungeon.c:281: low_obs = rand() & 7;
	push	hl
	call	_rand
	ld	a, e
	pop	hl
	and	a, #0x07
;src/scripts/generate_dungeon.c:282: obstacles[x][y] |= low_obs;
	ld	c, (hl)
	or	a, c
	ld	(hl), a
;src/scripts/generate_dungeon.c:283: }
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
