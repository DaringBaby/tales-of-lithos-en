#include "enemy.h"

extern uint8_t room_enemies[4][4];
uint8_t get_num_enemies(uint8_t floor) BANKED;
void add_enemy(uint8_t floor, uint8_t i, uint8_t j) BANKED;