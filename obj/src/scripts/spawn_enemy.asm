;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module spawn_enemy
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _debug_value
	.globl _enemy_death
	.globl _set_enemy_position
	.globl _set_enemy_stats
	.globl _set_sprite_data
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
	.globl b_set_enemy_sprite
	.globl _set_enemy_sprite
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
;src/scripts/spawn_enemy.c:12: uint8_t enemy_var = arand() % 3;
	call	_arand
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
	dec	sp
	dec	sp
	ldhl	sp,	#1
	ld	(hl), e
;src/scripts/spawn_enemy.c:39: switch (floor % 5) {
	ld	l, a
	ld	h, #0x00
	ld	a, l
	push	hl
	ld	e, #0x05
	call	__moduchar
	pop	hl
	ld	a, c
	or	a, a
	ld	a, #0x01
	jr	Z, 00197$
	xor	a, a
00197$:
	ld	de, #0x0
	or	a, a
	jr	NZ, 00105$
	ld	a, c
	dec	a
	jr	Z, 00101$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00102$
	cp	a,#0x03
	jr	Z, 00103$
	sub	a, #0x04
	jr	Z, 00104$
	jr	00106$
;src/scripts/spawn_enemy.c:40: case 1:
00101$:
;src/scripts/spawn_enemy.c:41: type1 = 115;
;src/scripts/spawn_enemy.c:42: type2 = 13;
	ld	de, #0xd73
;src/scripts/spawn_enemy.c:44: break;
	jr	00106$
;src/scripts/spawn_enemy.c:45: case 2:
00102$:
;src/scripts/spawn_enemy.c:46: type1 = 102;
;src/scripts/spawn_enemy.c:47: type2 = 23;
	ld	de, #0x1766
;src/scripts/spawn_enemy.c:49: break;
	jr	00106$
;src/scripts/spawn_enemy.c:50: case 3:
00103$:
;src/scripts/spawn_enemy.c:51: type1 = 77;
;src/scripts/spawn_enemy.c:52: type2 = 38;
	ld	de, #0x264d
;src/scripts/spawn_enemy.c:54: break;
	jr	00106$
;src/scripts/spawn_enemy.c:55: case 4:
00104$:
;src/scripts/spawn_enemy.c:56: type1 = 64;
;src/scripts/spawn_enemy.c:57: type2 = 38;
	ld	de, #0x2640
;src/scripts/spawn_enemy.c:59: break;
	jr	00106$
;src/scripts/spawn_enemy.c:60: case 0:
00105$:
;src/scripts/spawn_enemy.c:61: type1 = 38;
;src/scripts/spawn_enemy.c:62: type2 = 51;
	ld	de, #0x3326
;src/scripts/spawn_enemy.c:65: }
00106$:
;src/scripts/spawn_enemy.c:67: uint8_t floor_type = (floor - 1) / 5;
	dec	hl
	push	de
	ld	bc, #0x0005
	ld	e, l
	ld	d, h
	call	__divsint
	pop	de
