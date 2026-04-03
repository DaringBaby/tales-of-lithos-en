#include <gb/gb.h>
#include "player_vars.h"
#include "game_vars.h"
typedef struct {
    uint16_t check;
    /* STARK STATS */
    uint8_t player_name[5];
    uint8_t max_hp;
    uint8_t current_hp;
    uint8_t attack;
    uint8_t defense;
    uint8_t level;
    uint16_t experience;
    /* POWER UPS */
    uint8_t sword_lvl;
    uint8_t shield_lvl;
    uint8_t arrow_lvl;
    uint8_t quiver_lvl;
    uint8_t potion_quant_lvl;
    uint8_t potion_heal_lvl;
    /* NUMER OF ITEMS */
    uint8_t max_heals;
    uint8_t heals;
    uint8_t heal_quantity;
    uint8_t arrow_damage;
    uint8_t num_arrows;
    uint8_t max_num_arrows;
    uint8_t minerals;
    /* GAME STATS */
    uint8_t frames;
    uint8_t seconds;
    uint8_t minutes;
    uint8_t hours;
    uint8_t enemies_defeated;
    uint8_t max_floor;
    uint8_t power_ups;
} SaveSlot;

uint8_t load_game() BANKED;
void save_game() BANKED;


extern __at(0xA000) SaveSlot sram_data;
extern uint8_t ng;
