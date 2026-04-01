#include "game_vars.h"
uint8_t debug = 0;
int tile_id = 0;

/* TIME */
uint8_t frames = 0;
uint8_t seconds = 0;
uint8_t minutes = 0;
uint8_t hours = 0;

/* STATS  */
uint8_t enemies_defeated = 0;
uint8_t max_floor = 0;
uint8_t power_ups = 0;

/* JOYPAD FLAGS  */
uint8_t last_joypad = 0;
uint8_t current_joypad = 0;

/* GAME VARS*/
uint8_t menu_opened = 0; // 0: no menu, 1: main menu, 2: hector menu, 3: safy menu, 4 textbox, 5: map menu, 6: stats menu
uint8_t current_location = 0; // 0 camp, 1 dungeon
uint8_t current_floor = 1;
uint8_t hector_option = 1;
uint8_t safy_option = 1;
uint8_t map_option = 0;

/* FLAGS */
uint8_t key_obtained = 0;
uint8_t treasure_obtained = 0;
uint8_t lock_opened = 0;
uint8_t boss_battle = 0;
uint8_t boss_floor_defeated = 0;
uint8_t returning_to_camp = 0;
uint8_t current_song_bank = 3;
uint8_t ng = 0;
uint8_t walk_step = 0;


uint16_t seed;
uint8_t map[4][4];

/* COSTS */
const uint8_t upgrade_costs[] = {2, 4, 7, 10, 14, 18, 24, 30};
const uint16_t cure_upgrade_costs[] = {
    10, 60, 150, 350, 700, 1200, 1800, 2300, 2800
};
const uint16_t level_curve[] = {
    10, 25, 45, 70, 100, 135, 175, 220, 270, 325,   // 1-10
    385, 450, 520, 595, 675, 760, 850, 945, 1045, 1150, // 11-20
    1210, 1270, 1330, 1390, 1450, 1510, 1570, 1630, 1690, 1750, // 21-30
    1810, 1870, 1930, 1990, 2050, 2110, 2170, 2230, 2290, 2350, // 31-40
    2410, 2470, 2530, 2590, 2650, 2710, 2740, 2770, 2790, 2800  // 41-50
};
