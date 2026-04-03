#pragma bank 3

#include "scripts/player_utils.h"
#include <gb/gb.h>



uint8_t check_enemy(uint8_t dir) BANKED {
    for (int i=0; i<2; i++) {
        uint8_t enemy_x = current_enemies[i].x;
        uint8_t enemy_y = current_enemies[i].y;
        switch (dir) {
            case 1:
                if (x == enemy_x && y - enemy_y == 16 && y > enemy_y) {
                    return i+1;
                }
                break;
            case 2:
                if (y == enemy_y && enemy_x - x == 16 && enemy_x > x) {
                    return i+1;
                }
                break;
            case 4:
                if (x == enemy_x && enemy_y - y == 16 && enemy_y > y) {
                    return i+1;
                }
                break;
            case 8:
                if (y == enemy_y && x - enemy_x == 16 && x > enemy_x) {
                    return i+1;
                }
                break;
        }
    }
    switch(dir) {
        case 1:
            if ((x == boss.x || x == boss.x+16) && y == boss.y+32) {
                return 3;
            }
            break;
        case 2:
            if (x == boss.x - 16 && (y == boss.y || y == boss.y + 16)) {
                return 3;
            }
            break;
        case 4:
            if ((x == boss.x || x == boss.x + 16) && y == boss.y - 16) {
                return 3;
            }
            break;
        case 8:
            if (x == boss.x + 32 && (y == boss.y || y == boss.y+16)) {
                return 3;
            }
            break;
    }
    return 0;
}

void set_character_sprite(uint8_t dir) BANKED {
    switch (dir) {
        case 1:
            set_sprite_tile(4, 4);
            set_sprite_tile(5, 5);
            set_sprite_tile(6, 6);
            set_sprite_tile(7, 7);
            break;
        case 2:
            set_sprite_tile(4, 8);
            set_sprite_tile(5, 9);
            set_sprite_tile(6, 10);
            set_sprite_tile(7, 11);
            break;
        case 4:
            set_sprite_tile(4, 0);
            set_sprite_tile(5, 1);
            set_sprite_tile(6, 2);
            set_sprite_tile(7, 3);
            break;
        case 8:
            set_sprite_tile(4, 12);
            set_sprite_tile(5, 13);
            set_sprite_tile(6, 14);
            set_sprite_tile(7, 15);
            break;
    }
    if (y == 144) {
            set_sprite_tile(6, 50);
            set_sprite_tile(7, 50);
        }
    set_sprite_tile(3, 50);
}
