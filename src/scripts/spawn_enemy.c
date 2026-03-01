#pragma bank 3
#include "gb/gb.h"
#include "enemy.h"
#include "spawn_enemy.h"
#include "../tiles/Enemies.h"

uint8_t room_enemies[4][4];

uint8_t get_num_enemies(uint8_t floor) BANKED {
    uint8_t num_enemies;
    uint8_t floor_type = floor % 5;
    uint8_t enemy_var = rand() % 3;
    switch (floor_type) {
        case 1:
            num_enemies = 3;
            break;
        case 2:
            num_enemies = 6;
            break;
        case 3:
            num_enemies = 8;
            break;
        case 4:
            num_enemies = 10;
            break;
        case 0:
            num_enemies = 11;
            break;
    }
    num_enemies += enemy_var;
    return num_enemies;
}

uint8_t add_enemy(uint8_t floor, uint8_t i, uint8_t j) {
    uint8_t enemy_id;
    uint8_t type1;
    uint8_t type2;
    uint8_t type3;
    switch (floor) { // per ora fino al 5
        case 1:
            type1 = 115;
            type2 = 13;
            type3 = 0;
            break;
        case 2:
            type1 = 102;
            type2 = 23;
            type3 = 3;
            break;
        case 3:
            type1 = 77;
            type2 = 38;
            type3 = 13;
            break;
        case 4:
            type1 = 64;
            type2 = 38;
            type3 = 26;
            break;
        case 5:
            type1 = 38;
            type2 = 51;
            type3 = 39;
            break;
    }

    uint8_t rng = rand() & 128;
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
        return 1;
    }
    else if (room_enemies[i][j] < 16) {
        room_enemies[i][j] |= (enemy_id << 4);
        return 1;
    }
    return 0;
}

void generate_enemies(uint8_t num_enemies, char dungeon[4][4], uint8_t floor) BANKED {
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            room_enemies[i][j] = 0;
        }
    }

    while (num_enemies > 0){
        for (int i=0; i<4; i++) {
            for (int j=0; j<4; j++) {
                if (dungeon[i][j] == 'A' || dungeon[i][j] == 'B') {
                    if (add_enemy(floor, i, j)) {
                        num_enemies--;
                        if (num_enemies == 0) {
                            return;
                        }
                    }
                }
            }
        }
    }
    return;
}

void spawn_enemies_in_room(uint8_t i, uint8_t j, Enemy enemies[2]) BANKED {
    enemy_death(&enemies[0]);
    enemy_death(&enemies[1]);
    uint8_t room_data = room_enemies[i][j];

    if (room_data == 0) {
        return;
    }

    uint8_t id_high = room_data >> 4;

    if (id_high > 0) {
        set_enemy_stats(&enemies[1], id_high, 12);
        set_enemy_position(&enemies[1], 72, 48);
    }

    uint8_t id_low = room_data & 0x0F;
    if (id_low > 0) {
        set_enemy_stats(&enemies[0], id_low, 8);
        set_enemy_position(&enemies[0], 120, 48);
    }
}


void set_enemy_tiles() BANKED {
    set_sprite_tile(8, 90);
    set_sprite_tile(9, 91);
    set_sprite_tile(10, 92);
    set_sprite_tile(11, 93);
    set_sprite_tile(12, 94);
    set_sprite_tile(13, 95);
    set_sprite_tile(14, 96);
    set_sprite_tile(15, 97);
}