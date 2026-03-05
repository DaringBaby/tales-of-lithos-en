#pragma bank 3

#include <gb\gb.h>
#include "gui_management.h"
#include "../tiles/minimap.h"



void check_map_options() BANKED {
    if (joypad() & J_UP && map_option > 0) {
        set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
        map_option--;
        set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
        delay(150);
        }
    if (joypad() & J_DOWN && map_option < 2) {
        set_win_tiles(2, 4 + map_option*3, 1, 1, menu_body);
        map_option++;
        set_win_tiles(2, 4 + map_option*3, 1, 1, &arrow_tile);
        delay(150);
        }
    check_map_menu_input();
}

void check_map_menu_input() {
    if (joypad() & J_A) {
        switch (map_option) {
            case 0:
                move_win(7, 136);
                set_mini_menu();
                SHOW_SPRITES;
                menu_opened = 0;
                break;
            case 1:
                menu_opened = 6;
                set_win_tiles(0, 0, 20, 18, stats_menu);
                // stats menu
                uint8_t def_en[3];
                uint8_t pups[2];
                uint8_t mfloor[2];
                def_en[0] = enemies_defeated / 100 + 154;
                def_en[1] = enemies_defeated % 100 / 10 + 154;
                def_en[2] = enemies_defeated % 10 + 154;
                pups[0] = power_ups / 10 + 154;
                pups[1] = power_ups % 10 + 154;
                mfloor[0] = max_floor / 10 + 154;
                mfloor[1] = max_floor % 10 + 154;
                set_win_tiles(16, 4, 3, 1, def_en);
                set_win_tiles(17, 7, 2, 1, mfloor);
                set_win_tiles(17, 10, 2, 1, pups);
                show_time();
                delay(300);
                break;
            case 2:
                if (current_location == 1) {
                    menu_opened = 0;
                    game_over();
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
                break;
        }
    }
}

void show_time() BANKED {
    uint8_t t[8];
    t[0] = hours / 10 + 154;
    t[1] = hours % 10 + 154;
    t[2] = 177;
    t[3] = minutes / 10 + 154;
    t[4] = minutes % 10 + 154;
    t[5] = 177;
    t[6] = seconds / 10 + 154;
    t[7] = seconds % 10 + 154;
    set_win_tiles(11, 13, 8, 1, t);
}

void check_menu_options(uint8_t chara) BANKED {
    if (chara == 0) // Hector
    {
        if (joypad() & J_UP && hector_option > 1) {
            set_win_tiles(1, hector_option*2 - 1, 1, 1, menu_body);
            hector_option--;
            set_win_tiles(1, hector_option*2 - 1, 1, 1, &arrow_tile);
            delay(150);
        }
        else if (joypad() & J_DOWN && hector_option < 4) {
            set_win_tiles(1, hector_option*2 - 1, 1, 1, menu_body);
            hector_option++;
            set_win_tiles(1, hector_option*2 - 1, 1, 1, &arrow_tile);
            delay(150);
        }
        hector_upgrades();
    }
    if (chara == 1) {
        if (joypad() & J_UP && safy_option > 1) {
            set_win_tiles(1, safy_option*2 - 1, 1, 1, menu_body);
            safy_option--;
            set_win_tiles(1, safy_option*2 - 1, 1, 1, &arrow_tile);
            delay(150);
        }
        else if (joypad() & J_DOWN && safy_option < 3) {
            set_win_tiles(1, safy_option*2 - 1, 1, 1, menu_body);
            safy_option++;
            set_win_tiles(1, safy_option*2 - 1, 1, 1, &arrow_tile);
            delay(150);
        }
        safy_upgrades();
    }
}

void hector_upgrades() {
    uint8_t cost = upgrade_costs[sword_lvl-1];

    switch(hector_option) {
        case 1:
            if (sword_lvl < 9) {
                cost = upgrade_costs[sword_lvl-1];
                if (minerals >= cost && joypad() & J_A) {
                    minerals = minerals - cost;
                    sword_lvl++;
                    power_ups++;
                    // recalc_stats();
                    attack = attack + 3;
                    delay(300);
                }
            }
            break;
        case 2:
            if (shield_lvl < 9) {
                cost = upgrade_costs[shield_lvl-1];
                if (minerals >= cost && joypad() & J_A) {
                    minerals = minerals - cost;
                    shield_lvl++;
                    power_ups++;
                    // recalc_stats();
                    defense = defense + 3;
                    delay(300);
                }
            }
            break;
        case 3:
            if (arrow_lvl < 9) {
                cost = upgrade_costs[arrow_lvl-1];
                if (minerals >= cost && joypad() & J_A) {
                    minerals = minerals - cost;
                    arrow_lvl++;
                    power_ups++;
                    // recalc_stats();
                    arrow_damage = arrow_damage + 2;
                    delay(300);
                }
            }
            break;
        case 4:
            if (quiver_lvl < 9) {
                cost = upgrade_costs[quiver_lvl-1];
                if (minerals >= cost && joypad() & J_A) {
                    minerals = minerals - cost;
                    quiver_lvl++;
                    power_ups++;
                    // recalc_stats();
                    max_num_arrows = max_num_arrows + 2;
                    delay(300);
                }
            }
            break;
        }
    uint8_t costs[2];
    uint8_t obt[2];
    costs[0] = cost / 10 + 154;
    costs[1] = cost % 10 + 154;
    obt[0] = minerals / 10 + 154;
    obt[1] = minerals % 10 + 154;
    set_win_tiles(16, 10, 2, 1, costs);
    set_win_tiles(16, 12, 2, 1, obt);

    if (joypad() & J_B) {
        hector_option = 1;
        set_win_tiles(1, 1, 1, 1, &arrow_tile);
        menu_opened = 0;
        SHOW_SPRITES;
        set_mini_menu();
    }
}

void safy_upgrades() {
    uint8_t cost = cure_upgrade_costs[potion_quant_lvl-1];
    switch(safy_option) {
        case 1:
            if (potion_quant_lvl < 9) {
                cost = cure_upgrade_costs[potion_quant_lvl-1];
                if (experience >= cost && joypad() & J_A) {
                    experience = experience - cost;
                    potion_quant_lvl++;
                    heals = heals + 1;
                    max_heals++;
                    power_ups++;
                    delay(300);
                }
            }
            break;
        case 2:
            if (potion_heal_lvl < 9) {
                cost = cure_upgrade_costs[potion_heal_lvl-1];
                if (experience >= cost && joypad() & J_A) {
                    experience = experience - cost;
                    potion_heal_lvl++;
                    power_ups++;
                    heal_quantity = heal_quantity + 4;
                    delay(300);
                }
            }
            break;
        case 3:
            if (level < 20) {
                cost = level_curve[level-1];
                if (experience >= cost && joypad() & J_A) {
                    experience = experience - cost;
                    level++;
                    power_ups++;
                    // recalc_stats();
                    attack = attack + 3;
                    defense = defense + 3;
                    max_hp = max_hp + 5;
                    current_hp = max_hp;
                    delay(300);
                }
            }
            break;
        }
    uint8_t costs[3];
    uint8_t exp[3];
    costs[0] = cost / 100 + 154;
    costs[1] = cost % 100 / 10 + 154;
    costs[2] = cost % 10 + 154;
    exp[0] = experience / 100 + 154;
    exp[1] = experience % 100 / 10 + 154;
    exp[2] = experience % 10 + 154;
    set_win_tiles(15, 10, 3, 1, costs);
    set_win_tiles(15, 12, 3, 1, exp);

    if (joypad() & J_B) {
        safy_option = 1;
        set_win_tiles(1, 1, 1, 1, &arrow_tile);
        menu_opened = 0;
        SHOW_SPRITES;
        set_mini_menu();
    }
}

void set_stats() BANKED {
    uint8_t hp[5];
    uint8_t atk[2];
    uint8_t def[2];
    uint8_t exp[3];
    uint8_t stat;
    uint8_t mythril[2];
    hp[0] = current_hp/10 + 154;
    hp[1] = current_hp % 10 + 154;
    hp[2] = 176;
    hp[3] = max_hp/10 + 154;
    hp[4] = max_hp % 10 + 154;
    atk[0] = attack / 10 + 154;
    atk[1] = attack % 10 + 154;
    def[0] = defense / 10 + 154;
    def[1] = defense % 10 + 154;
    exp[0] = experience / 100 + 154;
    exp[1] = experience % 100 / 10 + 154;
    exp[2] = experience % 10 + 154;
    mythril[0] = minerals / 10 + 154;
    mythril[1] = minerals % 10 + 154;
    set_win_tiles(12, 6, 5, 1, hp);
    set_win_tiles(14, 4, 5, 1, player_name);
    set_win_tiles(12, 8, 2, 1, atk);
    set_win_tiles(12, 10, 2, 1, def);
    set_win_tiles(16, 14, 3, 1, exp);
    set_win_tiles(14, 16, 2, 1, mythril);
    stat = sword_lvl + 154;
    set_win_tiles(4, 12, 1, 1, &stat);
    stat = shield_lvl + 154;
    set_win_tiles(4, 14, 1, 1, &stat);
    stat = arrow_lvl + 154;
    set_win_tiles(4, 16, 1, 1, &stat);
    stat = quiver_lvl + 154;
    set_win_tiles(9, 12, 1, 1, &stat);
    stat = potion_quant_lvl + 154;
    set_win_tiles(9, 14, 1, 1, &stat);
    stat = potion_heal_lvl + 154;
    set_win_tiles(9, 16, 1, 1, &stat);
    stat = level + 154;
    set_win_tiles(15, 12, 1, 1, &stat);
}