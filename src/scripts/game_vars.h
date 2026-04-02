#include <gb/gb.h>
#include "enemy.h"
#include "boss.h"

extern uint8_t debug;
extern int tile_id;

extern uint8_t frames;
extern uint8_t seconds;
extern uint8_t minutes;
extern uint8_t hours;

extern uint8_t enemies_defeated;
extern uint8_t max_floor;
extern uint8_t power_ups;

extern uint8_t last_joypad;
extern uint8_t current_joypad;

extern uint8_t menu_opened;
extern uint8_t current_location;
extern uint8_t current_floor;
extern uint8_t hector_option;
extern uint8_t safy_option;
extern uint8_t map_option;

extern uint8_t key_obtained;
extern uint8_t treasure_obtained;
extern uint8_t lock_opened;
extern uint8_t boss_battle;
extern uint8_t boss_floor_defeated;
extern uint8_t returning_to_camp;
extern uint8_t current_song_bank;
extern uint8_t ng;
extern uint8_t walk_step;

extern uint16_t seed;
extern uint8_t map[4][4];

extern const uint8_t upgrade_costs[];
extern const uint16_t cure_upgrade_costs[];
extern const uint16_t level_curve[];

extern Enemy current_enemies[2];
extern Enemy enemy;
extern Boss boss;