;src/scripts/spawn_enemy.c:69: switch (floor_type) {
	ld	a, #0x04
	sub	a, c
	ld	a, #0x00
	rla
	ld	b, #0x00
	ldhl	sp,	#0
	ld	(hl), #0x00
	ld	h, #0x00
	or	a, a
	jr	NZ, 00112$
	ld	b, a
	ld	hl, #00202$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00202$:
	.dw	00107$
	.dw	00108$
	.dw	00109$
	.dw	00110$
	.dw	00111$
;src/scripts/spawn_enemy.c:70: case 0:
00107$:
;src/scripts/spawn_enemy.c:71: id_1 = 1;
	ld	b, #0x01
;src/scripts/spawn_enemy.c:72: id_2 = 2;
	ldhl	sp,	#0
	ld	(hl), #0x02
;src/scripts/spawn_enemy.c:73: id_3 = 3;
	ld	h, #0x03
;src/scripts/spawn_enemy.c:74: break;
	jr	00112$
;src/scripts/spawn_enemy.c:75: case 1:
00108$:
;src/scripts/spawn_enemy.c:76: id_1 = 3;
	ld	b, #0x03
;src/scripts/spawn_enemy.c:77: id_2 = 4;
	ldhl	sp,	#0
	ld	(hl), #0x04
;src/scripts/spawn_enemy.c:78: id_3 = 5;
	ld	h, #0x05
;src/scripts/spawn_enemy.c:79: break;
	jr	00112$
;src/scripts/spawn_enemy.c:80: case 2:
00109$:
;src/scripts/spawn_enemy.c:81: id_1 = 5;
	ld	b, #0x05
;src/scripts/spawn_enemy.c:82: id_2 = 6;
	ldhl	sp,	#0
	ld	(hl), #0x06
;src/scripts/spawn_enemy.c:83: id_3 = 7;
	ld	h, #0x07
;src/scripts/spawn_enemy.c:84: break;
	jr	00112$
;src/scripts/spawn_enemy.c:85: case 3:
00110$:
;src/scripts/spawn_enemy.c:86: id_1 = 7;
	ld	b, #0x07
;src/scripts/spawn_enemy.c:87: id_2 = 8;
	ldhl	sp,	#0
	ld	(hl), #0x08
;src/scripts/spawn_enemy.c:88: id_3 = 9;
	ld	h, #0x09
;src/scripts/spawn_enemy.c:89: break;
	jr	00112$
;src/scripts/spawn_enemy.c:90: case 4:
00111$:
;src/scripts/spawn_enemy.c:91: id_1 = 9;
	ld	b, #0x09
;src/scripts/spawn_enemy.c:92: id_2 = 10;
	ldhl	sp,	#0
	ld	(hl), #0x0a
;src/scripts/spawn_enemy.c:93: id_3 = 11;
	ld	h, #0x0b
;src/scripts/spawn_enemy.c:95: }
00112$:
;src/scripts/spawn_enemy.c:98: uint8_t rng_enemy = (arand() ^ DIV_REG) & 127;
	push	hl
	push	bc
	push	de
	call	_arand
	pop	de
	pop	af
	ld	b, a
	pop	af
	ld	h, a
	ldh	a, (_DIV_REG + 0)
	xor	a, c
	and	a, #0x7f
