#include "enemy.h"

void move_enemy(Enemy *e) {
    if (!e->alive) {
        return;
    }
    uint8_t next_x = e->x;
    uint8_t next_y = e->y;
    uint8_t moved = 0;
    while (!moved){
        uint8_t direction = (uint8_t)(DIV_REG & 3);
        switch (direction) {
            case 0:
                if (next_y > 32) {
                    next_y -= 16;
                }
                break;
            case 1:
                if (next_x < 144) {
                    next_x += 16;
                }
                break;
            case 2:
                if (next_y < 128) {
                    next_y += 16;
                }
                break;
            case 3:
                if (next_x > 24) {
                    next_x -= 16;
                }
                break;
        }
        if (check_terrain(next_x + 8, next_y + 8)) {
            e->x = next_x;
            e->y = next_y;
            moved = 1;
        }
    }

    move_sprite(e->sprite_id, e->x, e->y);
    move_sprite(e->sprite_id+1, e->x+8, e->y);
    move_sprite(e->sprite_id+2, e->x, e->y+8);
    move_sprite(e->sprite_id+3, e->x+8, e->y+8);
}

void set_enemy_position(Enemy *e, uint8_t x, uint8_t y) {
    e->x = x;
    e->y = y;
    move_sprite(e->sprite_id, e->x, e->y);
    move_sprite(e->sprite_id+1, e->x+8, e->y);
    move_sprite(e->sprite_id+2, e->x, e->y+8);
    move_sprite(e->sprite_id+3, e->x+8, e->y+8);
}

// 0: LARVA OSCURA, 1: TRISGUARDO, 2: PREDATORE D'OMBRA

void set_enemy_stats(Enemy *e, uint8_t type, uint8_t sprite_id) {
    switch (type) {
        case 0:
            e->hp = 10;
            e->atk = 7;
            e->def = 1;
            e->type = 0;
            e->alive = 1;
            e->sprite_id = sprite_id;
            e->exp_reward = 1;
            break;
        case 1:
            e->hp = 18;
            e->atk = 11;
            e->def = 6;
            e->type = 1;
            e->alive = 1;
            e->sprite_id = sprite_id;
            e->exp_reward = 3;
            break;
        case 2:
            e->hp = 25;
            e->atk = 15;
            e->def = 14;
            e->type = 2;
            e->alive = 1;
            e->sprite_id = sprite_id;
            e->exp_reward = 5;
            break;
    }
}