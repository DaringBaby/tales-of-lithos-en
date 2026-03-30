#include "boss.h"
#include "enemy.h"

void check_map_options() BANKED;
void check_map_menu_input() BANKED;
void show_time() BANKED;
void check_menu_options(uint8_t chara) BANKED;
void safy_upgrades();
void hector_upgrades();
void set_stats() BANKED;
void set_mini_menu() BANKED;
void show_number(uint8_t damage, uint8_t mode, uint8_t target, uint8_t index) BANKED;
void print_debug(uint8_t value) BANKED;


extern void check_time() BANKED;
extern uint8_t debug;

/* SHOW NUMBERS */
extern uint8_t x;
extern uint8_t y;
extern Boss boss;
extern Enemy current_enemies[2];
/* MINI GUI*/
extern const unsigned char mini_gui[];
extern uint8_t num_arrows;
extern uint8_t current_floor;
extern uint8_t key_obtained;
 /* STAT MENU */
extern const uint8_t menu_body[];
extern uint8_t map_option;
extern const uint8_t arrow_tile;
extern uint8_t menu_opened;
extern uint8_t power_ups;
extern uint8_t enemies_defeated;
extern uint8_t max_floor;
extern uint8_t frames;
extern uint8_t seconds;
extern uint8_t minutes;
extern uint8_t hours ;
extern uint8_t x;
extern uint8_t y;
/* HECTOR/SAFY MENU */
extern uint8_t hector_option;
extern uint8_t safy_option;
extern uint8_t sword_lvl;
extern uint8_t shield_lvl;
extern uint8_t arrow_lvl;
extern uint8_t arrow_damage;
extern uint8_t quiver_lvl;
extern uint8_t max_num_arrows;
extern uint8_t potion_quant_lvl;
extern uint8_t potion_heal_lvl;
extern uint8_t heals;
extern uint8_t max_heals;
extern uint8_t heal_quantity;
extern uint8_t level;
extern const uint16_t level_curve[];
extern const uint8_t upgrade_costs[];
extern const uint16_t cure_upgrade_costs[];
extern uint8_t player_name[];
extern uint16_t experience;
extern uint8_t minerals;
extern uint8_t attack;
extern uint8_t defense;
extern uint8_t max_hp;
extern uint8_t current_hp;

extern uint8_t returning_to_camp;
