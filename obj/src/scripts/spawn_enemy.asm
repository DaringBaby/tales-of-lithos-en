;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module spawn_enemy
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enemy_death
	.globl _set_enemy_position
	.globl _set_enemy_stats
	.globl _room_enemies
	.globl b_get_num_enemies
	.globl _get_num_enemies
	.globl _add_enemy
	.globl b_generate_enemies
	.globl _generate_enemies
	.globl b_spawn_enemies_in_room
	.globl _spawn_enemies_in_room
	.globl b_set_enemy_tiles
	.globl _set_enemy_tiles
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_room_enemies::
	.ds 16
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
;src/scripts/spawn_enemy.c:9: uint8_t get_num_enemies(uint8_t floor) BANKED {
;	---------------------------------
; Function get_num_enemies
; ---------------------------------
	b_get_num_enemies	= 3
_get_num_enemies::
	dec	sp
;src/scripts/spawn_enemy.c:11: uint8_t floor_type = floor % 5;
	ldhl	sp,	#7
	ld	a, (hl)
	ld	e, #0x05
	call	__moduchar
	ldhl	sp,	#0
	ld	(hl), c
;src/scripts/spawn_enemy.c:12: uint8_t enemy_var = rand() % 3;
	call	_rand
	ld	e, c
	ld	d, b
	ld	bc, #0x0003
	call	__modsint
;src/scripts/spawn_enemy.c:13: switch (floor_type) {
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00111$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	jp	(hl)
00111$:
	.dw	00105$
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00104$
;src/scripts/spawn_enemy.c:14: case 1:
00101$:
;src/scripts/spawn_enemy.c:15: num_enemies = 3;
	ld	a, #0x03
;src/scripts/spawn_enemy.c:16: break;
	jr	00106$
;src/scripts/spawn_enemy.c:17: case 2:
00102$:
;src/scripts/spawn_enemy.c:18: num_enemies = 6;
	ld	a, #0x06
;src/scripts/spawn_enemy.c:19: break;
	jr	00106$
;src/scripts/spawn_enemy.c:20: case 3:
00103$:
;src/scripts/spawn_enemy.c:21: num_enemies = 8;
	ld	a, #0x08
;src/scripts/spawn_enemy.c:22: break;
	jr	00106$
;src/scripts/spawn_enemy.c:23: case 4:
00104$:
;src/scripts/spawn_enemy.c:24: num_enemies = 10;
	ld	a, #0x0a
;src/scripts/spawn_enemy.c:25: break;
	jr	00106$
;src/scripts/spawn_enemy.c:26: case 0:
00105$:
;src/scripts/spawn_enemy.c:27: num_enemies = 11;
	ld	a, #0x0b
;src/scripts/spawn_enemy.c:29: }
00106$:
;src/scripts/spawn_enemy.c:30: num_enemies += enemy_var;
	add	a, c
;src/scripts/spawn_enemy.c:31: return num_enemies;
;src/scripts/spawn_enemy.c:32: }
	inc	sp
	ret
