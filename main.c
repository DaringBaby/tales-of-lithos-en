#include <gb/gb.h>
#include <stdio.h>
#include "src/songs/hUGEDriver.h"
#include "src/tiles/character.h"
#include "src/tiles/CampTiles.h"
#include "src/maps/CampMap.h"
#include "src/tiles/Hector.h"
#include "src/tiles/Safy.h"
#include "src/tiles/DungeonTiles.h"
#include "src/maps/Dungeon.h"
#include "src/maps/Obstacles.h"
#include "src/scripts/generate_dungeon.h"
#include "src/tiles/textbox.h"
#include "src/tiles/Text.h"
#include "src/tiles/mugshot.h"
#include "src/tiles/DungeonObjects.h"
#include "src/tiles/Arrow.h"
#include "src/tiles/Lock.h"
#include "src/tiles/key.h"
#include "src/tiles/mythril.h"
#include "src/tiles/Enemies.h"
#include "src/tiles/numbers.h"
#include "src/tiles/wpn_arrow.h"
#include "src/tiles/minimap.h"
#include "src/tiles/enemyDrops.h"
#include "src/scripts/titlescreen.h"
#include "src/scripts/gui.h"
#include "src/scripts/enemy.h"
#include "src/scripts/boss.h"
#include "src/scripts/gameover.h"
#include "src/scripts/gui_management.h"
#include "src/scripts/spawn_enemy.h"
#include "src/scripts/combat_system.h"
#include "src/scripts/insert_name.h"
#include "src/scripts/drop.h"
#include "src/scripts/locked_doors.h"
#include "src/scripts/sound.h"
#include "src/scripts/dungeon_management.h"

/* PROTOTYPES */

void move_character();
void check_input_movement();
uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);
void set_camp_map();
void set_dungeon_map();
void set_room(Coords coord);
void change_room();
void check_open_menu();
void clean_window();
void check_input_keys();
void go_into_dungeon();
void hide_camp_sprites();
void go_next_floor();
void set_textbox(uint8_t item);
void player_attack(uint8_t wpn, uint8_t index);
void shoot_arrow();
void smooth_movement(uint8_t dir);
void check_time();
void set_enemy_sprite();
/* VARS */

int tile_id = 0;
uint8_t x = 120;
uint8_t y = 112;

uint8_t last_x;
uint8_t last_y;

uint8_t last_direction = 1;
uint8_t sl_direction = 1;

uint8_t frames = 0;
uint8_t seconds = 0;
uint8_t minutes = 0;
uint8_t hours = 0;

uint8_t enemies_defeated = 0;
uint8_t max_floor = 0;
uint8_t power_ups = 0;

