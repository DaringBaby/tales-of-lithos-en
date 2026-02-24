#pragma bank 3
#include "gb/gb.h"
#include "enemy.h"
#include "spawn_enemy.h"

uint8_t room_enemies[4][4];

uint8_t get_num_enemies(uint8_t floor) BANKED {
    uint8_t num_enemies;
    uint8_t floor_type = floor % 5;
    uint8_t enemy_var = rand() % 3;
    switch (floor_type) {
        case 1:
            num_enemies = 6;
            break;
        case 2:
            num_enemies = 8;
            break;
        case 3:
            num_enemies = 10;
            break;
        case 4:
            num_enemies = 12;
            break;
        case 0:
            num_enemies = 13;
            break;
    }
    num_enemies += enemy_var;
    return num_enemies;
}

void add_enemy(uint8_t floor, uint8_t i, uint8_t j) {
    uint8_t enemy_id;
    uint8_t type1, type2, type3;
    switch (floor) { // per ora fino al 5
        case 1:
            type1 = 90;
            type2 = 10;
            type3 = 0;
            break;
        case 2:
            type1 = 80;
            type2 = 18;
            type3 = 2;
            break;
        case 3:
            type1 = 60;
            type2 = 20;
            type3 = 10;
            break;
        case 4:
            type1 = 50;
            type2 = 30;
            type3 = 20;
            break;
        case 5:
            type1 = 30;
            type2 = 40;
            type3 = 30;
            break;
    }

    uint8_t rng = rand() % 100;
    if (rng < type1) {
        enemy_id = 1;
    }
    else if (rng < type2 + type1) {
        enemy_id = 2;
    }
    else {
        enemy_id = 3;
    }

    if (room_enemies[i][j] == 0) {
        room_enemies[i][j] = enemy_id;
    }
    else {
        room_enemies[i][j] += enemy_id * 16;
    }
}