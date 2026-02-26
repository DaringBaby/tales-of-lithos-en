#pragma bank 3

#include "combat_system.h"
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
    return 0;
}