;src/scripts/spawn_enemy.c:99: if (rng_enemy < type1) {
	ld	c, a
	sub	a, e
;src/scripts/spawn_enemy.c:100: enemy_id = id_1;
	jr	C, 00118$
;src/scripts/spawn_enemy.c:102: else if (rng_enemy < type2 + type1) {
	ld	a, d
	add	a, e
	ld	e, a
	ld	a, c
	sub	a, e
	jr	NC, 00114$
;src/scripts/spawn_enemy.c:103: enemy_id = id_2;
	ldhl	sp,	#0
	ld	b, (hl)
	jr	00118$
00114$:
;src/scripts/spawn_enemy.c:106: enemy_id = id_3;
	ld	b, h
00118$:
;src/scripts/spawn_enemy.c:109: if (room_enemies[i][j] == 0) {
	ld	de, #_room_enemies+0
	ldhl	sp,	#1
	ld	c, (hl)
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00122$
;src/scripts/spawn_enemy.c:110: room_enemies[i][j] = enemy_id;
	ld	(hl), b
;src/scripts/spawn_enemy.c:111: return 1;
	ld	a, #0x01
	jr	00124$
00122$:
;src/scripts/spawn_enemy.c:113: else if (room_enemies[i][j] < 16) {
	ld	a, c
	sub	a, #0x10
	jr	NC, 00123$
;src/scripts/spawn_enemy.c:114: room_enemies[i][j] |= (enemy_id << 4);
	ld	a, b
	swap	a
	and	a, #0xf0
	or	a, c
	ld	(hl), a
;src/scripts/spawn_enemy.c:115: return 1;
	ld	a, #0x01
	jr	00124$
00123$:
;src/scripts/spawn_enemy.c:117: return 0;
	xor	a, a
00124$:
;src/scripts/spawn_enemy.c:118: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;src/scripts/spawn_enemy.c:120: void generate_enemies(uint8_t num_enemies, char dungeon[4][4], uint8_t floor) BANKED {
;	---------------------------------
; Function generate_enemies
; ---------------------------------
	b_generate_enemies	= 3
_generate_enemies::
	add	sp, #-3
;src/scripts/spawn_enemy.c:121: for (int i=0; i<4; i++) {
	ld	bc, #0x0000
00119$:
;src/scripts/spawn_enemy.c:122: for (int j=0; j<4; j++) {
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
;src/scripts/spawn_enemy.c:123: room_enemies[i][j] = 0;
	pop	de
	push	de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;src/scripts/spawn_enemy.c:122: for (int j=0; j<4; j++) {
	ldhl	sp,	#2
	inc	(hl)
	jr	00116$
00120$:
;src/scripts/spawn_enemy.c:121: for (int i=0; i<4; i++) {
	inc	bc
	jr	00119$
;src/scripts/spawn_enemy.c:127: while (num_enemies > 0){
00112$:
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;src/scripts/spawn_enemy.c:128: for (int i=0; i<4; i++) {
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
;src/scripts/spawn_enemy.c:129: for (int j=0; j<4; j++) {
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
;src/scripts/spawn_enemy.c:130: if (dungeon[i][j] == 'A' || dungeon[i][j] == 'B') {
	ld	l, d
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	cp	a, #0x41
	jr	Z, 00107$
	sub	a, #0x42
	jr	NZ, 00123$
00107$:
;src/scripts/spawn_enemy.c:131: if (add_enemy(floor, i, j)) {
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
;src/scripts/spawn_enemy.c:132: num_enemies--;
	dec	e
	ldhl	sp,	#9
;src/scripts/spawn_enemy.c:133: if (num_enemies == 0) {
	ld	a,e
	ld	(hl),a
	or	a, a
;src/scripts/spawn_enemy.c:134: return;
	jr	Z, 00127$
00123$:
;src/scripts/spawn_enemy.c:129: for (int j=0; j<4; j++) {
	inc	d
	jr	00122$
00126$:
;src/scripts/spawn_enemy.c:128: for (int i=0; i<4; i++) {
	ldhl	sp,	#1
	inc	(hl)
	jr	00125$
00114$:
;src/scripts/spawn_enemy.c:141: return;
00127$:
;src/scripts/spawn_enemy.c:142: }
	add	sp, #3
	ret
;src/scripts/spawn_enemy.c:144: void spawn_enemies_in_room(uint8_t i, uint8_t j, Enemy enemies[2]) BANKED {
;	---------------------------------
; Function spawn_enemies_in_room
; ---------------------------------
	b_spawn_enemies_in_room	= 3
_spawn_enemies_in_room::
	dec	sp
	dec	sp
;src/scripts/spawn_enemy.c:145: enemy_death(&enemies[0]);
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
;src/scripts/spawn_enemy.c:146: enemy_death(&enemies[1]);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	e, l
	ld	d, h
	push	de
	call	_enemy_death
	pop	de
;src/scripts/spawn_enemy.c:147: uint8_t room_data = room_enemies[i][j];
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
;src/scripts/spawn_enemy.c:149: if (room_data == 0) {
	ld	a, c
	or	a, a
;src/scripts/spawn_enemy.c:150: return;
	jr	Z, 00107$
;src/scripts/spawn_enemy.c:153: uint8_t id_high = room_data >> 4;
	ld	a, c
	swap	a
	and	a, #0x0f
	ld	b, a
;src/scripts/spawn_enemy.c:155: if (id_high > 0) {
	or	a, a
	jr	Z, 00104$
;src/scripts/spawn_enemy.c:156: set_enemy_stats(&enemies[1], id_high, 12);
	push	bc
	push	de
	ld	a, #0x0c
	push	af
	inc	sp
	ld	a, b
	call	_set_enemy_stats
	pop	de
;src/scripts/spawn_enemy.c:157: set_enemy_position(&enemies[1], 72, 48);
	ld	a, #0x30
	push	af
	inc	sp
	ld	a, #0x48
	call	_set_enemy_position
	pop	bc
00104$:
;src/scripts/spawn_enemy.c:160: uint8_t id_low = room_data & 0x0F;
	ld	a, c
	and	a, #0x0f
	ld	c, a
;src/scripts/spawn_enemy.c:162: debug_value(id_low);
	push	bc
	ld	a, c
	call	_debug_value
	pop	bc
;src/scripts/spawn_enemy.c:164: if (id_low > 0) {
	ld	a, c
	or	a, a
	jr	Z, 00107$
;src/scripts/spawn_enemy.c:165: set_enemy_stats(&enemies[0], id_low, 8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	a, c
	ldhl	sp,	#1
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_enemy_stats
;src/scripts/spawn_enemy.c:166: set_enemy_position(&enemies[0], 120, 48);
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
;src/scripts/spawn_enemy.c:168: }
	inc	sp
	inc	sp
	ret
;src/scripts/spawn_enemy.c:171: void set_enemy_tiles() BANKED {
;	---------------------------------
; Function set_enemy_tiles
; ---------------------------------
	b_set_enemy_tiles	= 3
_set_enemy_tiles::
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
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
;src/scripts/spawn_enemy.c:179: set_sprite_tile(15, 97);
;src/scripts/spawn_enemy.c:180: }
	ret
;src/scripts/spawn_enemy.c:182: void set_enemy_sprite() BANKED {
;	---------------------------------
; Function set_enemy_sprite
; ---------------------------------
	b_set_enemy_sprite	= 3
_set_enemy_sprite::
;src/scripts/spawn_enemy.c:183: switch (current_enemies[0].type) {
	ld	hl, #(_current_enemies + 6)
	ld	c, (hl)
	ld	a, #0x0b
	sub	a, c
	jp	C, 00112$
	ld	b, #0x00
	ld	hl, #00141$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00141$:
	.dw	00112$
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
;src/scripts/spawn_enemy.c:184: case 1:
00101$:
;src/scripts/spawn_enemy.c:185: set_sprite_data(90, 4, LarvaOscura);
	ld	de, #_LarvaOscura
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:186: break;
	jp	00112$
;src/scripts/spawn_enemy.c:187: case 2:
00102$:
;src/scripts/spawn_enemy.c:188: set_sprite_data(90, 4, Trisguardo);
	ld	de, #_Trisguardo
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:189: break;
	jp	00112$
;src/scripts/spawn_enemy.c:190: case 3:
00103$:
;src/scripts/spawn_enemy.c:191: set_sprite_data(90, 4, Cervellino);
	ld	de, #_Cervellino
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:192: break;
	jr	00112$
;src/scripts/spawn_enemy.c:193: case 4:
00104$:
;src/scripts/spawn_enemy.c:194: set_sprite_data(90, 4, Pipistrello);
	ld	de, #_Pipistrello
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:195: break;
	jr	00112$
;src/scripts/spawn_enemy.c:196: case 5:
00105$:
;src/scripts/spawn_enemy.c:197: set_sprite_data(90, 4, Ragnocchio);
	ld	de, #_Ragnocchio
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:198: break;
	jr	00112$
;src/scripts/spawn_enemy.c:199: case 6:
00106$:
;src/scripts/spawn_enemy.c:200: set_sprite_data(90, 4, Quadratocchio);
	ld	de, #_Quadratocchio
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:201: break;
	jr	00112$
;src/scripts/spawn_enemy.c:202: case 7:
00107$:
;src/scripts/spawn_enemy.c:203: set_sprite_data(90, 4, Cristallocchio);
	ld	de, #_Cristallocchio
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:204: break;
	jr	00112$
;src/scripts/spawn_enemy.c:205: case 8:
00108$:
;src/scripts/spawn_enemy.c:206: set_sprite_data(90, 4, OcchioInfuocato);
	ld	de, #_OcchioInfuocato
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:207: break;
	jr	00112$
;src/scripts/spawn_enemy.c:208: case 9:
00109$:
;src/scripts/spawn_enemy.c:209: set_sprite_data(90, 4, Armatura);
	ld	de, #_Armatura
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:210: break;
	jr	00112$
;src/scripts/spawn_enemy.c:211: case 10:
00110$:
;src/scripts/spawn_enemy.c:212: set_sprite_data(90, 4, PredatoreOmbra);
	ld	de, #_PredatoreOmbra
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:213: break;
	jr	00112$
;src/scripts/spawn_enemy.c:214: case 11:
00111$:
;src/scripts/spawn_enemy.c:215: set_sprite_data(90, 4, Dragocchio);
	ld	de, #_Dragocchio
	push	de
	ld	hl, #0x45a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:217: }
00112$:
;src/scripts/spawn_enemy.c:218: switch (current_enemies[1].type) {
	ld	hl, #(_current_enemies + 18)
	ld	c, (hl)
	ld	a, #0x0b
	sub	a, c
	jp	C, 00124$
	ld	b, #0x00
	ld	hl, #00142$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00142$:
	.dw	00124$
	.dw	00113$
	.dw	00114$
	.dw	00115$
	.dw	00116$
	.dw	00117$
	.dw	00118$
	.dw	00119$
	.dw	00120$
	.dw	00121$
	.dw	00122$
	.dw	00123$
;src/scripts/spawn_enemy.c:219: case 1:
00113$:
;src/scripts/spawn_enemy.c:220: set_sprite_data(94, 4, LarvaOscura);
	ld	de, #_LarvaOscura
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:221: break;
	jp	00124$
;src/scripts/spawn_enemy.c:222: case 2:
00114$:
;src/scripts/spawn_enemy.c:223: set_sprite_data(94, 4, Trisguardo);
	ld	de, #_Trisguardo
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:224: break;
	jp	00124$
;src/scripts/spawn_enemy.c:225: case 3:
00115$:
;src/scripts/spawn_enemy.c:226: set_sprite_data(94, 4, Cervellino);
	ld	de, #_Cervellino
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:227: break;
	jr	00124$
;src/scripts/spawn_enemy.c:228: case 4:
00116$:
;src/scripts/spawn_enemy.c:229: set_sprite_data(94, 4, Pipistrello);
	ld	de, #_Pipistrello
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:230: break;
	jr	00124$
;src/scripts/spawn_enemy.c:231: case 5:
00117$:
;src/scripts/spawn_enemy.c:232: set_sprite_data(94, 4, Ragnocchio);
	ld	de, #_Ragnocchio
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:233: break;
	jr	00124$
;src/scripts/spawn_enemy.c:234: case 6:
00118$:
;src/scripts/spawn_enemy.c:235: set_sprite_data(94, 4, Quadratocchio);
	ld	de, #_Quadratocchio
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:236: break;
	jr	00124$
;src/scripts/spawn_enemy.c:237: case 7:
00119$:
;src/scripts/spawn_enemy.c:238: set_sprite_data(94, 4, Cristallocchio);
	ld	de, #_Cristallocchio
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:239: break;
	jr	00124$
;src/scripts/spawn_enemy.c:240: case 8:
00120$:
;src/scripts/spawn_enemy.c:241: set_sprite_data(94, 4, OcchioInfuocato);
	ld	de, #_OcchioInfuocato
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:242: break;
	jr	00124$
;src/scripts/spawn_enemy.c:243: case 9:
00121$:
;src/scripts/spawn_enemy.c:244: set_sprite_data(94, 4, Armatura);
	ld	de, #_Armatura
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:245: break;
	jr	00124$
;src/scripts/spawn_enemy.c:246: case 10:
00122$:
;src/scripts/spawn_enemy.c:247: set_sprite_data(94, 4, PredatoreOmbra);
	ld	de, #_PredatoreOmbra
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:248: break;
	jr	00124$
;src/scripts/spawn_enemy.c:249: case 11:
00123$:
;src/scripts/spawn_enemy.c:250: set_sprite_data(94, 4, Dragocchio);
	ld	de, #_Dragocchio
	push	de
	ld	hl, #0x45e
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/scripts/spawn_enemy.c:252: }
00124$:
;src/scripts/spawn_enemy.c:253: set_enemy_tiles();
	ld	e, #b_set_enemy_tiles
	ld	hl, #_set_enemy_tiles
;src/scripts/spawn_enemy.c:254: return;
;src/scripts/spawn_enemy.c:255: }
	jp  ___sdcc_bcall_ehl
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
