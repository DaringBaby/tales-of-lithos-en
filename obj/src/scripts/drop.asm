;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module drop
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_heal_sfx
	.globl _heal_sfx
	.globl _drops
	.globl _spawn_drop
	.globl _clear_drops
	.globl _check_drops
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_drops::
	.ds 6
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
	.area _CODE
;src/scripts/drop.c:6: void spawn_drop(uint8_t x, uint8_t y) {
;	---------------------------------
; Function spawn_drop
; ---------------------------------
_spawn_drop::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl-), a
;src/scripts/drop.c:8: uint8_t drop_chance = DIV_REG & 3;
	ld	a, e
	ld	(hl-), a
	ldh	a, (_DIV_REG + 0)
	and	a, #0x03
	ld	(hl), a
;src/scripts/drop.c:9: if (drops[0].drop_type == 0) {
	ld	a, (#_drops + 0)
;src/scripts/drop.c:10: drop_idx = 0;
	or	a, a
	jr	NZ, 00102$
	ld	c, a
	jr	00103$
00102$:
;src/scripts/drop.c:13: drop_idx = 1;
	ld	c, #0x01
00103$:
;src/scripts/drop.c:16: drops[drop_idx].drop_type = 1;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
;src/scripts/drop.c:17: set_sprite_tile(33+drop_idx, 82);
	ld	b, c
;src/scripts/drop.c:16: drops[drop_idx].drop_type = 1;
	ld	a, #<(_drops)
	add	a, l
	ld	e, a
	ld	a, #>(_drops)
	adc	a, h
	ld	d, a
;src/scripts/drop.c:17: set_sprite_tile(33+drop_idx, 82);
	ld	a, b
	add	a, #0x21
	ld	b, a
;src/scripts/drop.c:15: if (drop_chance == 3) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00108$
;src/scripts/drop.c:16: drops[drop_idx].drop_type = 1;
	ld	a, #0x01
	ld	(de), a
;src/scripts/drop.c:17: set_sprite_tile(33+drop_idx, 82);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x52
;src/scripts/drop.c:18: move_sprite(33+drop_idx, x, y);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/scripts/drop.c:18: move_sprite(33+drop_idx, x, y);
	jr	00109$
00108$:
;src/scripts/drop.c:20: else if (drop_chance == 2) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00105$
;src/scripts/drop.c:21: drops[drop_idx].drop_type = 2;
	ld	a, #0x02
	ld	(de), a
;src/scripts/drop.c:22: set_sprite_tile(33+drop_idx, 83);
	ld	e, b
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x53
;src/scripts/drop.c:23: move_sprite(33+drop_idx, x, y);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/scripts/drop.c:23: move_sprite(33+drop_idx, x, y);
	jr	00109$
00105$:
;src/scripts/drop.c:26: drops[drop_idx].drop_type = 0;
	xor	a, a
	ld	(de), a
;src/scripts/drop.c:27: set_sprite_tile(33+drop_idx, 50);
	ld	e, b
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x32
;src/scripts/drop.c:28: move_sprite(33+drop_idx, 0, 0);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/drop.c:28: move_sprite(33+drop_idx, 0, 0);
00109$:
;src/scripts/drop.c:30: drops[drop_idx].x = x;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_drops)
	ld	c, a
	ld	a, h
	adc	a, #>(_drops)
	ld	b, a
	ld	e, c
	ld	d, b
	inc	de
	ldhl	sp,	#2
;src/scripts/drop.c:31: drops[drop_idx].y = y;
	ld	a, (hl-)
	ld	(de), a
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/scripts/drop.c:32: }
	add	sp, #3
	ret
;src/scripts/drop.c:34: void clear_drops() {
;	---------------------------------
; Function clear_drops
; ---------------------------------
_clear_drops::
;src/scripts/drop.c:35: for (int i=0; i<2; i++) {
	ld	bc, #0x0000
00105$:
	ld	a, c
	sub	a, #0x02
	ret	NC
;src/scripts/drop.c:36: drops[i].drop_type = 0;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ld	de, #_drops
	add	hl, de
	ld	(hl), #0x00
;src/scripts/drop.c:37: drops[i].x = 0;
	ld	e, l
	ld	d, h
;src/scripts/drop.c:38: drops[i].y = 0;
	inc	hl
	inc	hl
	inc	de
	xor	a, a
	ld	(de), a
	ld	(hl), #0x00
;src/scripts/drop.c:39: set_sprite_tile(33+i, 50);
	ld	a, c
	add	a, #0x21
	ld	e, a
	ld	d, e
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x32
;src/scripts/drop.c:40: move_sprite(33+i, 0, 0);
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/drop.c:35: for (int i=0; i<2; i++) {
	inc	bc
;src/scripts/drop.c:42: }
	jr	00105$
;src/scripts/drop.c:44: void check_drops(uint8_t x, uint8_t y) {
;	---------------------------------
; Function check_drops
; ---------------------------------
_check_drops::
	add	sp, #-8
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
;src/scripts/drop.c:45: for (int i=0; i<2; i++) {
	ld	bc, #0x0000
00116$:
	ld	a, c
	sub	a, #0x02
	jp	NC, 00118$
;src/scripts/drop.c:46: if (x==drops[i].x && y==drops[i].y) {
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_drops
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#7
	sub	a, (hl)
	jp	NZ, 00117$
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	NZ, 00117$
;src/scripts/drop.c:47: if (drops[i].drop_type == 2) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x02
	jr	NZ, 00108$
;src/scripts/drop.c:48: if (num_arrows < max_num_arrows) {
	ld	a, (#_num_arrows)
	ld	hl, #_max_num_arrows
	sub	a, (hl)
	jr	NC, 00109$
;src/scripts/drop.c:49: num_arrows++;
	ld	hl, #_num_arrows
	inc	(hl)
;src/scripts/drop.c:50: heal_sfx();
	push	bc
	ld	e, #b_heal_sfx
	ld	hl, #_heal_sfx
	call	___sdcc_bcall_ehl
	pop	bc
	jr	00109$
00108$:
;src/scripts/drop.c:53: else if (drops[i].drop_type == 1) {
	dec	a
	jr	NZ, 00109$
;src/scripts/drop.c:54: current_hp += 5;
	ld	a, (_current_hp)
	add	a, #0x05
	ld	(#_current_hp),a
;src/scripts/drop.c:55: if (current_hp > max_hp) {
	ld	a, (#_max_hp)
	ld	hl, #_current_hp
	sub	a, (hl)
	jr	NC, 00109$
;src/scripts/drop.c:56: current_hp = max_hp;
	ld	a, (#_max_hp)
	ld	(#_current_hp),a
;src/scripts/drop.c:57: heal_sfx();
	push	bc
	ld	e, #b_heal_sfx
	ld	hl, #_heal_sfx
	call	___sdcc_bcall_ehl
	pop	bc
00109$:
;src/scripts/drop.c:60: drops[i].x = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
;src/scripts/drop.c:61: drops[i].y = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/scripts/drop.c:62: drops[i].drop_type = 0;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/scripts/drop.c:63: move_sprite(33+i, 0, 0);
	ld	a, c
	add	a, #0x21
	ld	e, a
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\users\utente\desktop\tirocinio\gbdk-win64\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/drop.c:63: move_sprite(33+i, 0, 0);
00117$:
;src/scripts/drop.c:45: for (int i=0; i<2; i++) {
	inc	bc
	jp	00116$
00118$:
;src/scripts/drop.c:66: }
	add	sp, #8
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
