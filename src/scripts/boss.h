#include <gb/gb.h>
#ifndef BOSS_H
#define BOSS_H
typedef struct {
    uint8_t id;
    uint8_t x;
    uint8_t y;
    uint8_t hp;
    uint8_t atk;
    uint8_t def;
    uint8_t exp_reward;
    uint8_t defeated;
} Boss;
#endif

void spawn_boss(Boss *boss) BANKED;
void move_boss(Boss *boss) BANKED;
void boss_death(Boss *boss) BANKED;
uint8_t boss_check_distance_x(Boss* boss);
uint8_t boss_check_distance_y(Boss* boss);
void boss_attack(Boss* boss);
void boss_smooth_movement(Boss* boss, uint8_t dir);

extern uint8_t x;
extern uint8_t y;
extern uint8_t current_hp;
extern uint8_t atk;
extern uint8_t defense;

void show_number(uint8_t damage, uint8_t mode, uint8_t target, uint8_t index) BANKED;
extern void play_hit_animation() BANKED;
