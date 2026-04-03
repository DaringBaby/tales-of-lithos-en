#include "scripts/combat.h"

void player_attack(uint8_t wpn, uint8_t index) {
    hit_sfx();
    uint8_t damage;
    uint8_t atk_stat;
    if (wpn == 0) { // spada
        atk_stat = attack;
    }
    else { // freccia
        atk_stat = arrow_damage;
    }
    if (index == 2) {
        if (atk_stat > boss.def) {
            damage = atk_stat - boss.def;
        }
        else {
            damage = 1;
        }
        show_number(damage, 0, 1, index);
        if (damage < boss.hp) {
            boss.hp -= damage;
        }
        else {
            boss.hp = 0;
        }
        if (boss.hp == 0) {
            enemy_death_sfx();
            uint8_t b_x = boss.x;
            uint8_t b_y = boss.y;
            boss_death(&boss);
            set_character_sprite(last_direction);
            wait_vbl_done();
            play_explosion_animation(b_x, b_y);
            boss_floor_defeated = 1;
            boss_battle = 0;
            enemies_defeated++;
            experience += boss.exp_reward;
            obt_exp += boss.exp_reward;
            minerals+=2;
            menu_opened = 4;
            if (current_floor != 25) {
                play_song(1);
                set_textbox(3);
                uint8_t door = doors[player_coords.x][player_coords.y];
                const unsigned char* room_ptr;
                set_room_tiles(door, room_ptr, player_coords);
                set_bkg_tiles(2, 2, 2, 2, stairs);
                play_song(3);
            }
            else {
                play_song(7);
                play_ending();
                save_game();
                reset();
            }
        }
        return;
    }


    if (atk_stat > current_enemies[index].def) {
        damage = atk_stat - current_enemies[index].def;
    }
    else {
        damage = 1;
    }
    show_number(damage, 0, 1, index);
    if (damage < current_enemies[index].hp) {
        current_enemies[index].hp -= damage;
    }
    else {
        current_enemies[index].hp = 0;
        current_enemies[index].alive = 0;
    }
    if (current_enemies[index].hp == 0) {
        uint8_t e_x = current_enemies[index].x;
        uint8_t e_y = current_enemies[index].y;
        set_character_sprite(last_direction);
        wait_vbl_done();
        enemy_death(&current_enemies[index]);
        enemy_death_sfx();
        play_explosion_animation(e_x, e_y);
        enemies_defeated++;
        experience += current_enemies[index].exp_reward;
        obt_exp += current_enemies[index].exp_reward;
    }
}



void shoot_arrow() {
    arrow_sfx();
    uint8_t arrow_x = x;
    uint8_t arrow_y = y;
    switch (last_direction) {
            case 1:
                set_sprite_tile(39, 80);
                set_sprite_prop(39, 0);
                break;
            case 2:
                set_sprite_tile(39, 81);
                set_sprite_prop(39, 0);
                break;
            case 4:
                set_sprite_tile(39, 80);
                set_sprite_prop(39, S_FLIPY);
                break;
            case 8:
                set_sprite_tile(39, 81);
                set_sprite_prop(39, S_FLIPX);
                break;
        }
    while (1) {
        wait_vbl_done();
        switch (last_direction) {
            case 1:
                arrow_y-=2;
                break;
            case 2:
                arrow_x+=2;
                break;
            case 4:
                arrow_y+=2;
                break;
            case 8:
                arrow_x-=2;
                break;
        }
        move_sprite(39, arrow_x, arrow_y);
        if (arrow_x < 1 || arrow_x > 168 || arrow_y > 144 || arrow_y < 8 || !check_terrain(arrow_x, arrow_y)) { // pulu
            set_sprite_tile(39, 50);
            move_sprite(39, 0, 0);
            return;
        }
        for (int i=0; i<2; i++) {
            uint8_t enemy_x = current_enemies[i].x;
            uint8_t enemy_y = current_enemies[i].y;
            if (arrow_x == enemy_x && arrow_y == enemy_y) {
                set_sprite_tile(39, 50);
                move_sprite(39, x, y);
                player_attack(1, i); // arrow atk
                return;
            }
        }
        if ((arrow_x == boss.x || arrow_x == boss.x+16) && (arrow_y == boss.y || arrow_y == boss.y + 16)) {
            set_sprite_tile(39, 50);
            move_sprite(39, x, y);
            player_attack(1, 2);
            return;
        }
    }
}

void heal_player() {
    uint8_t heal = heal_quantity;
    current_hp += heal;
    if (current_hp >= max_hp) {
        heal = heal_quantity - (current_hp - max_hp);
        current_hp = max_hp;
    }
    play_heal_animation();
    show_number(heal, 1, 0, 0);
}
