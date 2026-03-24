#include "enemy.h"
#include <stdio.h>
#include "sound.h"
void move_enemy(Enemy *e) {
    uint8_t dx, dy;
    if (!e->alive) {
        return;
    }

    // controllo distanza per attacco
    dx = check_distance_x(e);
    dy = check_distance_y(e);

    // da vedere bene come far funzionare bene il nemico che segue

    if (dx == 16 && dy == 0 || dx == 0 && dy == 16) {
        enemy_attack(e);
        e->targeting = 1;
        return;
    }

    uint8_t moved = 0;
    if (e->targeting) {
        uint8_t direction;
        int16_t diff_x = check_distance_x(e);
        int16_t diff_y = check_distance_y(e);

        if (diff_x > diff_y) {
            if (x > e->x) {
                direction = 1;
            }
            else {
                direction = 3;
            }
        }
        else {
            if (y > e->y) {
                direction = 2;
            }
            else {
                direction = 0;
            }
        }

        uint8_t next_x = e->x;
        uint8_t next_y = e->y;
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
        if (check_terrain(next_x + 8, next_y + 8) && !is_enemy_at(next_x, next_y, e)) {
            enemy_smooth_movement(e, direction);
            e->x = next_x;
            e->y = next_y;
        }
        return;
    }
    while (!moved){
        moved = 0;
        uint8_t next_x = e->x;
        uint8_t next_y = e->y;
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
        if ((next_x != e->x || next_y != e->y) && check_terrain(next_x + 8, next_y + 8) && !is_enemy_at(next_x, next_y, e)) {
            enemy_smooth_movement(e, direction);
            e->x = next_x;
            e->y = next_y;
            moved = 1;
        }
    }


    if (dx == 16 && dx == 0 || dx == 0 && dy == 16) {
        e->targeting = 1;
    }
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
        case 1:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 1;
            e->exp_reward = 1;
            break;
        case 2:
            e->hp = 10;
            e->atk = 11;
            e->def = 6;
            e->type = 2;
            e->exp_reward = 3;
            break;
        case 3:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 3;
            e->exp_reward = 5;
            break;
        case 4:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 4;
            e->exp_reward = 10;
            break;
        case 5:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 5;
            e->exp_reward = 15;
            break;
        case 6:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 6;
            e->exp_reward = 25;
            break;
        case 7:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 7;
            e->exp_reward = 35;
            break;
        case 8:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 8;
            e->exp_reward = 50;
            break;
        case 9:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 9;
            e->exp_reward = 60;
            break;
        case 10:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 10;
            e->exp_reward = 75;
            break;
        case 11:
            e->hp = 10;
            e->atk = 1;
            e->def = 1;
            e->type = 11;
            e->exp_reward = 90;
            break;
    }
    e->sprite_id = sprite_id;
    e->alive = 1; // cambiato
    e->targeting = 0;
}

uint8_t check_distance_x(Enemy* e) {
    if (x > e->x) {
            return(x - e->x);
        }
    else {
        return(e->x - x);
    }
}

uint8_t check_distance_y(Enemy* e) {
    if (y > e->y) {
        return(y - e->y);
    }
    else {
        return(e->y - y);
    }
}

void enemy_attack(Enemy* e) {
    hit_sfx();
    uint8_t damage;
    if (e->atk > defense) {
        damage = e->atk - defense;
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

void enemy_death(Enemy* e) {
    spawn_drop(e->x, e->y);
    e->hp = 0;
    e->alive = 0;
    e->x = 0;
    e->y = 0;
    move_sprite(e->sprite_id, 0, 0);
    move_sprite(e->sprite_id + 1, 0, 0);
    move_sprite(e->sprite_id + 2, 0, 0);
    move_sprite(e->sprite_id + 3, 0, 0);
    set_sprite_tile(e->sprite_id, 50);
    set_sprite_tile(e->sprite_id+1, 50);
    set_sprite_tile(e->sprite_id+2, 50);
    set_sprite_tile(e->sprite_id+3, 50);


}


void enemy_smooth_movement(Enemy* e, uint8_t dir) {
    uint8_t frame = 0;
    uint8_t mov_x, mov_y;
    mov_x = e->x;
    mov_y = e->y;
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
        move_sprite(e->sprite_id, mov_x, mov_y);
        move_sprite(e->sprite_id+1, mov_x+8, mov_y);
        move_sprite(e->sprite_id+2, mov_x, mov_y+8);
        move_sprite(e->sprite_id+3, mov_x+8, mov_y+8);
        frame++;
    }
}

uint8_t is_enemy_at(uint8_t tx, uint8_t ty, Enemy *self) {
    for (uint8_t i = 0; i < 2; i++) {
        Enemy* other = &current_enemies[i];
        if (other->alive && other != self) {
            if (other->x == tx && other->y == ty) {
                return 1;
            }
        }
    }
    return 0;
}
