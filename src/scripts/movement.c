#include <gb/gb.h>
#include "scripts/movement.h"

void check_input_movement() {
    uint8_t moved = 0;

    if (joypad() & J_DOWN) {
        last_direction = 4;
        set_character_sprite(4);
        if (check_terrain(x + 8, y + 24) && !is_sprite_at(x, y + 16)) {
            moved = 1;
            if (!check_enemy(4)) {
                smooth_movement(4);
            }
            else {
                uint8_t enemy_idx = check_enemy(4);
                play_attack_animation(4);
                player_attack(0, enemy_idx-1);
                set_character_sprite(4);
            }
        }
    }
    else if (joypad() & J_UP) {
        set_character_sprite(1);
        if (check_terrain(x + 8, y - 8) && !is_sprite_at(x, y - 16)) {
            last_direction = 1;
            moved = 1;
            if (!check_enemy(1)) {
                smooth_movement(1);
            }
            else {
                uint8_t enemy_idx = check_enemy(1);
                play_attack_animation(1);
                player_attack(0, enemy_idx-1);
                set_character_sprite(1);
            }
            if (current_location == 0 && y <= 40) {
                current_location = 1;
                current_floor = 1;
                obt_mythril = 0;
                obt_exp = 0;
                boss.defeated = 1;
                hide_camp_sprites();
                save_game();
                go_into_dungeon();
                play_song(3);
                set_sprite_tile(4, 0);
                set_sprite_tile(5, 1);
                set_sprite_tile(6, 2);
                set_sprite_tile(7, 3);
                x = 120;
                y = 112;
                return;
            }
        }
    }
    else if (joypad() & J_LEFT) {
        last_direction = 8;
        set_character_sprite(8);
        if (check_terrain(x - 8, y + 8) && !is_sprite_at(x - 16, y)) {
            moved = 1;
            if (!check_enemy(8)) {
                smooth_movement(8);
            }
            else {
                uint8_t enemy_idx = check_enemy(8);
                play_attack_animation(8);
                player_attack(0, enemy_idx-1);
                set_character_sprite(8);
            }
        }
    }
    else if (joypad() & J_RIGHT) {
        set_character_sprite(2);
        last_direction = 2;
        if (check_terrain(x + 24, y + 8) && !is_sprite_at(x + 16, y)) {
            moved = 1;
            if (!check_enemy(2)) {
                smooth_movement(2);
            }
            else {
                uint8_t enemy_idx = check_enemy(2);
                play_attack_animation(2);
                player_attack(0, enemy_idx-1);
                set_character_sprite(2);
            }
        }
    }

    if (moved) {
        // move_character();
        check_drops(x, y);
        delay(20);
        if (current_location == 1) {
            move_enemy(&current_enemies[0]);
            move_enemy(&current_enemies[1]);
            move_boss(&boss);

            if (dungeon[player_coords.x][player_coords.y] == 'E' && x <= 32 && y <= 40 && !boss_battle) {
                stairs_sfx();
                go_next_floor();
            }

            if (current_hp == 0) {
                death_sfx();
                delay(100);
                play_song(0);
                game_over();
                enemy_death(&current_enemies[0]);
                enemy_death(&current_enemies[1]);
                boss_death(&boss);
                clear_drops();
                boss_floor_defeated = 0;
                key_obtained = 0;
                boss_battle = 0;
                move_win(7, 136);
                set_mini_menu();
                set_camp_map();
                x = 120;
                y = 112;
                move_character();
                delay(100);
                SHOW_WIN;
                DISPLAY_ON;
            }
        }

    }
}


void smooth_movement(uint8_t dir) {
    uint8_t mov_x, mov_y;
    mov_x = x;
    mov_y = y;
    uint8_t frame = 0;
    switch (dir) {
        case 1:
            y-=16;
            break;
        case 2:
            x+=16;
            break;
        case 4:
            y+=16;
            break;
        case 8:
            x-=16;
            break;
    }

    play_walk_animation(dir);

    while (frame < 16) {
        if (frame > 7) {
            set_character_sprite(dir);
        }
        if (mov_y >= 136) {
            set_sprite_tile(6, 50);
            set_sprite_tile(7, 50);
        }
        else if (mov_y == 134){
            switch (dir) {
                case 1:
                    set_sprite_tile(6, 6);
                    set_sprite_tile(7, 7);
                    break;
                case 2:
                    set_sprite_tile(6, 10);
                    set_sprite_tile(7, 11);
                    break;
                case 4:
                    set_sprite_tile(6, 2);
                    set_sprite_tile(7, 3);
                    break;
                case 8:
                    set_sprite_tile(6, 14);
                    set_sprite_tile(7, 15);
                    break;
            }
        }
        wait_vbl_done();
        switch (dir) {
            case 1:
                mov_y-=1;
                break;
            case 2:
                mov_x+=1;
                break;
            case 4:
                mov_y+=1;
                break;
            case 8:
                mov_x-=1;
                break;
        }
        move_sprite(4, mov_x, mov_y);
        move_sprite(5, mov_x+8, mov_y);
        move_sprite(6, mov_x, mov_y + 8);
        move_sprite(7, mov_x + 8, mov_y + 8);
        frame++;
    }

}


void move_character() {
    move_sprite(4, x, y);
    move_sprite(5, x+8, y);
    move_sprite(6, x, y + 8);
    move_sprite(7, x + 8, y + 8);
    // per ora che non ci sono altri tiles per il player
    if (y == 144) {
            set_sprite_tile(6, 50);
            set_sprite_tile(7, 50);
        }

}

uint8_t check_terrain(uint8_t new_x, uint8_t new_y) {

    if (current_location != 0) {
        if (new_x < 8 || new_x > 160 || new_y < 16 || new_y > 152) {
            return 1;
        }
    }


    int16_t gx = ((int16_t)new_x - 8) / 8;
    int16_t gy = ((int16_t)new_y - 16) / 8;

    if (gx < 0 || gx >= 20 || gy < 0 || gy >= 18) {
        return 0;
    }

    uint16_t tile_index = (uint16_t)gy * 20 + gx;

    if (current_location == 0) {
        SWITCH_ROM(2);
        uint8_t tile_id = Camp[tile_index];             // collisioni campo
        uint8_t camp_colliding = camp_collisions[tile_id];
        SWITCH_ROM(1);
        if (camp_colliding == 1) return 0;
    } else {
        if (dungeon[player_coords.x][player_coords.y] == 'T' || dungeon[player_coords.x][player_coords.y] == 'K') {
            if (gx >= 8 && gx <= 11 && gy >= 6 && gy <= 7) {
                return 0;
            }
        }
        if (dungeon[player_coords.x][player_coords.y] == 'L' && lock_opened == 0) {
            switch (locked_door) {
                case 1:
                    if (gy <= 1) {
                        return 0;
                    }
                    break;
                case 2:
                    if (gx >= 18) {
                        return 0;
                    }
                    break;
                case 4:
                    if (gy >= 16) {
                        return 0;
                    }
                    break;
                case 8:
                    if (gx <= 1) {
                        return 0;
                    }
                    break;
            }
        }
        SWITCH_ROM(2);
        uint8_t tile_id = current_room[tile_index];     // collisioni dungeon
        SWITCH_ROM(1);
        if (tile_id > 3) return 0;
    }

    return 1;
}

uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y) {
    if (current_location == 0){
        if (target_x == 120 && target_y == 64) {
            return 1;
        }
    }
    return 0;

}
