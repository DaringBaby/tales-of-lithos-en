#ifndef BOSS_SCRIPT_H
#define BOSS_SCRIPT_H

#include <gb/gb.h>
#include "player_vars.h"

typedef struct {
    uint8_t id;
    uint8_t x;
    uint8_t y;
    uint16_t hp;
    uint8_t atk;
    uint8_t def;
    uint16_t exp_reward;
    uint8_t defeated;
} Boss;


void spawn_boss(Boss *boss) BANKED;
void move_boss(Boss *boss) BANKED;
void boss_death(Boss *boss) BANKED;
uint8_t boss_check_distance_x(Boss* boss);
uint8_t boss_check_distance_y(Boss* boss);
void boss_attack(Boss* boss);
void boss_smooth_movement(Boss* boss, uint8_t dir);

void show_number(uint8_t damage, uint8_t mode, uint8_t target, uint8_t index) BANKED;
extern void play_hit_animation() BANKED;

extern uint8_t current_floor;

#endif
