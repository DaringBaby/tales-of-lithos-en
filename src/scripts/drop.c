#include <gb/gb.h>
#include "drop.h"
#include "sound.h"
Drop drops[2];

void spawn_drop(uint8_t x, uint8_t y) {
    uint8_t drop_idx = 0;
    uint8_t drop_chance = rand() & 3;
    if (drops[0].drop_type == 0) {
        drop_idx = 0;
    }
    else {
        drop_idx = 1;
    }
    if (drop_chance == 3) {
        drops[drop_idx].drop_type = 1;
        set_sprite_tile(33+drop_idx, 82);
        move_sprite(33+drop_idx, x, y);
    }
    else if (drop_chance == 2) {
        drops[drop_idx].drop_type = 2;
        set_sprite_tile(33+drop_idx, 83);
        move_sprite(33+drop_idx, x, y);
    }
    else {
        drops[drop_idx].drop_type = 0;
        set_sprite_tile(33+drop_idx, 50);
        move_sprite(33+drop_idx, 0, 0);
    }
    drops[drop_idx].x = x;
    drops[drop_idx].y = y;
}

void clear_drops() {
    for (int i=0; i<2; i++) {
        drops[i].drop_type = 0;
        drops[i].x = 0;
        drops[i].y = 0;
        move_sprite(33+i, 0, 0);
    }
}

void check_drops(uint8_t x, uint8_t y) {
    for (int i=0; i<2; i++) {
        if (x==drops[i].x && y==drops[i].y) {
            if (drops[i].drop_type == 2) {
                if (num_arrows < max_num_arrows) {
                    num_arrows++;
                    heal_sfx();
                }
            }
            else if (drops[i].drop_type == 1) {
                current_hp += 5;
                if (current_hp > max_hp) {
                    current_hp = max_hp;
                    heal_sfx();
                }
            }
            drops[i].x = 0;
            drops[i].y = 0;
            drops[i].drop_type = 0;
            move_sprite(33+i, 0, 0);
        }
    }
}