;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module locked_doors
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_hide_door
	.globl _hide_door
	.globl b_draw_flip_lock_h
	.globl _draw_flip_lock_h
	.globl b_draw_lock_h
	.globl _draw_lock_h
	.globl b_draw_flip_lock_v
	.globl _draw_flip_lock_v
	.globl b_draw_lock_v
	.globl _draw_lock_v
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
;src/scripts/locked_doors.c:5: void draw_lock_v(uint8_t x, uint8_t y) BANKED {
;	---------------------------------
; Function draw_lock_v
; ---------------------------------
	b_draw_lock_v	= 3
_draw_lock_v::
	dec	sp
	dec	sp
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 102)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x33
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/locked_doors.c:8: move_sprite(25, x, y);
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 106)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x37
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/locked_doors.c:12: move_sprite(26, x, y + 8);
	ld	a, b
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 104)
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 110)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/locked_doors.c:16: move_sprite(27, x + 8, y);
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#1
	ld	(hl), a
	ld	e, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 108)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 114)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x00
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+112
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 118)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x34
	ld	(hl+), a
	ld	(hl), #0x20
;src/scripts/locked_doors.c:24: move_sprite(29, x + 16, y);
	ld	a, c
	add	a, #0x10
	ldhl	sp,	#1
	ld	(hl), a
	ld	e, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 116)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 122)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x20
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+120
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 126)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x33
	ld	(hl+), a
	ld	(hl), #0x20
;src/scripts/locked_doors.c:32: move_sprite(31, x + 24, y);
	ld	a, c
	add	a, #0x18
	ld	c, a
	ld	e, c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 124)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 130)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x37
	ld	(hl+), a
	ld	(hl), #0x20
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+128
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;src/scripts/locked_doors.c:36: move_sprite(32, x + 24, y + 8);
;src/scripts/locked_doors.c:37: }
	inc	sp
	inc	sp
	ret
;src/scripts/locked_doors.c:39: void draw_flip_lock_v(uint8_t x, uint8_t y) BANKED {
;	---------------------------------
; Function draw_flip_lock_v
; ---------------------------------
	b_draw_flip_lock_v	= 3
_draw_flip_lock_v::
	dec	sp
	dec	sp
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 102)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x37
	ld	(hl+), a
	ld	(hl), #0x40
;src/scripts/locked_doors.c:42: move_sprite(25, x, y);
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 106)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x32
	ld	(hl+), a
	ld	(hl), #0x40
;src/scripts/locked_doors.c:46: move_sprite(26, x, y + 8);
	ld	a, b
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, (hl)
	ld	hl, #(_shadow_OAM + 104)
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 110)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x40
;src/scripts/locked_doors.c:50: move_sprite(27, x + 8, y);
	ldhl	sp,	#1
	ld	(hl), c
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	ld	e, c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 108)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 114)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x32
	ld	(hl+), a
	ld	(hl), #0x40
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+112
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 118)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x60
;src/scripts/locked_doors.c:58: move_sprite(29, x + 16, y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x10
	ld	c, a
	ld	e, c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 116)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 122)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x32
	ld	(hl+), a
	ld	(hl), #0x60
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+120
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 126)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x37
	ld	(hl+), a
	ld	(hl), #0x60
;src/scripts/locked_doors.c:66: move_sprite(31, x + 24, y);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x18
	ld	c, a
	ld	e, c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 124)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 130)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x32
	ld	(hl+), a
	ld	(hl), #0x60
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+128
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;src/scripts/locked_doors.c:70: move_sprite(32, x + 24, y + 8);
;src/scripts/locked_doors.c:71: }
	inc	sp
	inc	sp
	ret
;src/scripts/locked_doors.c:73: void draw_lock_h(uint8_t x, uint8_t y) BANKED {
;	---------------------------------
; Function draw_lock_h
; ---------------------------------
	b_draw_lock_h	= 3
_draw_lock_h::
	dec	sp
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 102)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x35
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/locked_doors.c:76: move_sprite(25, x, y);
	ldhl	sp,	#8
	ld	a, (hl-)
	ld	c, a
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 106)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x36
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/locked_doors.c:80: move_sprite(26, x + 8, y);
	ld	a, b
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
	ld	e, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 104)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 110)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x39
	ld	(hl+), a
	ld	(hl), #0x00
;src/scripts/locked_doors.c:84: move_sprite(27, x, y + 8);
	ld	a, c
	add	a, #0x08
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	c, a
	ld	hl, #(_shadow_OAM + 108)
	ld	(hl+), a
	ld	(hl), b
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 114)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x3a
	ld	(hl+), a
	ld	(hl), #0x00
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+112
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(de), a
	inc	de
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 116)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 120)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 124)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 128)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/locked_doors.c:93: move_sprite(32, 0, 0);
;src/scripts/locked_doors.c:94: }
	inc	sp
	ret
;src/scripts/locked_doors.c:96: void draw_flip_lock_h(uint8_t x, uint8_t y) BANKED {
;	---------------------------------
; Function draw_flip_lock_h
; ---------------------------------
	b_draw_flip_lock_h	= 3
_draw_flip_lock_h::
	dec	sp
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 102)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x35
	ld	(hl+), a
	ld	(hl), #0x20
;src/scripts/locked_doors.c:99: move_sprite(25, x + 8, y);
	ldhl	sp,	#8
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 100)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 106)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x36
	ld	(hl+), a
	ld	(hl), #0x20
;src/scripts/locked_doors.c:103: move_sprite(26, x, y);
	ldhl	sp,	#7
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 104)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 110)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x39
	ld	(hl+), a
	ld	(hl), #0x20
;src/scripts/locked_doors.c:107: move_sprite(27, x + 8, y + 8);
	ld	a, b
	add	a, #0x08
	ld	b, a
	ld	e, b
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 108)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 109)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 114)
;/opt/gbdk/include/gb/gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x3a
	ld	(hl+), a
	ld	(hl), #0x20
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 112)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 116)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 120)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 124)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 128)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/scripts/locked_doors.c:116: move_sprite(32, 0, 0);
;src/scripts/locked_doors.c:117: }
	inc	sp
	ret
;src/scripts/locked_doors.c:119: void hide_door() BANKED {
;	---------------------------------
; Function hide_door
; ---------------------------------
	b_hide_door	= 3
_hide_door::
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 102)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 106)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 110)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 114)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 118)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 122)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 126)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 130)
	ld	(hl), #0x32
;src/scripts/locked_doors.c:127: set_sprite_tile(32, 50);
;src/scripts/locked_doors.c:128: }
	ret
	.area _CODE_3
	.area _INITIALIZER
	.area _CABS (ABS)
