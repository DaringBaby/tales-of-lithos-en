#ifndef GAMEOVER_H
#define GAMEOVER_H

#include <gb/gb.h>
#include <stdint.h>
#include "enemy.h"

void game_over() BANKED;
void black_spiral();

extern Enemy enemy;
extern uint8_t obt_mythril;
extern uint8_t obt_exp;
extern uint8_t x;
extern uint8_t y;
extern uint8_t current_location;
extern uint8_t current_hp;
extern uint8_t max_hp;
extern uint8_t num_arrows;
extern uint8_t max_num_arrows;
extern uint8_t max_heals;
extern uint8_t heals;


#endif