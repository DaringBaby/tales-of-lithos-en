#pragma bank 3
#include "gb/gb.h"
#include "enemy.h"
#include "spawn_enemy.h"
#include "../tiles/Enemies.h"

uint8_t room_enemies[4][4];

uint8_t get_num_enemies(uint8_t floor) BANKED {
    uint8_t num_enemies;
    uint8_t floor_type = floor % 5;
    uint8_t enemy_var = arand() % 3;
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
    switch (floor % 5) {
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
        case 0:
            type1 = 38;
            type2 = 51;
            type3 = 39;
            break;
    }

    uint8_t floor_type = (floor - 1) / 5;
    uint8_t id_1, id_2, id_3;
    switch (floor_type) {
        case 0:
            id_1 = 1;
            id_2 = 2;
            id_3 = 3;
            break;
        case 1:
            id_1 = 3;
            id_2 = 4;
            id_3 = 5;
            break;
        case 2:
            id_1 = 5;
            id_2 = 6;
            id_3 = 7;
            break;
        case 3:
            id_1 = 7;
            id_2 = 8;
            id_3 = 9;
            break;
        case 4:
            id_1 = 9;
            id_2 = 10;
            id_3 = 11;
            break;
    }


    uint8_t rng = arand() & 127;
    if (rng < type1) {
        enemy_id = id_1;
    }
    else if (rng < type2 + type1) {
        enemy_id = id_2;
    }
    else {
        enemy_id = id_3;
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

void set_enemy_sprite() BANKED {
    switch (current_enemies[0].type) {
        case 1:
            set_sprite_data(90, 4, LarvaOscura);
            break;
        case 2:
            set_sprite_data(90, 4, Trisguardo);
            break;
        case 3:
            set_sprite_data(90, 4, Cervellino);
            break;
        case 4:
            set_sprite_data(90, 4, Pipistrello);
            break;
        case 5:
            set_sprite_data(90, 4, Ragnocchio);
            break;
        case 6:
            set_sprite_data(90, 4, Quadratocchio);
            break;
        case 7:
            set_sprite_data(90, 4, Cristallocchio);
            break;
        case 8:
            set_sprite_data(90, 4, OcchioInfuocato);
            break;
        case 9:
            set_sprite_data(90, 4, Armatura);
            break;
        case 10:
            set_sprite_data(90, 4, PredatoreOmbra);
            break;
        case 11:
            set_sprite_data(90, 4, Dragocchio);
            break;
    }
    switch (current_enemies[1].type) {
        case 1:
            set_sprite_data(94, 4, LarvaOscura);
            break;
        case 2:
            set_sprite_data(94, 4, Trisguardo);
            break;
        case 3:
            set_sprite_data(94, 4, Cervellino);
            break;
        case 4:
            set_sprite_data(94, 4, Pipistrello);
            break;
        case 5:
            set_sprite_data(94, 4, Ragnocchio);
            break;
        case 6:
            set_sprite_data(94, 4, Quadratocchio);
            break;
        case 7:
            set_sprite_data(94, 4, Cristallocchio);
            break;
        case 8:
            set_sprite_data(94, 4, OcchioInfuocato);
            break;
        case 9:
            set_sprite_data(94, 4, Armatura);
            break;
        case 10:
            set_sprite_data(94, 4, PredatoreOmbra);
            break;
        case 11:
            set_sprite_data(94, 4, Dragocchio);
            break;
    }
    set_enemy_tiles();
    return;
}
