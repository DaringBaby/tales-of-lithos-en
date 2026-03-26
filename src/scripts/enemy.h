#ifndef ENEMY_H
#define ENEMY_H

#include <gb/gb.h>
#include <stdio.h>

typedef struct {
    uint8_t x, y;
    uint16_t hp;
    uint8_t atk;
    uint8_t def;
    uint8_t type; // 0: LARVA OSCURA, 1: TRISGUARDO, 2: PREDATORE D'OMBRA
    uint8_t alive;
    uint8_t sprite_id;
    uint8_t targeting;
    uint16_t exp_reward;
} Enemy;

extern uint8_t current_hp; // hp player
extern uint8_t attack; // attacco player
extern uint8_t defense; // difesa player
extern uint8_t x; // pos. x player
extern uint8_t y; // pos. y player
extern uint8_t last_x; // x precedente player
extern uint8_t last_y; // y precedente player
extern Enemy current_enemies[2];


void set_enemy_stats(Enemy *e, uint8_t type, uint8_t sprite_id);
void move_enemy(Enemy *e);
void set_enemy_position(Enemy *e, uint8_t x, uint8_t y);
uint8_t check_distance_x(Enemy* e);
uint8_t check_distance_y(Enemy* e);
void enemy_attack(Enemy* e);
void enemy_death(Enemy* e);
void enemy_smooth_movement(Enemy* e, uint8_t dir);
uint8_t is_enemy_at(uint8_t tx, uint8_t ty, Enemy *self);

extern uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
extern void show_number(uint8_t number, uint8_t mode, uint8_t target, uint8_t index) BANKED;
extern void spawn_drop(uint8_t x, uint8_t y);
extern void play_hit_animation() BANKED;
#endif
