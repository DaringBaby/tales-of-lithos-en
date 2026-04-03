#pragma bank 3
#include <gb/gb.h>
#include "scripts/gui_management.h"
#include "tiles/minimap.h"

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

void check_map_menu_input() BANKED {
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
                    returning_to_camp = 1;
                    return;
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
                    attack += 10;
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
                    defense += 8;
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
                    arrow_damage += 17;
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
    uint16_t cost = cure_upgrade_costs[potion_quant_lvl-1];
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
                    heal_quantity = heal_quantity + 8;
                    delay(300);
                }
            }
            break;
        case 3:
            if (level < 50) {
                cost = level_curve[level-1];
                if (experience >= cost && joypad() & J_A) {
                    experience = experience - cost;
                    level++;
                    power_ups++;
                    // recalc_stats();
                    attack = attack + 2;
                    defense = defense + 1;
                    max_hp = max_hp + 4;
                    current_hp = max_hp;
                    delay(300);
                }
            }
            break;
        }
    uint8_t costs[4];
    uint8_t exp[4];
    costs[0] = cost / 1000 + 154;
    costs[1] = cost % 1000 / 100 + 154;
    costs[2] = cost % 100 / 10 + 154;
    costs[3] = cost % 10 + 154;
    if (experience > 9999) {
        exp[0] = 163;
        exp[1] = 163;
        exp[2] = 163;
        exp[3] = 163;
    }
    else {
        exp[0] = experience % 10000 / 1000 + 154;
        exp[1] = experience % 1000 / 100 + 154;
        exp[2] = experience % 100 / 10 + 154;
        exp[3] = experience % 10 + 154;
    }
    set_win_tiles(14, 10, 4, 1, costs);
    set_win_tiles(14, 12, 4, 1, exp);

    if (joypad() & J_B) {
        safy_option = 1;
        set_win_tiles(1, 1, 1, 1, &arrow_tile);
        menu_opened = 0;
        SHOW_SPRITES;
        set_mini_menu();
    }
}

void set_stats() BANKED {
    uint8_t hp[7];
    uint8_t atk[2];
    uint8_t def[2];
    uint8_t exp[4];
    uint8_t stat;
    uint8_t mythril[2];
    if (current_hp < 100) {
        hp[0] = 187;
    }
    else {
        hp[0] = current_hp / 100 + 154;
    }
    hp[1] = current_hp % 100 / 10 + 154;
    hp[2] = current_hp % 10 + 154;
    hp[3] = 176;
    if (max_hp < 100) {
        hp[4] = 187;
    }
    else {
        hp[4] = max_hp / 100 + 154;
    }
    hp[5] = max_hp % 100 / 10 + 154;
    hp[6] = max_hp % 10 + 154;
    atk[0] = attack / 10 + 154;
    atk[1] = attack % 10 + 154;
    def[0] = defense / 10 + 154;
    def[1] = defense % 10 + 154;

    uint8_t d3 = (experience% 10000 / 1000);
    uint8_t d2 = (experience % 1000) / 100;
    uint8_t d1 = (experience % 100) / 10;
    uint8_t d0 = (experience % 10);
    if (experience > 9999) {
        exp[0] = 163;
        exp[1] = 163;
        exp[2] = 163;
        exp[3] = 163;
    }
    else {
        exp[0] = (d3 == 0) ? 187 : (d3 + 154);
        exp[1] = (d2 == 0 && d3 == 0) ? 187 : (d2 + 154);
        exp[2] = (d1 == 0 && d2 == 0 && d3 == 0) ? 187 : (d1 + 154);
        exp[3] = d0 + 154;
    }

    mythril[0] = minerals / 10 + 154;
    mythril[1] = minerals % 10 + 154;
    set_win_tiles(12, 6, 7, 1, hp);
    set_win_tiles(14, 4, 5, 1, player_name);
    set_win_tiles(12, 8, 2, 1, atk);
    set_win_tiles(12, 10, 2, 1, def);
    set_win_tiles(15, 14, 4, 1, exp);
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

void set_mini_menu() BANKED {
    if (menu_opened != 0) {
        return;
    }
    uint8_t hp[3];
    uint8_t n_arr[2];
    uint8_t n_heals[2];
    uint8_t n_floor[2];
    if (max_hp < 100) {
        hp[0] = 187;
    }
    else {
        hp[0] = current_hp / 100 + 154;
    }
    hp[1] = current_hp % 100 / 10 + 154;
    hp[2] = current_hp % 10 + 154;
    n_arr[0] = num_arrows / 10 + 154;
    n_arr[1] = num_arrows % 10 + 154;
    n_heals[0] = heals / 10 + 154;
    n_heals[1] = heals % 10 + 154;
    n_floor[0] = current_floor / 10 + 154;
    n_floor[1] = current_floor % 10 + 154;
    move_win(7, 136);
    set_win_tiles(0, 0, 20, 1, mini_gui);
    uint8_t obtained = 223;
    if (key_obtained) {
        obtained = 223;
    }
    else {
        obtained = 187;
    }
    set_win_tiles(7, 0, 1, 1, &obtained);
    // print_debug(debug);
    set_win_tiles(3, 0, 3, 1, hp);
    set_win_tiles(10, 0, 2, 1, n_arr);
    set_win_tiles(13, 0, 2, 1, n_heals);
    set_win_tiles(18, 0, 2, 1, n_floor);
}

void show_number(uint8_t number, uint8_t mode, uint8_t target, uint8_t index) BANKED {
    uint8_t dmg_x, dmg_y;
    if (target == 0) {
        dmg_x = x;
        dmg_y = y-8;
    }
    else {
        if (index == 2) {
            dmg_x = boss.x+8;
            dmg_y = boss.y-8;
        }
        else {
            dmg_x = current_enemies[index].x;
            dmg_y = current_enemies[index].y-8;
        }
    }
    if (mode == 0) { // damage
        set_sprite_tile(0, 76);
    }
    else {
        set_sprite_tile(0, 75);
    }
    if (number / 10 != 0) {
        set_sprite_tile(1, 65 + number / 10);
    }
    else {
        set_sprite_tile(1, 50);
    }

    set_sprite_tile(2, 65 + number % 10);
    uint8_t frame = 0;
    while (frame < 30) {
        wait_vbl_done();
        if (frame %2) {
            dmg_y--;
            if (number / 10 == 0) {
                move_sprite(0, dmg_x, dmg_y);
            }
            else {
                move_sprite(0, dmg_x-8, dmg_y);
            }
            move_sprite(1, dmg_x, dmg_y);
            move_sprite(2, dmg_x+8, dmg_y);
        }
        frame++;
    }
    move_sprite(0, 0, 0);
    move_sprite(1, 0, 0);
    move_sprite(2, 0, 0);
}

void print_debug(uint8_t value) BANKED {
    uint8_t values[3];
    values[0] = value / 100 + 154;
    values[1] = value % 100 / 10 + 154;
    values[2] = value % 10 + 154;
    set_win_tiles(6, 0, 3, 1, values);
}

void check_time() BANKED {
    frames++;
    if (frames == 60) {
        frames = 0;
        seconds++;
    }
    if (seconds == 60) {
        seconds = 0;
        minutes++;
    }
    if (minutes == 60) {
        minutes = 0;
        hours++;
    }
    if (hours > 99) {
        hours = 99;
    }
}
