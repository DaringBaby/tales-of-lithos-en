#include <gb/gb.h>

void play_animation(uint8_t dir) BANKED;
void play_heal_animation() BANKED;
void play_hit_animation() BANKED;
void play_explosion_animation(uint8_t en_x, uint8_t en_y) BANKED;

extern uint8_t x;
extern uint8_t y;