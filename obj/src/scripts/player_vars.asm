;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module player_vars
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _obt_exp
	.globl _obt_mythril
	.globl _minerals
	.globl _max_num_arrows
	.globl _num_arrows
	.globl _arrow_damage
	.globl _heal_quantity
	.globl _heals
	.globl _max_heals
	.globl _potion_heal_lvl
	.globl _potion_quant_lvl
	.globl _quiver_lvl
	.globl _arrow_lvl
	.globl _shield_lvl
	.globl _sword_lvl
	.globl _experience
	.globl _level
	.globl _defense
	.globl _attack
	.globl _current_hp
	.globl _max_hp
	.globl _player_name
	.globl _last_direction
	.globl _y
	.globl _x
	.globl _player_coords
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player_coords::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_x::
	.ds 1
_y::
	.ds 1
_last_direction::
	.ds 1
_player_name::
	.ds 5
_max_hp::
	.ds 1
_current_hp::
	.ds 1
_attack::
	.ds 1
_defense::
	.ds 1
_level::
	.ds 1
_experience::
	.ds 2
_sword_lvl::
	.ds 1
_shield_lvl::
	.ds 1
_arrow_lvl::
	.ds 1
_quiver_lvl::
	.ds 1
_potion_quant_lvl::
	.ds 1
_potion_heal_lvl::
	.ds 1
_max_heals::
	.ds 1
_heals::
	.ds 1
_heal_quantity::
	.ds 1
_arrow_damage::
	.ds 1
_num_arrows::
	.ds 1
_max_num_arrows::
	.ds 1
_minerals::
	.ds 1
_obt_mythril::
	.ds 1
_obt_exp::
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
	.area _INITIALIZER
__xinit__x:
	.db #0x78	; 120	'x'
__xinit__y:
	.db #0x70	; 112	'p'
__xinit__last_direction:
	.db #0x01	; 1
__xinit__player_name:
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xa4	; 164
	.db #0xa4	; 164
__xinit__max_hp:
	.db #0x17	; 23
__xinit__current_hp:
	.db #0x17	; 23
__xinit__attack:
	.db #0x05	; 5
__xinit__defense:
	.db #0x03	; 3
__xinit__level:
	.db #0x01	; 1
__xinit__experience:
	.dw #0x0000
__xinit__sword_lvl:
	.db #0x01	; 1
__xinit__shield_lvl:
	.db #0x01	; 1
__xinit__arrow_lvl:
	.db #0x01	; 1
__xinit__quiver_lvl:
	.db #0x01	; 1
__xinit__potion_quant_lvl:
	.db #0x01	; 1
__xinit__potion_heal_lvl:
	.db #0x01	; 1
__xinit__max_heals:
	.db #0x05	; 5
__xinit__heals:
	.db #0x05	; 5
__xinit__heal_quantity:
	.db #0x0a	; 10
__xinit__arrow_damage:
	.db #0x03	; 3
__xinit__num_arrows:
	.db #0x0a	; 10
__xinit__max_num_arrows:
	.db #0x0a	; 10
__xinit__minerals:
	.db #0x00	; 0
__xinit__obt_mythril:
	.db #0x00	; 0
__xinit__obt_exp:
	.db #0x00	; 0
	.area _CABS (ABS)