const unsigned char blank[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
const unsigned char black[16] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
const uint8_t chest_closed[] = {225, 226, 227, 228, 229, 230, 231, 232};
const uint8_t chest_opened[] = {233, 234, 235, 236, 237, 238, 239, 240};
const uint8_t stairs[] = {241, 242, 243, 244};

const uint8_t menu_body[] = {187};
const uint8_t arrow_tile = 245;


Coords player_coords;
unsigned char current_room[360];


uint8_t last_joypad = 0;
uint8_t current_joypad = 0;


/* PLAYER STATS */
uint8_t player_name[] = {164, 164, 164, 164, 164};
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
uint8_t max_heals = 5;
uint8_t heals = 5;
uint8_t heal_quantity = 10;
uint8_t arrow_damage = 3;
uint8_t num_arrows = 10;
uint8_t max_num_arrows = 10;
uint8_t minerals = 23;

uint8_t obt_mythril = 0;
uint8_t obt_exp = 0;

/* BANK 2 VARIABLES*/
extern const unsigned char CampTiles[];
extern const unsigned char Camp[];
extern const unsigned char Text[];
extern const unsigned char MiniGUI[];
extern const unsigned char Minimap[];
extern const unsigned char map_menu[];
extern const unsigned char camp_collisions[];
extern const unsigned char DungeonTiles[];
extern const unsigned char Titlescreen[];
extern const unsigned char TitleText[];
extern const unsigned char Title[];
extern const unsigned char NoExit[];
extern char dungeon[4][4];
extern uint8_t doors[4][4];
extern uint8_t room_enemies[4][4];
extern uint8_t obstacles[4][4];
extern uint8_t locked_door;

/* MUSIC */
extern const hUGESong_t gameover_jingle;
extern const hUGESong_t boss_defeated_jingle;

/* GAME VARS*/
uint8_t menu_opened = 0; // 0: no menu, 1: main menu, 2: hector menu, 3: safy menu, 4 textbox, 5: map menu, 6: stats menu
uint8_t current_location = 0; // 0 camp, 1 dungeon
uint8_t current_floor = 1;

uint8_t map[4][4];


uint8_t hector_option = 1;
uint8_t safy_option = 1;
uint8_t map_option = 0;

const uint8_t upgrade_costs[] = {2, 4, 7, 10, 14, 18, 24, 30};
const uint8_t cure_upgrade_costs[] = {7, 12, 17, 23, 29, 35, 42, 50};
const uint8_t level_curve[] = {12, 25, 38, 52, 66, 81, 97, 113, 120, 130, 145, 160, 175, 190, 205, 220, 235, 248, 255};
/* FLAGS */
uint8_t key_obtained = 0;
uint8_t treasure_obtained = 0;
uint8_t lock_opened = 0;
uint8_t boss_battle = 0;
uint8_t boss_floor_defeated = 0;

uint8_t current_song_bank = 3;
/* ENEMIES */

Enemy current_enemies[2];
Enemy enemy;
Boss boss;


// da modificare: current level, posizione di start, statistiche (per debug)

void main(void) {
    cls(); 
    SWITCH_ROM(2);
    set_bkg_data(0, 241, Titlescreen);
    set_bkg_data(241, 8, TitleText);
    set_bkg_tiles(0, 0, 20, 18, Title);
    SWITCH_ROM(1);
    init_sound();
    set_titlescreen();
    start_sfx();
    
    
    
    set_sprite_data(0, 4, MC_down);
    set_sprite_data(8, 4, MC_right);
    set_sprite_data(12, 4, MC_left);
    set_sprite_data(16, 4, Hector);
    set_sprite_data(20, 4, Safy);
    set_sprite_data(50, 1, blank);
    set_sprite_data(51, 8, Lock);
    set_sprite_data(59, 2, Key);
    set_sprite_data(61, 4, Mythril);
    set_sprite_data(65, 12, Numbers);
    set_sprite_data(80, 2, Arrow);
    set_sprite_data(82, 2, Drops);
    SWITCH_ROM(3);
    set_bkg_data(108, 17, Minimap);
    SWITCH_ROM(2);
    set_bkg_data(128, 51, Text);
    SWITCH_ROM(1);
    set_bkg_data(179, 9, Textbox);
    set_bkg_data(188, 16, Mugshot);
    SWITCH_ROM(2);
    set_bkg_data(220, 3, MiniGUI);
    SWITCH_ROM(1);
    set_bkg_data(225, 20, Objects);
    set_bkg_data(245, 1, arrow);
    set_bkg_data(246, 1, black);
    insert_name();
    set_sprite_data(4, 4, MC_up);
    move_win(7, 136);
    set_mini_menu();

    
    if (current_location == 0){
        set_camp_map();
    }

    else {
        go_into_dungeon();
    }

    set_sprite_tile(4, 0);
    set_sprite_tile(5, 1);
    set_sprite_tile(6, 2);
    set_sprite_tile(7, 3);

    // mythrill
    
    set_sprite_tile(35, 61);
    set_sprite_tile(36, 62);
    set_sprite_tile(37, 63);
    set_sprite_tile(38, 64);
    

    move_character();
    SHOW_SPRITES;
    SHOW_BKG;
    SHOW_WIN;
    delay(100);
    DISPLAY_ON;
    while(1) {
        check_open_menu();
        if (menu_opened == 0){
            check_input_movement();
            check_input_keys();
            set_mini_menu(); //sus
            change_room();
        }
        else if (menu_opened == 2) {
            check_menu_options(0);
        }
        else if (menu_opened == 3) {
            check_menu_options(1);
        }
        else if (menu_opened == 4) {
            // void
        }
        else if (menu_opened == 5) {
            check_map_options();
        }
        else if (menu_opened == 6) {
            if (joypad() & J_A || joypad() & J_B) {
                DISPLAY_OFF;
                move_win(7, 136);
                menu_opened = 0;
                set_mini_menu();
                SHOW_SPRITES;
                DISPLAY_ON;
                delay(300);
            }
            show_time();
        }
        check_time();
        wait_vbl_done();
        uint8_t bank_precedente = _current_bank;
        SWITCH_ROM(current_song_bank);
        hUGE_dosound();
        SWITCH_ROM(bank_precedente);
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

void check_input_movement() {
    uint8_t moved = 0;

    if (joypad() & J_DOWN) {
        if (check_terrain(x + 8, y + 24) && !is_sprite_at(x, y + 16)) {
            moved = 1;
            if (!check_enemy(4)) {
                sl_direction = last_direction;
                last_y = y;
                last_x = x;
                last_direction = 4;
                smooth_movement(4);
            }
            else {
                last_direction = 4;
                uint8_t enemy_idx = check_enemy(4);
                set_character_sprite(4);
                player_attack(0, enemy_idx-1);
            }
        }
    }
    else if (joypad() & J_UP) {
        if (check_terrain(x + 8, y - 8) && !is_sprite_at(x, y - 16)) {
            moved = 1;
            if (!check_enemy(1)) {
                sl_direction = last_direction;
                last_y = y;
                last_x = x;
                last_direction = 1;
                smooth_movement(1);
            }
            else {
                last_direction = 1;
                uint8_t enemy_idx = check_enemy(1);
                set_character_sprite(1);
                player_attack(0, enemy_idx-1);
            }
            if (current_location == 0 && y <= 40) {
                current_location = 1;
                current_floor = 5;
                obt_mythril = 0;
                obt_exp = 0;
                boss.defeated = 1;
                hide_camp_sprites();
                go_into_dungeon();
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
        if (check_terrain(x - 8, y + 8) && !is_sprite_at(x - 16, y)) {
            moved = 1;
            if (!check_enemy(8)) {
                sl_direction = last_direction;
                last_direction = 8;
                last_y = y;
                last_x = x;
                smooth_movement(8);
            }
            else {
                last_direction = 8;
                uint8_t enemy_idx = check_enemy(8);
                set_character_sprite(8);
                player_attack(0, enemy_idx-1);
            }
        }
    }
    else if (joypad() & J_RIGHT) {
        if (check_terrain(x + 24, y + 8) && !is_sprite_at(x + 16, y)) {
            moved = 1;
            if (!check_enemy(2)) {
                sl_direction = last_direction;
                last_direction = 2;
                last_y = y;
                last_x = x;
                smooth_movement(2);
            }
            else {
                last_direction = 2;
                uint8_t enemy_idx = check_enemy(2);
                set_character_sprite(2);
                player_attack(0, enemy_idx-1);
            }
        }
    }

    if (moved) {
        // move_character();
        check_drops(x, y);
        delay(100);
        
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
                game_over();
                enemy_death(&current_enemies[0]);
                enemy_death(&current_enemies[1]);
                boss_death(&boss);
                boss_floor_defeated = 0;
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

void check_input_keys() {
    if (joypad() & J_A) {
        // interazione con oggetti
        uint8_t gx = (x - 8) / 8;
        uint8_t gy = (y - 16) / 8;
        if (current_location == 1) {
            if (dungeon[player_coords.x][player_coords.y] == 'T' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && treasure_obtained == 0) {
                unlock_sfx();
                treasure_obtained = 1;
                minerals++;
                obt_mythril++;
                set_bkg_tiles(8, 6, 4, 2, chest_opened);
                delay(150);
                menu_opened = 4;
                set_textbox(2);
            }
            else if (dungeon[player_coords.x][player_coords.y] == 'K' && gx >= 8 && gx <= 11 && gy >= 8 && gy <= 9 && key_obtained == 0) {
                unlock_sfx();
                set_sprite_tile(33, 59);
                set_sprite_tile(34, 60);
                key_obtained = 1;
                set_bkg_tiles(8, 6, 4, 2, chest_opened);
                delay(150);
                menu_opened = 4;
                set_textbox(1);
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

void set_camp_map(){
    set_sprite_tile(4, 4);
    set_sprite_tile(5, 5);
    set_sprite_tile(6, 6);
    set_sprite_tile(7, 7);
    set_sprite_data(16, 4, Hector);
    set_sprite_data(20, 4, Safy);
    SWITCH_ROM(2);
    set_bkg_data(0, 108, CampTiles);
    set_bkg_tiles(0, 0, 20, 18, Camp);
    SWITCH_ROM(1);
    

    set_sprite_tile(8, 16);
    set_sprite_tile(9, 17);
    set_sprite_tile(10, 18);
    set_sprite_tile(11, 19);

    set_sprite_tile(12, 20);
    set_sprite_tile(13, 21);
    set_sprite_tile(14, 22);
    set_sprite_tile(15, 23);


    move_sprite(8, 40, 64);
    move_sprite(9, 48, 64);
    move_sprite(10, 40, 72);
    move_sprite(11, 48, 72);

    move_sprite(12, 120, 64);
    move_sprite(13, 128, 64);
    move_sprite(14, 120, 72);
    move_sprite(15, 128, 72);
    empty_map_tiles();
}


void hide_camp_sprites() {
    
    set_sprite_tile(8, 50);
    set_sprite_tile(9, 50);
    set_sprite_tile(10, 50);
    set_sprite_tile(11, 50);

    set_sprite_tile(12, 50);
    set_sprite_tile(13, 50);
    set_sprite_tile(14, 50);
    set_sprite_tile(15, 50);
    move_sprite(8, 0, 0);
    move_sprite(9, 0, 0);
    move_sprite(10, 0, 0);
    move_sprite(11, 0, 0);

    move_sprite(12, 0, 0);
    move_sprite(13, 0, 0);
    move_sprite(14, 0, 0);
    move_sprite(15, 00, 0);
}

void set_dungeon_map(){
    SWITCH_ROM(2);
    set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles);
    SWITCH_ROM(1);
}

void set_room(Coords coord){
    uint8_t door = doors[coord.x][coord.y];
    const unsigned char* room_ptr;
    set_room_tiles(door, room_ptr, coord);
    hide_door();
    if (dungeon[coord.x][coord.y] == 'K') {
        if (key_obtained == 0){
            set_bkg_tiles(8, 6, 4, 2, chest_closed);
        }
        else {
            set_bkg_tiles(8, 6, 4, 2, chest_opened);
        }
    }
    else if (dungeon[coord.x][coord.y] == 'L') {
        if (lock_opened == 0) {
            switch (locked_door) {
                case 1:
                    draw_lock_v(72, 16);
                    break;
                case 2:
                    draw_lock_h(152, 80);
                    break;
                case 4:
                    draw_flip_lock_v(72, 144);
                    break;
                case 8:
                    draw_flip_lock_h(8, 80);
                    break;
            }
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
    else if (dungeon[coord.x][coord.y] == 'E' && current_floor % 5 != 0) {
        set_bkg_tiles(2, 2, 2, 2, stairs);
    }
    // spawna nemici
    spawn_enemies_in_room(coord.x, coord.y, current_enemies);
    if (dungeon[coord.x][coord.y] != 'E') {
        set_enemy_sprite();
    }
    else if (current_floor % 5 == 0 && boss_floor_defeated == 0) {
        boss_battle = 1;
        spawn_boss(&boss);
        smooth_movement(last_direction);
        SWITCH_ROM(2);
        for (uint16_t i; i<360; i++) {
            current_room[i] = NoExit[i];
        }
        set_bkg_tiles(0, 0, 20, 18, current_room);
        SWITCH_ROM(1);
    }
    clear_drops();
    DISPLAY_ON;
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
        set_sprite_tile(6, 2);
        set_sprite_tile(7, 3);
        set_room(player_coords);
    }
    else if (y < 8) {
        player_coords.y--;
        y = 144;
        set_room(player_coords);
    }
    move_character();
}


void check_open_menu() {
    current_joypad = joypad();
    if ((current_joypad & J_START) && !(last_joypad & J_START)) {
        if (menu_opened == 0){
            DISPLAY_OFF;
            move_win(7, 0);
            set_win_tiles(0, 0, 20, 18, gui_map);
            set_stats();
            HIDE_SPRITES;
            DISPLAY_ON;
            menu_opened = 1;
        }
        else if (menu_opened == 1) {
            DISPLAY_OFF;
            move_win(7, 136);
            set_mini_menu();
            
            SHOW_SPRITES;
            menu_opened = 0;
            DISPLAY_ON;
        }
    }
    if ((current_joypad & J_SELECT) && !(last_joypad & J_SELECT)) {
        if (menu_opened == 0){
            DISPLAY_OFF;
            move_win(7, 0);
            SWITCH_ROM(3);
            set_win_tiles(0, 0, 20, 18, map_menu);
            SWITCH_ROM(1);
            set_map_menu();
            map_option = 0;
            set_win_tiles(2, 4, 1, 1, &arrow_tile);
            HIDE_SPRITES;
            menu_opened = 5;
            DISPLAY_ON;
        }
        else if (menu_opened == 5) {
            DISPLAY_OFF;
            move_win(7, 136);
            set_mini_menu();
            
            SHOW_SPRITES;
            menu_opened = 0;
            DISPLAY_ON;
        }
    }
    last_joypad = current_joypad;
}


void go_into_dungeon() {
    wait_vbl_done();
    DISPLAY_OFF;
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
    player_coords.x = 2;
    player_coords.y = 2;
    set_room(start);
    if (max_floor == 0) {
        max_floor = 1;
    }
}

void go_next_floor() {
    current_floor++;
    if (current_floor % 5 == 0) {
        boss.defeated = 1;
        boss_floor_defeated = 0;
    }
    if (current_floor > max_floor) {
        max_floor = current_floor;
    }
    key_obtained = 0;
    treasure_obtained = 0;
    lock_opened = 0;
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






void set_textbox(uint8_t item) {
    menu_opened = 4;
    move_win(7, 104);
    if (item == 1) {
        move_sprite(33, x, y-32);
        move_sprite(34, x+8, y-32);
        set_win_tiles(0, 0, 20, 5, obtained_key);
    }
    else if (item == 2) {
        move_sprite(35, x, y-32);
        move_sprite(36, x+8, y-32);
        move_sprite(37, x, y-24);
        move_sprite(38, x+8, y-24);
        set_win_tiles(0, 0, 20, 5, obtained_mythril);
    }
    else if (item == 3) {
        HIDE_SPRITES;
        set_win_tiles(0, 0, 20, 5, boss_defeated);
    }

    wait_vbl_done();
    
    while(!(joypad() & (J_A))) {
        wait_vbl_done();
    }
    
    while(joypad() & (J_A)) {
        wait_vbl_done();
    }

    move_sprite(33, 0, 0);
    move_sprite(34, 0, 0);
    move_sprite(35, 0, 0);
    move_sprite(36, 0, 0);
    move_sprite(37, 0, 0);
    move_sprite(38, 0, 0);
    menu_opened = 0;
    SHOW_SPRITES;
    set_mini_menu();
}



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
            boss_death(&boss);
            boss_floor_defeated = 1;
            boss_battle = 0;
            enemies_defeated++;
            experience += boss.exp_reward;
            minerals+=2;
            menu_opened = 4;
            current_song_bank = 3;
            SWITCH_ROM(3);
            hUGE_init(&boss_defeated_jingle);
            SWITCH_ROM(1);
            set_textbox(3);
            uint8_t door = doors[player_coords.x][player_coords.y];
            const unsigned char* room_ptr;
            set_room_tiles(door, room_ptr, player_coords);
            set_bkg_tiles(2, 2, 2, 2, stairs);
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
        enemy_death_sfx();
        enemy_death(&current_enemies[index]);
        enemies_defeated++;
        experience += current_enemies[index].exp_reward;
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
        if (arrow_x < 1 || arrow_x > 168 || arrow_y > 144 || arrow_y < 8) {
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
    show_number(heal, 1, 0, 0);
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
    set_character_sprite(dir);
    
    while (frame < 8) {
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
                mov_y-=2;
                break;
            case 2:
                mov_x+=2;
                break;
            case 4:
                mov_y+=2;
                break;
            case 8:
                mov_x-=2;
                break;
        }
        move_sprite(4, mov_x, mov_y);
        move_sprite(5, mov_x+8, mov_y);
        move_sprite(6, mov_x, mov_y + 8);
        move_sprite(7, mov_x + 8, mov_y + 8);
        frame++;
    }
    
}





void check_time() {
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

void set_enemy_sprite() {
    switch (current_enemies[0].type) {
        case 1:
            set_sprite_data(90, 4, LarvaOscura);
            break;
        case 2:
            set_sprite_data(90, 4, Trisguardo);
            break;
        case 3:
            set_sprite_data(90, 4, PredatoreOmbra);
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
            set_sprite_data(94, 4, PredatoreOmbra);
            break;
    }
    set_enemy_tiles();
    return;
}


