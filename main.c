#include <gb/gb.h>
#include <stdio.h>
#include "src/tiles/character.c"
#include "src/tiles/CampTiles.c"
#include "src/maps/CampMap.c"
#include "src/tiles/Hector.c"
#include "src/tiles/Safy.c"
#include "src/tiles/DungeonTiles.c"
#include "src/maps/Dungeon.c"
#include "src/scripts/generate_dungeon.h"
#include "src/tiles/textbox.c"
#include "src/tiles/Text.c"
#include "src/tiles/mugshot.c"
#include "src/tiles/DungeonObjects.c"
#include "src/tiles/Arrow.c"
#include "src/scripts/gui.h"

/* PROTOTYPES */

void move_character();
void check_input_movement();
uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);
void set_camp_map();
void set_dungeon_map();
void set_room(Coords coord);
void change_room();
void set_stats();
void check_open_menu();
void clean_window();
void set_mini_menu();
void check_input_keys();
void check_menu_options(uint8_t chara);
void hector_upgrades();
void safy_upgrades();
/* VARS */

int tile_id = 0;
uint8_t x = 120;
uint8_t y = 112;


unsigned char blank[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
const uint8_t chest_closed[] = {225, 226, 227, 228, 229, 230, 231, 232};
const uint8_t chest_opened[] = {233, 234, 235, 236, 237, 238, 239, 240};
const uint8_t stairs[] = {241, 242, 243, 244};

const uint8_t menu_body[] = {187};
uint8_t arrow_tile = 245;


Coords player_coords;
const unsigned char * current_room;


uint8_t last_joypad = 0;
uint8_t current_joypad = 0;


/* PLAYER STATS */
uint8_t max_hp = 23;
uint8_t current_hp = 23;
uint8_t attack = 5;
uint8_t defense = 3;
uint8_t level = 1;
uint8_t experience = 123;
uint8_t sword_lvl = 1;
uint8_t shield_lvl = 1;
uint8_t arrow_lvl = 1;
uint8_t quiver_lvl = 1;
uint8_t potion_quant_lvl = 1;
uint8_t potion_heal_lvl = 1;

/* NUMBER OF ITEMS */
uint8_t heals = 5;
uint8_t heal_quantity = 10;
uint8_t arrow_damage = 3;
uint8_t num_arrows = 10;
uint8_t max_num_arrows = 10;
uint8_t minerals = 23;




/* GAME VARS*/
uint8_t menu_opened = 0; // 0: no menu, 1: main menu, 2: hector menu, 3: safy menu
uint8_t current_location = 0; // 0 camp, 1 dungeon
uint8_t current_floor = 1;

uint8_t hector_option = 1;
uint8_t safy_option = 1;

const uint8_t upgrade_costs[] = {2, 4, 7, 10, 14, 18, 24, 30};
const uint8_t cure_upgrade_costs[] = {7, 12, 17, 23, 29, 35, 42, 50};
const uint8_t level_curve[] = {12, 25, 38, 52, 66, 81, 97, 113, 120, 130, 145, 160, 175, 190, 205, 220, 235, 248, 255};
/* FLAGS */
uint8_t key_obtained = 0;
uint8_t treasure_obtained = 0;


void main(void) {
    cls();
    // start floor
    
    
    set_sprite_data(0, 4, Character);
    set_sprite_data(16, 4, Hector);
    set_sprite_data(20, 4, Safy);
    set_sprite_data(50, 1, blank);

    set_bkg_data(128, 51, Text);
    set_bkg_data(179, 9, Textbox);
    set_bkg_data(188, 16, Mugshot);
    set_bkg_data(220, 3, MiniGUI);
    set_bkg_data(225, 20, Objects);
    set_bkg_data(245, 1, arrow);

    move_win(7, 136);
    set_mini_menu();

    if (current_location == 0){
        set_camp_map();
    }

    else {
        set_dungeon_map();
        generate_dungeon(current_floor);
        Coords start;
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                if (dungeon[i][j] == 'S') {
                    start.x = i;
                    start.y = j;
                    player_coords.x = i;
                    player_coords.y = j;
                }
            }
        }
        set_room(start);
    }

    set_sprite_tile(0, 0);
    set_sprite_tile(1, 1);
    set_sprite_tile(2, 2);
    set_sprite_tile(3, 3);
    move_character();

    SHOW_SPRITES;
    SHOW_BKG;
    SHOW_WIN;
    DISPLAY_ON;

    while(1) {
        check_open_menu();
        if (menu_opened == 0){
            check_input_movement();
            check_input_keys();
        }
        else if (menu_opened == 2) {
            check_menu_options(0);
        }
        else if (menu_opened == 3) {
            check_menu_options(1);
        }
        change_room();
        wait_vbl_done();
    }
}

