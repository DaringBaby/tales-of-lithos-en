#include <gb/gb.h>
#include "boss.h"
#include "enemy.h"
#include "generate_dungeon.h"
#include "player_vars.h"
#include "game_vars.h"
#include "songs.h"

void smooth_movement(uint8_t dir);
void check_input_movement();
void move_character();
uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);

// extern vars/functions


extern Boss boss;
extern Coords player_coords;

extern char dungeon[4][4];
extern uint8_t boss_battle;
extern uint8_t boss_floor_defeated;
extern uint8_t key_obtained;
extern const unsigned char Camp[];
extern const unsigned char camp_collisions[];
extern unsigned char current_room[360];

extern void play_walk_animation(uint8_t dir) BANKED;
extern void set_character_sprite(uint8_t dir) BANKED;
extern uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
extern uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);
extern uint8_t check_enemy(uint8_t dir) BANKED;
extern void play_attack_animation(uint8_t dir) BANKED;
extern void player_attack(uint8_t wpn, uint8_t index);
extern void hide_camp_sprites();
extern void save_game();
extern void go_into_dungeon();
extern void check_drops(uint8_t x, uint8_t y);
extern void go_next_floor();
extern void enemy_death(Enemy *e);
extern void clear_drops();
extern void set_mini_menu() BANKED;
extern void set_camp_map();
extern void move_character();
extern void game_over() BANKED;
