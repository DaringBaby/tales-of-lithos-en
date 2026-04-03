#include "enemy.h"

extern uint8_t room_enemies[4][4];
uint8_t get_num_enemies(uint8_t floor) BANKED;
uint8_t add_enemy(uint8_t floor, uint8_t i, uint8_t j);
void generate_enemies(uint8_t num_enemies, char dungeon[4][4], uint8_t floor) BANKED;
void spawn_enemies_in_room(uint8_t i, uint8_t j, Enemy enemies[2]) BANKED;
void set_enemy_tiles() BANKED;
void set_enemy_sprite() BANKED;


extern void debug_value(uint8_t debug);
extern void set_enemy1_spawnpoint(Enemy enemies[2]);
extern void set_enemy2_spawnpoint(Enemy enemies[2]);
