#pragma bank 3
#include "boss.h"
#include "../tiles/bosses.h"
#include <gb/gb.h>
#include "sound.h"


void spawn_boss(Boss *boss) BANKED {
    for (uint8_t i = 0; i < 16; i++) {
        set_sprite_tile(8+1, 50);
        move_sprite(8+i, 0, 0);
    }
    // solo 1 boss per ora
    switch (current_floor) {
        case 5:
            boss->id = 1;
            boss->hp = 80;
            boss->atk = 15;
            boss->def = 6;
            boss->exp_reward = 80;
            boss->x = 72;
            boss->y = 64;
            boss->defeated = 0;
            set_sprite_data(98, 16, EyeBoss);
            break;
        case 10:
            boss->id = 2;
            boss->hp = 180;
            boss->atk = 28;
            boss->def = 14;
            boss->exp_reward = 250;
            boss->x = 72;
            boss->y = 64;
            boss->defeated = 0;
            set_sprite_data(98, 16, BossMantis);
            break;
        case 15:
            boss->id = 3;
            boss->hp = 400;
            boss->atk = 50;
            boss->def = 30;
            boss->exp_reward = 600;
            boss->x = 72;
            boss->y = 64;
            boss->defeated = 0;
            set_sprite_data(98, 16, BossOrb);
            break;
        case 20:
            boss->id = 4;
            boss->hp = 800;
            boss->atk = 100;
            boss->def = 65;
            boss->exp_reward = 1500;
            boss->x = 72;
            boss->y = 64;
            boss->defeated = 0;
            set_sprite_data(98, 16, BossArmored);
            break;
        case 25:
            boss->id = 5;
            boss->hp = 2000;
            boss->atk = 220;
            boss->def = 120;
            boss->exp_reward = 9999;
            boss->x = 72;
            boss->y = 64;
            boss->defeated = 0;
            set_sprite_data(98, 16, BossDragon);
            break;
    }
    for (uint8_t i=0; i<16; i++) {
        set_sprite_tile(8+i, 98+i);
    }
    move_sprite(8, boss->x, boss->y);
    move_sprite(9, boss->x+8, boss->y);
    move_sprite(10, boss->x+16, boss->y);
    move_sprite(11, boss->x+24, boss->y);
    move_sprite(12, boss->x, boss->y+8);
    move_sprite(13, boss->x+8, boss->y+8);
    move_sprite(14, boss->x+16, boss->y+8);
    move_sprite(15, boss->x+24, boss->y+8);
    move_sprite(16, boss->x, boss->y+16);
    move_sprite(17, boss->x+8, boss->y+16);
    move_sprite(18, boss->x+16, boss->y+16);
    move_sprite(19, boss->x+24, boss->y+16);
    move_sprite(20, boss->x, boss->y+24);
    move_sprite(21, boss->x+8, boss->y+24);
    move_sprite(22, boss->x+16, boss->y+24);
    move_sprite(23, boss->x+24, boss->y+24);
}

void move_boss(Boss *boss) BANKED {
    if (boss->defeated) {
        return;
    }
    uint8_t dx, dy;


    // controllo distanza per attacco
    dx = boss_check_distance_x(boss);
    dy = boss_check_distance_y(boss);

    // da vedere bene come far funzionare bene il nemico che segue

    if (dx == 0 && dy == 16 || dx == 16 && dy == 16 || dx == 32 && dy == 0 || dx == 32 && dy == 16 || dx == 16 && dy == 32 || dx == 0 && dy == 32 || dx == 16 && dy == 0) {
        boss_attack(boss);
        return;
    }

    uint8_t moved = 0;
    // mossa random da fare
    uint8_t direction;
    int16_t diff_x = boss_check_distance_x(boss);
    int16_t diff_y = boss_check_distance_y(boss);

    if (diff_x > diff_y) {
        if (x > boss->x) {
            direction = 1;
        }
        else {
            direction = 3;
        }
    }
    else {
        if (y > boss->y) {
            direction = 2;
        }
        else {
            direction = 0;
        }
    }

    uint8_t next_x = boss->x;
    uint8_t next_y = boss->y;
    switch (direction) {
        case 0:
            next_y -= 16;
            break;
        case 1:
            next_x += 16;
            break;
        case 2:
            next_y += 16;
            break;
        case 3:
            next_x -= 16;
            break;
    }
    boss_smooth_movement(boss, direction);
    boss->x = next_x;
    boss->y = next_y;
    return;
}

uint8_t boss_check_distance_x(Boss* boss) {
    if (x > boss->x) {
            return(x - boss->x);
        }
    else {
        return(boss->x - x);
    }
}

uint8_t boss_check_distance_y(Boss* boss) {
    if (y > boss->y) {
        return(y - boss->y);
    }
    else {
        return(boss->y - y);
    }
}

void boss_attack(Boss* boss) {
    hit_sfx();
    uint8_t damage;
    if (boss->atk > defense) {
        damage = boss->atk - defense;
    }
    else {
        damage = 1;
    }

    if (damage < current_hp) {
        current_hp -= damage;
    }
    else {
        current_hp = 0;
    }
    play_hit_animation();
    show_number(damage, 0, 0, 0);
    // check morte?
}

void boss_smooth_movement(Boss* boss, uint8_t dir) {
    uint8_t frame = 0;
    uint8_t mov_x, mov_y;
    mov_x = boss->x;
    mov_y = boss->y;
    while (frame < 8) {
        wait_vbl_done();
        switch (dir) {
            case 0:
                mov_y-=2;
                break;
            case 1:
                mov_x+=2;
                break;
            case 2:
                mov_y+=2;
                break;
            case 3:
                mov_x-=2;
                break;
        }
        move_sprite(8, mov_x, mov_y);
        move_sprite(9, mov_x+8, mov_y);
        move_sprite(10, mov_x+16, mov_y);
        move_sprite(11, mov_x+24, mov_y);
        move_sprite(12, mov_x, mov_y+8);
        move_sprite(13, mov_x+8, mov_y+8);
        move_sprite(14, mov_x+16, mov_y+8);
        move_sprite(15, mov_x+24, mov_y+8);
        move_sprite(16, mov_x, mov_y+16);
        move_sprite(17, mov_x+8, mov_y+16);
        move_sprite(18, mov_x+16, mov_y+16);
        move_sprite(19, mov_x+24, mov_y+16);
        move_sprite(20, mov_x, mov_y+24);
        move_sprite(21, mov_x+8, mov_y+24);
        move_sprite(22, mov_x+16, mov_y+24);
        move_sprite(23, mov_x+24, mov_y+24);
        frame++;
    }
}

void boss_death(Boss* boss) BANKED {
    // spawn_drop(e->x, e->y); niente drop per il boss (per ora)

    boss->hp = 0;
    boss->defeated = 1;
    boss->x = 0;
    boss->y = 0;
    for (uint8_t i = 0; i < 16; i++) {
        set_sprite_tile(8+1, 50);
        move_sprite(8+i, 0, 0);
    }
}
