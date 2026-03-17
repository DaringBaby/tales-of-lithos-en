#include <gb/gb.h>

void play_attack_animation(uint8_t dir) BANKED;
void play_walk_animation(uint8_t dir) BANKED;
void play_heal_animation() BANKED;
void play_hit_animation() BANKED;
void play_explosion_animation(uint8_t en_x, uint8_t en_y) BANKED;

extern uint8_t x;
extern uint8_t y;
extern uint8_t walk_step;