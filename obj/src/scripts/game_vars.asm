;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module game_vars
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _level_curve
	.globl _cure_upgrade_costs
	.globl _upgrade_costs
	.globl _walk_step
	.globl _ng
	.globl _current_song_bank
	.globl _returning_to_camp
	.globl _boss_floor_defeated
	.globl _boss_battle
	.globl _lock_opened
	.globl _treasure_obtained
	.globl _key_obtained
	.globl _map_option
	.globl _safy_option
	.globl _hector_option
	.globl _current_floor
	.globl _current_location
	.globl _menu_opened
	.globl _current_joypad
	.globl _last_joypad
	.globl _power_ups
	.globl _max_floor
	.globl _enemies_defeated
	.globl _hours
	.globl _minutes
	.globl _seconds
	.globl _frames
	.globl _tile_id
	.globl _debug
	.globl _boss
	.globl _enemy
	.globl _current_enemies
	.globl _map
	.globl _seed
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_seed::
	.ds 2
_map::
	.ds 16
_current_enemies::
	.ds 24
_enemy::
	.ds 12
_boss::
	.ds 10
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_debug::
	.ds 1
_tile_id::
	.ds 2
_frames::
	.ds 1
_seconds::
	.ds 1
_minutes::
	.ds 1
_hours::
	.ds 1
_enemies_defeated::
	.ds 1
_max_floor::
	.ds 1
_power_ups::
	.ds 1
_last_joypad::
	.ds 1
_current_joypad::
	.ds 1
_menu_opened::
	.ds 1
_current_location::
	.ds 1
_current_floor::
	.ds 1
_hector_option::
	.ds 1
_safy_option::
	.ds 1
_map_option::
	.ds 1
_key_obtained::
	.ds 1
_treasure_obtained::
	.ds 1
_lock_opened::
	.ds 1
_boss_battle::
	.ds 1
_boss_floor_defeated::
	.ds 1
_returning_to_camp::
	.ds 1
_current_song_bank::
	.ds 1
_ng::
	.ds 1
_walk_step::
	.ds 1
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
	.area _CODE
_upgrade_costs:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x12	; 18
	.db #0x18	; 24
	.db #0x1e	; 30
_cure_upgrade_costs:
	.dw #0x000a
	.dw #0x003c
	.dw #0x0096
	.dw #0x015e
	.dw #0x02bc
	.dw #0x04b0
	.dw #0x0708
	.dw #0x08fc
	.dw #0x0af0
_level_curve:
	.dw #0x000a
	.dw #0x0019
	.dw #0x002d
	.dw #0x0046
	.dw #0x0064
	.dw #0x0087
	.dw #0x00af
	.dw #0x00dc
	.dw #0x010e
	.dw #0x0145
	.dw #0x0181
	.dw #0x01c2
	.dw #0x0208
	.dw #0x0253
	.dw #0x02a3
	.dw #0x02f8
	.dw #0x0352
	.dw #0x03b1
	.dw #0x0415
	.dw #0x047e
	.dw #0x04ba
	.dw #0x04f6
	.dw #0x0532
	.dw #0x056e
	.dw #0x05aa
	.dw #0x05e6
	.dw #0x0622
	.dw #0x065e
	.dw #0x069a
	.dw #0x06d6
	.dw #0x0712
	.dw #0x074e
	.dw #0x078a
	.dw #0x07c6
	.dw #0x0802
	.dw #0x083e
	.dw #0x087a
	.dw #0x08b6
	.dw #0x08f2
	.dw #0x092e
	.dw #0x096a
	.dw #0x09a6
	.dw #0x09e2
	.dw #0x0a1e
	.dw #0x0a5a
	.dw #0x0a96
	.dw #0x0ab4
	.dw #0x0ad2
	.dw #0x0ae6
	.dw #0x0af0
	.area _INITIALIZER
__xinit__debug:
	.db #0x00	; 0
__xinit__tile_id:
	.dw #0x0000
__xinit__frames:
	.db #0x00	; 0
__xinit__seconds:
	.db #0x00	; 0
__xinit__minutes:
	.db #0x00	; 0
__xinit__hours:
	.db #0x00	; 0
__xinit__enemies_defeated:
	.db #0x00	; 0
__xinit__max_floor:
	.db #0x00	; 0
__xinit__power_ups:
	.db #0x00	; 0
__xinit__last_joypad:
	.db #0x00	; 0
__xinit__current_joypad:
	.db #0x00	; 0
__xinit__menu_opened:
	.db #0x00	; 0
__xinit__current_location:
	.db #0x00	; 0
__xinit__current_floor:
	.db #0x01	; 1
__xinit__hector_option:
	.db #0x01	; 1
__xinit__safy_option:
	.db #0x01	; 1
__xinit__map_option:
	.db #0x00	; 0
__xinit__key_obtained:
	.db #0x00	; 0
__xinit__treasure_obtained:
	.db #0x00	; 0
__xinit__lock_opened:
	.db #0x00	; 0
__xinit__boss_battle:
	.db #0x00	; 0
__xinit__boss_floor_defeated:
	.db #0x00	; 0
__xinit__returning_to_camp:
	.db #0x00	; 0
__xinit__current_song_bank:
	.db #0x03	; 3
__xinit__ng:
	.db #0x00	; 0
__xinit__walk_step:
	.db #0x00	; 0
	.area _CABS (ABS)
