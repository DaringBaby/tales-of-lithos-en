#include <gb/gb.h>
#include <stdio.h>

typedef struct {
    uint8_t x, y;
    uint8_t hp;
    uint8_t atk;
    uint8_t def;
    uint8_t type; // 0: LARVA OSCURA, 1: TRISGUARDO, 2: PREDATORE D'OMBRA
    uint8_t alive;
    uint8_t sprite_id;
    uint8_t exp_reward;
} Enemy;

void set_enemy_stats(Enemy *e, uint8_t type, uint8_t sprite_id);
void move_enemy(Enemy *e);
void set_enemy_position(Enemy *e, uint8_t x, uint8_t y);
extern uint8_t check_terrain(uint8_t new_x, uint8_t new_y);