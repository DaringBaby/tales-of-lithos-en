#pragma bank 1
#include "../tiles/character.h"
#include <gb/gb.h>
#include "../tiles/sword.h"
#include "../tiles/effects.h"
#include "play_effects.h"

void play_attack_animation(uint8_t dir) BANKED {
    // sword = sprite 3
    // anim player: 114-121
    // anim sword:  122-123
    switch (dir) {
        case 1:
            set_sprite_data(114, 8, MC_attack_up);
            set_sprite_data(122, 2, SwordUp);
            move_sprite(3, x+8, y-8);
            break;
        case 2:
            set_sprite_data(114, 8, MC_attack_right);
            set_sprite_data(122, 2, SwordRight);
            move_sprite(3, x+16, y+8);
            break;
        case 4:
            set_sprite_data(114, 8, MC_attack_down);
            set_sprite_data(122, 2, SwordDown);
            move_sprite(3, x, y+16);
            break;
        case 8:
            set_sprite_data(114, 8, MC_attack_left);
            set_sprite_data(122, 2, SwordLeft);
            move_sprite(3, x-8, y+8);
            break;
    }
    set_sprite_tile(3, 122);
    set_sprite_tile(4, 114);
    set_sprite_tile(5, 115);
    set_sprite_tile(6, 116);
    set_sprite_tile(7, 117);
    delay(200);
    set_sprite_tile(3, 123);
    set_sprite_tile(4, 118);
    set_sprite_tile(5, 119);
    set_sprite_tile(6, 120);
    set_sprite_tile(7, 121);
    delay(100);
    return;
}

void play_walk_animation(uint8_t dir) BANKED {
    switch (dir) {
        case 1:
            set_sprite_data(114, 8, MC_walk_up);
            break;
        case 2:
            set_sprite_data(114, 4, MC_walk_right);
            break;
        case 4:
            set_sprite_data(114, 8, MC_walk_down);
            break;
        case 8:
            set_sprite_data(114, 4, MC_walk_left);
            break;
    }
    set_sprite_tile(4, 114);
    set_sprite_tile(5, 115);
    set_sprite_tile(6, 116);
    set_sprite_tile(7, 117);
    if (dir == 1 || dir == 4) {
        walk_step = !walk_step;
        if (walk_step) {
            set_sprite_tile(4, 118);
            set_sprite_tile(5, 119);
            set_sprite_tile(6, 120);
            set_sprite_tile(7, 121);
        }
    }
}


void play_heal_animation() BANKED {
    // heal: 124, 125
    set_sprite_data(124, 2, HealEff);
    set_sprite_tile(0, 124);
    set_sprite_tile(1, 125);
    move_sprite(0, x+8, y);
    move_sprite(1, x, y+8);
    delay(150);
    move_sprite(0, x, y+8);
    move_sprite(1, x+8, y);
    delay(150);
    move_sprite(0, x+8, y);
    move_sprite(1, x, y+8);
    delay(150);
    set_sprite_tile(0, 50);
    set_sprite_tile(1, 50);
    move_sprite(0, 0, 0);
    move_sprite(1, 0, 0);
    return;
}

void play_hit_animation() BANKED {
    // damage: 124, 125, 126
    set_sprite_data(124, 3, HitEff);
    set_sprite_tile(0, 124);
    set_sprite_tile(1, 125);
    move_sprite(0, x, y);
    move_sprite(1, x+8, y+8);
    delay(150);
    set_sprite_tile(1, 126);
    move_sprite(0, x+8, y+8);
    move_sprite(1, x, y);
    delay(150);
    set_sprite_tile(0, 125);
    move_sprite(0, x, y);
    move_sprite(1, x+8, y+8);
    delay(150);
    set_sprite_tile(0, 50);
    set_sprite_tile(1, 50);
    move_sprite(0, 0, 0);
    move_sprite(1, 0, 0);
    return;

}

void play_explosion_animation(uint8_t en_x, uint8_t en_y) BANKED {
    // anim explosion: 114-125
    set_sprite_data(114, 12, ExplosionEff);
    set_sprite_tile(0, 50);
    set_sprite_tile(1, 50);
    set_sprite_tile(2, 50);
    set_sprite_tile(3, 50);
    move_sprite(0, en_x, en_y);
    move_sprite(1, en_x+8, en_y);
    move_sprite(2, en_x, en_y+8);
    move_sprite(3, en_x+8, en_y+8);
    wait_vbl_done();
    set_sprite_tile(0, 114);
    set_sprite_tile(1, 115);
    set_sprite_tile(2, 116);
    set_sprite_tile(3, 117);
    delay(150);
    set_sprite_tile(0, 118);
    set_sprite_tile(1, 119);
    set_sprite_tile(2, 120);
    set_sprite_tile(3, 121);
    delay(150);
    set_sprite_tile(0, 122);
    set_sprite_tile(1, 123);
    set_sprite_tile(2, 124);
    set_sprite_tile(3, 125);
    delay(150);
    set_sprite_tile(0, 50);
    set_sprite_tile(1, 50);
    set_sprite_tile(2, 50);
    set_sprite_tile(3, 50);
    move_sprite(0, 0, 0);
    move_sprite(1, 0, 0);
    move_sprite(2, 0, 0);
    move_sprite(3, 0, 0);
    return;
}