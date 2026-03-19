;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module save_manager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sram_data
	.globl _load_game
	.globl _save_game
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sram_data	=	0xa000
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
;src/scripts/save_manager.c:5: uint8_t load_game() {
;	---------------------------------
; Function load_game
; ---------------------------------
_load_game::
;src/scripts/save_manager.c:6: if (ng) {
	ld	a, (#_ng)
	or	a, a
	jr	Z, 00102$
;src/scripts/save_manager.c:7: return 0;
	xor	a, a
	ret
00102$:
;src/scripts/save_manager.c:9: ENABLE_RAM;
	ld	hl, #_rRAMG
	ld	(hl), #0x0a
;src/scripts/save_manager.c:10: SWITCH_RAM(0);
	xor	a, a
	ld	(#_rRAMB),a
;src/scripts/save_manager.c:12: if (sram_data.check == 0x54F1) {
	ld	hl, #_sram_data
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xf1
	jp	NZ, 00105$
	ld	a, b
;src/scripts/save_manager.c:13: for(uint8_t i = 0; i < 5; i++) {
	sub	a, #0x54
	jp	NZ, 00105$
	ld	c, a
00107$:
	ld	a, c
	sub	a, #0x05
	jr	NC, 00103$
;src/scripts/save_manager.c:14: player_name[i] = sram_data.player_name[i];
	ld	a, #<(_player_name)
	add	a, c
	ld	e, a
	ld	a, #>(_player_name)
	adc	a, #0x00
	ld	d, a
	ld	hl, #(_sram_data + 2)
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;src/scripts/save_manager.c:13: for(uint8_t i = 0; i < 5; i++) {
	inc	c
	jr	00107$
00103$:
;src/scripts/save_manager.c:17: max_hp = sram_data.max_hp;
	ld	a, (#(_sram_data + 7) + 0)
	ld	(#_max_hp),a
;src/scripts/save_manager.c:18: current_hp = sram_data.current_hp;
	ld	a, (#(_sram_data + 8) + 0)
	ld	(#_current_hp),a
;src/scripts/save_manager.c:19: attack = sram_data.attack;
	ld	a, (#(_sram_data + 9) + 0)
	ld	(#_attack),a
;src/scripts/save_manager.c:20: defense = sram_data.defense;
	ld	a, (#(_sram_data + 10) + 0)
	ld	(#_defense),a
;src/scripts/save_manager.c:21: level = sram_data.level;
	ld	a, (#(_sram_data + 11) + 0)
	ld	(#_level),a
;src/scripts/save_manager.c:22: experience = sram_data.experience;
	ld	a, (#(_sram_data + 12) + 0)
	ld	(#_experience),a
;src/scripts/save_manager.c:25: sword_lvl = sram_data.sword_lvl;
	ld	a, (#(_sram_data + 13) + 0)
	ld	(#_sword_lvl),a
;src/scripts/save_manager.c:26: shield_lvl = sram_data.shield_lvl;
	ld	a, (#(_sram_data + 14) + 0)
	ld	(#_shield_lvl),a
;src/scripts/save_manager.c:27: arrow_lvl = sram_data.arrow_lvl;
	ld	a, (#(_sram_data + 15) + 0)
	ld	(#_arrow_lvl),a
;src/scripts/save_manager.c:28: quiver_lvl = sram_data.quiver_lvl;
	ld	a, (#(_sram_data + 16) + 0)
	ld	(#_quiver_lvl),a
;src/scripts/save_manager.c:29: potion_quant_lvl = sram_data.potion_quant_lvl;
	ld	a, (#(_sram_data + 17) + 0)
	ld	(#_potion_quant_lvl),a
;src/scripts/save_manager.c:30: potion_heal_lvl = sram_data.potion_heal_lvl;
	ld	a, (#(_sram_data + 18) + 0)
	ld	(#_potion_heal_lvl),a
;src/scripts/save_manager.c:33: max_heals = sram_data.max_heals;
	ld	a, (#(_sram_data + 19) + 0)
	ld	(#_max_heals),a
;src/scripts/save_manager.c:34: heals = sram_data.heals;
	ld	a, (#(_sram_data + 20) + 0)
	ld	(#_heals),a
;src/scripts/save_manager.c:35: heal_quantity = sram_data.heal_quantity;
	ld	a, (#(_sram_data + 21) + 0)
	ld	(#_heal_quantity),a
;src/scripts/save_manager.c:36: arrow_damage = sram_data.arrow_damage;
	ld	a, (#(_sram_data + 22) + 0)
	ld	(#_arrow_damage),a
;src/scripts/save_manager.c:37: num_arrows = sram_data.num_arrows;
	ld	a, (#(_sram_data + 23) + 0)
	ld	(#_num_arrows),a
;src/scripts/save_manager.c:38: max_num_arrows = sram_data.max_num_arrows;
	ld	a, (#(_sram_data + 24) + 0)
	ld	(#_max_num_arrows),a
;src/scripts/save_manager.c:39: minerals = sram_data.minerals;
	ld	a, (#(_sram_data + 25) + 0)
	ld	(#_minerals),a
;src/scripts/save_manager.c:42: frames = sram_data.frames;
	ld	a, (#(_sram_data + 26) + 0)
	ld	(#_frames),a
;src/scripts/save_manager.c:43: seconds = sram_data.seconds;
	ld	a, (#(_sram_data + 27) + 0)
	ld	(#_seconds),a
;src/scripts/save_manager.c:44: minutes = sram_data.minutes;
	ld	a, (#(_sram_data + 28) + 0)
	ld	(#_minutes),a
;src/scripts/save_manager.c:45: hours = sram_data.hours;
	ld	a, (#(_sram_data + 29) + 0)
	ld	(#_hours),a
;src/scripts/save_manager.c:46: enemies_defeated = sram_data.enemies_defeated;
	ld	a, (#(_sram_data + 30) + 0)
	ld	(#_enemies_defeated),a
;src/scripts/save_manager.c:47: max_floor = sram_data.max_floor;
	ld	a, (#(_sram_data + 31) + 0)
	ld	(#_max_floor),a
;src/scripts/save_manager.c:48: power_ups = sram_data.power_ups;
	ld	a, (#(_sram_data + 32) + 0)
	ld	(#_power_ups),a
;src/scripts/save_manager.c:49: DISABLE_RAM;
	xor	a, a
	ld	(#_rRAMG),a
;src/scripts/save_manager.c:50: return 1;
	ld	a, #0x01
	ret
00105$:
;src/scripts/save_manager.c:52: DISABLE_RAM;
;src/scripts/save_manager.c:53: return 0;
	xor	a, a
	ld	(#_rRAMG), a
;src/scripts/save_manager.c:54: }
	ret
;src/scripts/save_manager.c:56: void save_game() {
;	---------------------------------
; Function save_game
; ---------------------------------
_save_game::
;src/scripts/save_manager.c:57: ENABLE_RAM;
	ld	hl, #_rRAMG
	ld	(hl), #0x0a
;src/scripts/save_manager.c:58: SWITCH_RAM(0);
	xor	a, a
	ld	(#_rRAMB),a
;src/scripts/save_manager.c:60: sram_data.check = 0x54F1; 
	ld	hl, #_sram_data
	ld	a, #0xf1
	ld	(hl+), a
	ld	(hl), #0x54
;src/scripts/save_manager.c:63: for(uint8_t i = 0; i < 5; i++) {
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x05
	jr	NC, 00101$
;src/scripts/save_manager.c:64: sram_data.player_name[i] = player_name[i];
	ld	a, #<((_sram_data + 2))
	add	a, c
	ld	e, a
	ld	a, #>((_sram_data + 2))
	adc	a, #0x00
	ld	d, a
	ld	hl, #_player_name
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;src/scripts/save_manager.c:63: for(uint8_t i = 0; i < 5; i++) {
	inc	c
	jr	00103$
00101$:
;src/scripts/save_manager.c:66: sram_data.max_hp = max_hp;
	ld	de, #(_sram_data + 7)
	ld	a, (_max_hp)
	ld	(de), a
;src/scripts/save_manager.c:67: sram_data.current_hp = current_hp;
	ld	de, #(_sram_data + 8)
	ld	a, (_current_hp)
	ld	(de), a
;src/scripts/save_manager.c:68: sram_data.attack = attack;
	ld	de, #(_sram_data + 9)
	ld	a, (_attack)
	ld	(de), a
;src/scripts/save_manager.c:69: sram_data.defense = defense;
	ld	de, #(_sram_data + 10)
	ld	a, (_defense)
	ld	(de), a
;src/scripts/save_manager.c:70: sram_data.level = level;
	ld	de, #(_sram_data + 11)
	ld	a, (_level)
	ld	(de), a
;src/scripts/save_manager.c:71: sram_data.experience = experience;
	ld	de, #(_sram_data + 12)
	ld	a, (_experience)
	ld	(de), a
;src/scripts/save_manager.c:74: sram_data.sword_lvl = sword_lvl;
	ld	de, #(_sram_data + 13)
	ld	a, (_sword_lvl)
	ld	(de), a
;src/scripts/save_manager.c:75: sram_data.shield_lvl = shield_lvl;
	ld	de, #(_sram_data + 14)
	ld	a, (_shield_lvl)
	ld	(de), a
;src/scripts/save_manager.c:76: sram_data.arrow_lvl = arrow_lvl;
	ld	de, #(_sram_data + 15)
	ld	a, (_arrow_lvl)
	ld	(de), a
;src/scripts/save_manager.c:77: sram_data.quiver_lvl = quiver_lvl;
	ld	de, #(_sram_data + 16)
	ld	a, (_quiver_lvl)
	ld	(de), a
;src/scripts/save_manager.c:78: sram_data.potion_quant_lvl = potion_quant_lvl;
	ld	de, #(_sram_data + 17)
	ld	a, (_potion_quant_lvl)
	ld	(de), a
;src/scripts/save_manager.c:79: sram_data.potion_heal_lvl = potion_heal_lvl;
	ld	de, #(_sram_data + 18)
	ld	a, (_potion_heal_lvl)
	ld	(de), a
;src/scripts/save_manager.c:82: sram_data.max_heals = max_heals;
	ld	de, #(_sram_data + 19)
	ld	a, (_max_heals)
	ld	(de), a
;src/scripts/save_manager.c:83: sram_data.heals = heals;
	ld	de, #(_sram_data + 20)
	ld	a, (_heals)
	ld	(de), a
;src/scripts/save_manager.c:84: sram_data.heal_quantity = heal_quantity;
	ld	de, #(_sram_data + 21)
	ld	a, (_heal_quantity)
	ld	(de), a
;src/scripts/save_manager.c:85: sram_data.arrow_damage = arrow_damage;
	ld	de, #(_sram_data + 22)
	ld	a, (_arrow_damage)
	ld	(de), a
;src/scripts/save_manager.c:86: sram_data.num_arrows = num_arrows;
	ld	de, #(_sram_data + 23)
	ld	a, (_num_arrows)
	ld	(de), a
;src/scripts/save_manager.c:87: sram_data.max_num_arrows = max_num_arrows;
	ld	de, #(_sram_data + 24)
	ld	a, (_max_num_arrows)
	ld	(de), a
;src/scripts/save_manager.c:88: sram_data.minerals = minerals;
	ld	de, #(_sram_data + 25)
	ld	a, (_minerals)
	ld	(de), a
;src/scripts/save_manager.c:91: sram_data.frames = frames;
	ld	de, #(_sram_data + 26)
	ld	a, (_frames)
	ld	(de), a
;src/scripts/save_manager.c:92: sram_data.seconds = seconds;
	ld	de, #(_sram_data + 27)
	ld	a, (_seconds)
	ld	(de), a
;src/scripts/save_manager.c:93: sram_data.minutes = minutes;
	ld	de, #(_sram_data + 28)
	ld	a, (_minutes)
	ld	(de), a
;src/scripts/save_manager.c:94: sram_data.hours = hours;
	ld	de, #(_sram_data + 29)
	ld	a, (_hours)
	ld	(de), a
;src/scripts/save_manager.c:95: sram_data.enemies_defeated = enemies_defeated;
	ld	de, #(_sram_data + 30)
	ld	a, (_enemies_defeated)
	ld	(de), a
;src/scripts/save_manager.c:96: sram_data.max_floor = max_floor;
	ld	de, #(_sram_data + 31)
	ld	a, (_max_floor)
	ld	(de), a
;src/scripts/save_manager.c:97: sram_data.power_ups = power_ups;
	ld	de, #(_sram_data + 32)
	ld	a, (_power_ups)
	ld	(de), a
;src/scripts/save_manager.c:99: DISABLE_RAM;
	xor	a, a
	ld	(#_rRAMG),a
;src/scripts/save_manager.c:100: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