void move_character() {
    move_sprite(0, x, y);
    move_sprite(1, x+8, y);
    move_sprite(2, x, y + 8);
    move_sprite(3, x + 8, y + 8);
    // per ora che non ci sono altri tiles per il player
    if (y == 144) { 
            set_sprite_tile(2, 50); 
            set_sprite_tile(3, 50);
        } else {
            set_sprite_tile(2, 2); 
            set_sprite_tile(3, 3);
        }

}

void check_input_movement() {
    if (joypad() & J_DOWN) {
    if (check_terrain(x + 8, y + 16 + 8) && !is_sprite_at(x, y + 16)) { 
        y += 16;
        move_character();
        delay(100);
    }
}
else if (joypad() & J_UP) {
    if (check_terrain(x + 8, y - 16 + 8) && !is_sprite_at(x, y - 16)) {
        y -= 16;
        move_character();
        delay(100);
    }
}
    else if (joypad() & J_LEFT) {
        if (check_terrain(x - 16 + 8, y + 8) && !is_sprite_at(x-16, y)) {
            x -= 16;
            move_character();
            delay(100);
        }
    }
    else if (joypad() & J_RIGHT) {
        if (check_terrain(x + 16 + 8, y + 8) && !is_sprite_at(x+16, y)) {
            x += 16;
            move_character();
            delay(100);
        }
    } 
}

