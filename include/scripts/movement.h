#include <gb/gb.h>
#include "boss.h"
#include "player_vars.h"
#include "game_vars.h"
#include "songs.h"
#include "game_vars.h"
#include "player_utils.h"
#include "play_effects.h"
#include "combat.h"

void smooth_movement(uint8_t dir);
void check_input_movement();
void move_character();
uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);

// extern vars/functions



extern char dungeon[4][4];

extern const unsigned char Camp[];
extern const unsigned char camp_collisions[];
extern unsigned char current_room[360];
extern void check_drops(uint8_t x, uint8_t y);
extern void save_game() BANKED;
