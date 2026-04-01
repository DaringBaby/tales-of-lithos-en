#include "actions.h"

void check_input_keys() {
    if (joypad() & J_A) {
        // interazione con oggetti
        uint8_t gx = (x - 8) / 8;
        uint8_t gy = (y - 16) / 8;
        if (current_location == 1) {
            if (dungeon[player_coords.x][player_coords.y] == 'T' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && treasure_obtained == 0) {
                current_song_bank = 1;
                SWITCH_ROM(current_song_bank);
                hUGE_init(&item_found);
                SWITCH_ROM(1);
                treasure_obtained = 1;
                minerals++;
                obt_mythril++;
                set_bkg_tiles(8, 6, 4, 2, chest_opened);
                delay(150);
                menu_opened = 4;
                set_textbox(2);
                current_song_bank = 4;
                SWITCH_ROM(current_song_bank);
                hUGE_init(&dungeon_theme);
                SWITCH_ROM(1);
            }
            else if (dungeon[player_coords.x][player_coords.y] == 'K' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && key_obtained == 0) {
                current_song_bank = 1;
                SWITCH_ROM(current_song_bank);
                hUGE_init(&item_found);
                SWITCH_ROM(1);
                set_sprite_tile(33, 59);
                set_sprite_tile(34, 60);
                key_obtained = 1;
                set_bkg_tiles(8, 6, 4, 2, chest_opened);
                delay(150);
                menu_opened = 4;
                set_textbox(1);
                current_song_bank = 4;
                SWITCH_ROM(current_song_bank);
                hUGE_init(&dungeon_theme);
                SWITCH_ROM(1);
            }
            else if (dungeon[player_coords.x][player_coords.y] == 'L' && key_obtained == 1) {
                switch (locked_door) {
                    case 1:
                        if (gx >= 8 && gx <= 11 && gy <= 3) {
                            lock_opened = 1;
                            hide_door();
                        }
                        break;
                    case 2:
                        if (gy >= 8 && gy <= 9 && gx >= 16) {
                            lock_opened = 1;
                            hide_door();
                        }
                        break;
                    case 4:
                        if (gy >= 14 && gx >= 8 && gx <= 11) {
                            lock_opened = 1;
                            hide_door();
                        }
                        break;
                    case 8:
                        if (gx <= 3 && gy >= 8 && gy <= 9) {
                            lock_opened = 1;
                            hide_door();
                        }
                        break;
                }
                unlock_sfx();
            }
            else {
                if (num_arrows > 0) {
                    shoot_arrow();
                    num_arrows--;
                    delay(100);
                    move_enemy(&current_enemies[0]);
                    move_enemy(&current_enemies[1]);
                    move_boss(&boss);
                }
            }
        }
        else if (current_location == 0) {
            if (gx >= 4 && gx <= 5 && gy >= 10 && gy <= 11) {
                while(joypad() & J_A) { wait_vbl_done(); }
                menu_opened = 2;
                HIDE_SPRITES;
                move_win(7, 32);
                set_win_tiles(0, 0, 20, 14, hector_menu);
                set_win_tiles(1, 1, 1, 1, &arrow_tile);
                delay(300);
            }
            else if (gx >= 14 && gx <= 15 && gy >= 8 && gy <= 9) {
                while(joypad() & J_A) { wait_vbl_done(); }
                menu_opened = 3;
                HIDE_SPRITES;
                move_win(7, 32);
                set_win_tiles(0, 0, 20, 14, safy_menu);
                set_win_tiles(1, 1, 1, 1, &arrow_tile);
                delay(300);
            }
            else if (gx>=12 && gx <=13 && gy >= 10 && gy <= 11) {
                save_game();
                delay(150);
                heal_sfx();
                menu_opened = 4;
                set_textbox(0);
            }
        }
    }

    else if (joypad() & J_B && current_location == 1) {
        if (heals > 0) {
            heal_sfx();
            heal_player();
            heals--;
            delay(100);
            move_enemy(&current_enemies[0]);
            move_enemy(&current_enemies[1]);
            move_boss(&boss);
        }
    }
}
