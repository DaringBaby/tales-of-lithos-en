#include "scripts/player_vars.h"

/* PLAYER STATS */
uint8_t x = 120;
uint8_t y = 112;
uint8_t last_direction = 1;

Coords player_coords;

uint8_t player_name[] = {164, 164, 164, 164, 164};
uint8_t max_hp = 23;
uint8_t current_hp = 23;
uint8_t attack = 5;
uint8_t defense = 3;
uint8_t level = 1;
uint16_t experience = 0;
uint8_t sword_lvl = 1;
uint8_t shield_lvl = 1;
uint8_t arrow_lvl = 1;
uint8_t quiver_lvl = 1;
uint8_t potion_quant_lvl = 1;
uint8_t potion_heal_lvl = 1;

/* NUMBER OF ITEMS */
uint8_t max_heals = 5;
uint8_t heals = 5;
uint8_t heal_quantity = 10;
uint8_t arrow_damage = 3;
uint8_t num_arrows = 10;
uint8_t max_num_arrows = 10;
uint8_t minerals = 0;

uint8_t obt_mythril = 0;
uint8_t obt_exp = 0;