;src/scripts/spawn_enemy.c:34: uint8_t add_enemy(uint8_t floor, uint8_t i, uint8_t j) {
;	---------------------------------
; Function add_enemy
; ---------------------------------
_add_enemy::
	ld	d, a
	ld	c, e
;src/scripts/spawn_enemy.c:39: switch (floor) { // per ora fino al 5
	ld	a, #0x05
	sub	a, d
	ld	a, #0x00
	rla
	ld	b, #0x00
	ld	e, b
	or	a, a
	jr	NZ, 00106$
	push	de
	ld	e, d
	ld	d, #0x00
	ld	hl, #00155$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	pop	de
	jp	(hl)
00155$:
	.dw	00106$
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00104$
	.dw	00105$
;src/scripts/spawn_enemy.c:40: case 1:
00101$:
;src/scripts/spawn_enemy.c:41: type1 = 115;
	ld	b, #0x73
;src/scripts/spawn_enemy.c:42: type2 = 13;
	ld	e, #0x0d
;src/scripts/spawn_enemy.c:44: break;
	jr	00106$
;src/scripts/spawn_enemy.c:45: case 2:
00102$:
;src/scripts/spawn_enemy.c:46: type1 = 102;
	ld	b, #0x66
;src/scripts/spawn_enemy.c:47: type2 = 23;
	ld	e, #0x17
;src/scripts/spawn_enemy.c:49: break;
	jr	00106$
;src/scripts/spawn_enemy.c:50: case 3:
00103$:
;src/scripts/spawn_enemy.c:51: type1 = 77;
	ld	b, #0x4d
;src/scripts/spawn_enemy.c:52: type2 = 38;
	ld	e, #0x26
;src/scripts/spawn_enemy.c:54: break;
	jr	00106$
;src/scripts/spawn_enemy.c:55: case 4:
00104$:
;src/scripts/spawn_enemy.c:56: type1 = 64;
	ld	b, #0x40
;src/scripts/spawn_enemy.c:57: type2 = 38;
	ld	e, #0x26
;src/scripts/spawn_enemy.c:59: break;
	jr	00106$
;src/scripts/spawn_enemy.c:60: case 5:
00105$:
;src/scripts/spawn_enemy.c:61: type1 = 38;
	ld	b, #0x26
;src/scripts/spawn_enemy.c:62: type2 = 51;
	ld	e, #0x33
;src/scripts/spawn_enemy.c:65: }
00106$:
;src/scripts/spawn_enemy.c:67: uint8_t rng = rand() & 128;
	push	bc
	push	de
	call	_rand
	ld	l, c
	ld	h, b
	pop	de
	pop	bc
	ld	a, l
	and	a, #0x80
;src/scripts/spawn_enemy.c:68: if (rng < type1) {
	ld	d, a
	sub	a, b
	jr	NC, 00111$
;src/scripts/spawn_enemy.c:69: enemy_id = 1;
	ld	e, #0x01
	jr	00112$
00111$:
;src/scripts/spawn_enemy.c:71: else if (rng < type2 + type1) {
	ld	l, b
	add	hl, de
	ld	a, d
	sub	a, l
	jr	NC, 00108$
;src/scripts/spawn_enemy.c:72: enemy_id = 2;
	ld	e, #0x02
	jr	00112$
00108$:
;src/scripts/spawn_enemy.c:75: enemy_id = 3;
	ld	e, #0x03
00112$:
;src/scripts/spawn_enemy.c:78: if (room_enemies[i][j] == 0) {
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_room_enemies)
	ld	c, a
	ld	a, h
	adc	a, #>(_room_enemies)
	ld	b, a
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00116$
;src/scripts/spawn_enemy.c:79: room_enemies[i][j] = enemy_id;
	ld	(hl), e
;src/scripts/spawn_enemy.c:80: return 1;
	ld	a, #0x01
	jr	00118$
00116$:
;src/scripts/spawn_enemy.c:82: else if (room_enemies[i][j] < 16) {
	ld	a, c
	sub	a, #0x10
	jr	NC, 00117$
;src/scripts/spawn_enemy.c:83: room_enemies[i][j] |= (enemy_id << 4);
	ld	a, e
	swap	a
	and	a, #0xf0
	or	a, c
	ld	(hl), a
;src/scripts/spawn_enemy.c:84: return 1;
	ld	a, #0x01
	jr	00118$
00117$:
;src/scripts/spawn_enemy.c:86: return 0;
	xor	a, a
00118$:
;src/scripts/spawn_enemy.c:87: }
	pop	hl
	inc	sp
	jp	(hl)
;src/scripts/spawn_enemy.c:89: void generate_enemies(uint8_t num_enemies, char dungeon[4][4], uint8_t floor) BANKED {
;	---------------------------------
; Function generate_enemies
; ---------------------------------
	b_generate_enemies	= 3
_generate_enemies::
	add	sp, #-3
;src/scripts/spawn_enemy.c:90: for (int i=0; i<4; i++) {
	ld	bc, #0x0000
00119$:
;src/scripts/spawn_enemy.c:91: for (int j=0; j<4; j++) {
	ld	a,c
	cp	a,#0x04
	jr	NC, 00112$
	ld	d, b
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ld	hl, #_room_enemies
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#2
	ld	(hl), #0x00
00116$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00120$
;src/scripts/spawn_enemy.c:92: room_enemies[i][j] = 0;
	pop	de
	push	de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;src/scripts/spawn_enemy.c:91: for (int j=0; j<4; j++) {
	ldhl	sp,	#2
	inc	(hl)
	jr	00116$
00120$:
;src/scripts/spawn_enemy.c:90: for (int i=0; i<4; i++) {
	inc	bc
	jr	00119$
;src/scripts/spawn_enemy.c:96: while (num_enemies > 0){
00112$:
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;src/scripts/spawn_enemy.c:97: for (int i=0; i<4; i++) {
	xor	a, a
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), a
00125$:
	ldhl	sp,	#1
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00112$
;src/scripts/spawn_enemy.c:98: for (int j=0; j<4; j++) {
	dec	hl
	ld	a, (hl)
	ld	d, #0x00
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	e, (hl)
	ld	d, #0x00
00122$:
	ld	a, d
	sub	a, #0x04
	jr	NC, 00126$
;src/scripts/spawn_enemy.c:99: if (dungeon[i][j] == 'A' || dungeon[i][j] == 'B') {
	ld	l, d
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	cp	a, #0x41
	jr	Z, 00107$
	sub	a, #0x42
	jr	NZ, 00123$
00107$:
;src/scripts/spawn_enemy.c:100: if (add_enemy(floor, i, j)) {
	ld	a, d
	ldhl	sp,	#1
	ld	l, (hl)
	push	bc
	push	de
	push	af
	ld	e, l
	inc	sp
	ldhl	sp,	#17
	ld	a, (hl)
	call	_add_enemy
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00123$
;src/scripts/spawn_enemy.c:101: num_enemies--;
	dec	e
	ldhl	sp,	#9
;src/scripts/spawn_enemy.c:102: if (num_enemies == 0) {
	ld	a,e
	ld	(hl),a
	or	a, a
;src/scripts/spawn_enemy.c:103: return;
	jr	Z, 00127$
00123$:
;src/scripts/spawn_enemy.c:98: for (int j=0; j<4; j++) {
	inc	d
	jr	00122$
00126$:
;src/scripts/spawn_enemy.c:97: for (int i=0; i<4; i++) {
	ldhl	sp,	#1
	inc	(hl)
	jr	00125$
00114$:
;src/scripts/spawn_enemy.c:110: return;
00127$:
;src/scripts/spawn_enemy.c:111: }
	add	sp, #3
	ret
;src/scripts/spawn_enemy.c:113: void spawn_enemies_in_room(uint8_t i, uint8_t j, Enemy enemies[2]) BANKED {
;	---------------------------------
; Function spawn_enemies_in_room
; ---------------------------------
	b_spawn_enemies_in_room	= 3
_spawn_enemies_in_room::
	dec	sp
	dec	sp
;src/scripts/spawn_enemy.c:114: enemy_death(&enemies[0]);
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	call	_enemy_death
;src/scripts/spawn_enemy.c:115: enemy_death(&enemies[1]);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	push	de
	call	_enemy_death
	pop	de
;src/scripts/spawn_enemy.c:116: uint8_t room_data = room_enemies[i][j];
	ldhl	sp,	#8
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, #<(_room_enemies)
	add	a, l
	ld	c, a
	ld	a, #>(_room_enemies)
	adc	a, h
	ld	b, a
	ldhl	sp,	#9
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, (hl)
;src/scripts/spawn_enemy.c:118: if (room_data == 0) {
	ld	a, c
	or	a, a
;src/scripts/spawn_enemy.c:119: return;
	jr	Z, 00107$
;src/scripts/spawn_enemy.c:122: uint8_t id_high = room_data >> 4;
	ld	a, c
	swap	a
	and	a, #0x0f
	ld	b, a
;src/scripts/spawn_enemy.c:124: if (id_high > 0) {
	or	a, a
	jr	Z, 00104$
;src/scripts/spawn_enemy.c:125: set_enemy_stats(&enemies[1], id_high, 12);
	push	bc
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	ld	a, b
	call	_set_enemy_stats
	pop	de
;src/scripts/spawn_enemy.c:126: set_enemy_position(&enemies[1], 72, 48);
	ld	a, #0x30
	push	af
	inc	sp
	ld	a, #0x48
	call	_set_enemy_position
	pop	bc
00104$:
;src/scripts/spawn_enemy.c:129: uint8_t id_low = room_data & 0x0F;
	ld	a, c
	and	a, #0x0f
	ld	c, a
;src/scripts/spawn_enemy.c:130: if (id_low > 0) {
	or	a, a
	jr	Z, 00107$
;src/scripts/spawn_enemy.c:131: set_enemy_stats(&enemies[0], id_low, 8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	a, c
	ldhl	sp,	#1
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_enemy_stats
;src/scripts/spawn_enemy.c:132: set_enemy_position(&enemies[0], 120, 48);
	ld	a, #0x30
	push	af
	inc	sp
	ld	a, #0x78
	ldhl	sp,	#1
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_enemy_position
00107$:
;src/scripts/spawn_enemy.c:134: }
	inc	sp
	inc	sp
	ret
;src/scripts/spawn_enemy.c:137: void set_enemy_tiles() BANKED {
;	---------------------------------
; Function set_enemy_tiles
; ---------------------------------
	b_set_enemy_tiles	= 3
_set_enemy_tiles::
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x5a
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x5b
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x5c
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x5d
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x5e
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x5f
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x60
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x61
;src/scripts/spawn_enemy.c:145: set_sprite_tile(15, 97);
;src/scripts/spawn_enemy.c:146: }
	ret
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