void check_input_keys() {
    if (joypad() & J_A) {
        // interazione con oggetti
        uint8_t gx = (x - 8) / 8;
        uint8_t gy = (y - 16) / 8;
        if (current_location == 1) {
            if (dungeon[player_coords.x][player_coords.y] == 'T' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9) {
                treasure_obtained = 1;
                set_bkg_tiles(8, 6, 4, 2, chest_opened);
            }
            else if (dungeon[player_coords.x][player_coords.y] == 'K' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9) {
                key_obtained = 1;
                set_bkg_tiles(8, 6, 4, 2, chest_opened);
            }
        }
        else if (current_location == 0) {
            if (gx >= 4 && gx <= 5 && gy >= 10 && gy <= 11) {
                menu_opened = 2;
                HIDE_SPRITES;
                move_win(7, 32);
                set_win_tiles(0, 0, 20, 14, hector_menu);
                set_win_tiles(1, 1, 1, 1, &arrow_tile);
                delay(300);
            }
            else if (gx >= 14 && gx <= 15 && gy >= 8 && gy <= 9) {
                menu_opened = 3;
                HIDE_SPRITES;
                move_win(7, 32);
                set_win_tiles(0, 0, 20, 14, safy_menu);
                set_win_tiles(1, 1, 1, 1, &arrow_tile);
                delay(300);
            }
        }
    }

    else if (joypad() & J_B) {
        // B: cura?
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
        uint8_t tile_id = Camp[tile_index];             // collisioni campo
        if (camp_collisions[tile_id] == 1) return 0;
    } else {
        if (dungeon[player_coords.x][player_coords.y] == 'T' || dungeon[player_coords.x][player_coords.y] == 'K') {
            if (gx >= 8 && gx <= 11 && gy >= 6 && gy <= 7) {
                return 0;
            }
        }
        uint8_t tile_id = current_room[tile_index];     // collisioni dungeon
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

void set_camp_map(){
    set_bkg_tiles(0, 0, 20, 18, Camp);
    set_bkg_data(0, 108, CampTiles);


    set_sprite_tile(4, 16);
    set_sprite_tile(5, 17);
    set_sprite_tile(6, 18);
    set_sprite_tile(7, 19);

    set_sprite_tile(8, 20);
    set_sprite_tile(9, 21);
    set_sprite_tile(10, 22);
    set_sprite_tile(11, 23);


    move_sprite(4, 40, 64);
    move_sprite(5, 48, 64);
    move_sprite(6, 40, 72);
    move_sprite(7, 48, 72);

    move_sprite(8, 120, 64);
    move_sprite(9, 128, 64);
    move_sprite(10, 120, 72);
    move_sprite(11, 128, 72);
}

void set_dungeon_map(){
    set_bkg_data(0, 52, DungeonTiles);
}

void set_room(Coords coord){
    uint8_t door = doors[coord.x][coord.y];
    switch (door) {
    case 1:
        current_room = room1;
        break;
    case 2:
        current_room = room2;
        break;
    case 3:
        current_room = room3;
        break;
    case 4:
        current_room = room4;
        break;
    case 5:
        current_room = room5;
        break;
    case 6:
        current_room = room6;
        break;
    case 7:
        current_room = room7;
        break;
    case 8:
        current_room = room8;
        break;
    case 9:
        current_room = room9;
        break;
    case 10:
        current_room = room10;
        break;
    case 11:
        current_room = room11;
        break;
    case 12:
        current_room = room12;
        break;
    case 13:
        current_room = room13;
        break;
    case 14:
        current_room = room14;
        break;
    case 15:
        current_room = room15;
        break;
    }
    set_bkg_tiles(0, 0, 20, 18, current_room);
    if (dungeon[coord.x][coord.y] == 'K') {
        if (key_obtained == 0){
            set_bkg_tiles(8, 6, 4, 2, chest_closed);
        }
        else {
            set_bkg_tiles(8, 6, 4, 2, chest_opened);
        }
    }
    else if (dungeon[coord.x][coord.y] == 'T') {
        if (treasure_obtained == 0){
            set_bkg_tiles(8, 6, 4, 2, chest_closed);
        }
        else {
            set_bkg_tiles(8, 6, 4, 2, chest_opened);
        }
    }
    else if (dungeon[coord.x][coord.y] == 'E') {
        // if piano % 5 != 0
        set_bkg_tiles(2, 2, 2, 2, stairs);
    }
}

void change_room() {
    if (x > 160 && x < 240) {
        player_coords.x++;
        x = 8;
        set_room(player_coords);
    }
    else if (x > 240) {
        player_coords.x--;
        x = 152;
        set_room(player_coords);
    }
    else if (y > 144) {
        player_coords.y++;
        y = 16;
        set_room(player_coords);
    }
    else if (y < 8) {
        player_coords.y--;
        y = 144;
        set_room(player_coords);
    }
    move_character();
}

void set_stats() {
    uint8_t hp[5];
    uint8_t name[] = {146, 147, 128, 145, 138}; // per ora nome di default: Stark
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
    set_win_tiles(14, 4, 5, 1, name);
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

void check_open_menu() {
    current_joypad = joypad();
    if ((current_joypad & J_START) && !(last_joypad & J_START)) {
        if (menu_opened == 0){
            move_win(7, 0);
            set_win_tiles(0, 0, 20, 18, gui_map);
            set_stats();
            HIDE_SPRITES;
            menu_opened = 1;
        }
        else if (menu_opened == 1) {
            move_win(7, 136);
            set_mini_menu();
            
            SHOW_SPRITES;
            menu_opened = 0;
        }
    }
    last_joypad = current_joypad;
}

void set_mini_menu() {
    uint8_t hp[5];
    uint8_t n_arr[2];
    uint8_t n_heals[2];
    uint8_t n_floor[2];
    hp[0] = current_hp/10 + 154;
    hp[1] = current_hp % 10 + 154;
    hp[2] = 176;
    hp[3] = max_hp/10 + 154;
    hp[4] = max_hp % 10 + 154;
    n_arr[0] = num_arrows / 10 + 154;
    n_arr[1] = num_arrows % 10 + 154;
    n_heals[0] = heals / 10 + 154;
    n_heals[1] = heals % 10 + 154;
    n_floor[0] = current_floor / 10 + 154;
    n_floor[1] = current_floor % 10 + 154;
    move_win(7, 136);
    set_win_tiles(0, 0, 20, 1, mini_gui);
    set_win_tiles(3, 0, 5, 1, hp);
    set_win_tiles(10, 0, 2, 1, n_arr);
    set_win_tiles(13, 0, 2, 1, n_heals);
    set_win_tiles(18, 0, 2, 1, n_floor);
}

void check_menu_options(uint8_t chara) {
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
                    heals = heals + 4;
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