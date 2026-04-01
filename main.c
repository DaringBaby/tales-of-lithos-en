#include <gb/gb.h>
#include <stdio.h>
#include "src/songs/hUGEDriver.h"
#include "src/tiles/character.h"
#include "src/tiles/CampTiles.h"
#include "src/maps/CampMap.h"
#include "src/maps/TutorialMap.h"
#include "src/tiles/Hector.h"
#include "src/tiles/Safy.h"
#include "src/tiles/DungeonTiles.h"
#include "src/tiles/DungeonTiles2.h"
#include "src/tiles/DungeonTiles3.h"
#include "src/tiles/DungeonTiles4.h"
#include "src/tiles/DungeonTiles5.h"
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
#include "src/scripts/intro.h"
#include "src/scripts/drop.h"
#include "src/scripts/locked_doors.h"
#include "src/scripts/sound.h"
#include "src/scripts/dungeon_management.h"
#include "src/scripts/ending_sequence.h"
#include "src/scripts/save_manager.h"
#include "src/scripts/play_effects.h"
#include "src/scripts/movement.h"
#include "src/scripts/actions.h"
#include "src/scripts/player_vars.h"
#include "src/scripts/game_vars.h"
#include "src/scripts/songs.h"

/* PROTOTYPES */
uint8_t check_terrain(uint8_t new_x, uint8_t new_y);
uint8_t is_sprite_at(uint8_t target_x, uint8_t target_y);
void set_camp_map();
void set_dungeon_map();
void set_room(Coords coord);
void change_room();
void check_open_menu();
void clean_window();
void go_into_dungeon();
void hide_camp_sprites();
void go_next_floor();
void set_textbox(uint8_t item);
void player_attack(uint8_t wpn, uint8_t index);
void shoot_arrow();
void music_vbl_interrupt();
void return_to_camp();
void set_tutorial();
void debug_value(uint8_t value);


const unsigned char blank[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
const unsigned char black[16] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
const uint8_t chest_closed[] = {225, 226, 227, 228, 229, 230, 231, 232};
const uint8_t chest_opened[] = {233, 234, 235, 236, 237, 238, 239, 240};
const uint8_t stairs[] = {241, 242, 243, 244};

const uint8_t menu_body[] = {187};
const uint8_t arrow_tile = 245;


unsigned char current_room[360];


/* BANK 2 VARIABLES*/
extern const unsigned char CampTiles[];
extern const unsigned char Camp[];
extern const unsigned char Text[];
extern const unsigned char MiniGUI[];
extern const unsigned char Minimap[];
extern const unsigned char TutorialMap[];
extern const unsigned char map_menu[];
extern const unsigned char camp_collisions[];
extern const unsigned char DungeonTiles[];
extern const unsigned char DungeonTiles2[];
extern const unsigned char DungeonTiles3[];
extern const unsigned char DungeonTiles4[];
extern const unsigned char DungeonTiles5[];
extern const unsigned char Titlescreen[];
extern const unsigned char TitleText[];
extern const unsigned char Title[];
extern const unsigned char NoExit[];
extern char dungeon[4][4];
extern uint8_t doors[4][4];
extern uint8_t room_enemies[4][4];
extern uint8_t obstacles[4][4];
extern uint8_t locked_door;



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

        __critical {
    add_VBL(music_vbl_interrupt);
}

    current_song_bank = 5;
    SWITCH_ROM(current_song_bank);
    hUGE_init(&intro_theme);
    SWITCH_ROM(1);
    DISPLAY_ON;
    ng = set_titlescreen();
    start_sfx();

    if (ng) {
        start_intro();
    }

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
    set_bkg_data(220, 4, MiniGUI);
    SWITCH_ROM(1);
    set_bkg_data(225, 20, Objects);
    set_bkg_data(245, 1, arrow);
    set_bkg_data(246, 1, black);

    if (!load_game()) {
        insert_name();
    }

    set_sprite_data(4, 4, MC_up);

    if (current_location == 0){
        set_camp_map();
    }

    else {
        go_into_dungeon();
    }
    if (ng) { // tutorial
        set_tutorial();
    }

    move_win(7, 136);
    set_mini_menu();

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

        if (returning_to_camp) {
            returning_to_camp = 0;
            return_to_camp();
        }
        check_time();
        wait_vbl_done();
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
    current_song_bank = 5;
    SWITCH_ROM(current_song_bank);
    hUGE_init(&camp_theme);
    SWITCH_ROM(1);
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
    if (current_floor <= 5) {
        SWITCH_ROM(2);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles);
    }
    else if (current_floor <= 10) {
        SWITCH_ROM(2);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles2);
    }
    else if (current_floor <= 15) {
        SWITCH_ROM(5);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles3);
    }
    else if (current_floor <= 20) {
        SWITCH_ROM(5);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles4);
    }
    else {
        SWITCH_ROM(5);
        set_bkg_data(0, 53, (const unsigned char *)(uint16_t)DungeonTiles5);
    }
    SWITCH_ROM(1);
}

void set_room(Coords coord){
    set_dungeon_map();
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
    clear_drops();
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
        current_song_bank = 4;
        SWITCH_ROM(current_song_bank);
        hUGE_init(&boss_theme);
        SWITCH_ROM(1);
    }
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
    if (item == 0) {
        set_win_tiles(0, 0, 20, 5, game_saved);
    }
    else if (item == 1) {
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
                current_song_bank = 3;
                SWITCH_ROM(3);
                hUGE_init(&boss_defeated_jingle);
                SWITCH_ROM(1);
                set_textbox(3);
                uint8_t door = doors[player_coords.x][player_coords.y];
                const unsigned char* room_ptr;
                set_room_tiles(door, room_ptr, player_coords);
                set_bkg_tiles(2, 2, 2, 2, stairs);
                current_song_bank = 4;
                SWITCH_ROM(current_song_bank);
                hUGE_init(&dungeon_theme);
                SWITCH_ROM(1);
            }
            else {
                current_song_bank = 5;
                SWITCH_ROM(current_song_bank);
                hUGE_init(&ending_song);
                SWITCH_ROM(1);
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



void music_vbl_interrupt() {
    uint8_t bank_precedente = _current_bank;
    SWITCH_ROM(current_song_bank);
    hUGE_dosound();
    SWITCH_ROM(bank_precedente);
}

void return_to_camp() {
    menu_opened = 0;
    current_song_bank = 3;
    SWITCH_ROM(current_song_bank);
    hUGE_init(&gameover_jingle);
    SWITCH_ROM(1);
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
    return;
}

void set_tutorial() {
        move_win(7,0);
        move_sprite(4, 0, 0);
        move_sprite(8, 24, 40);
        move_sprite(9, 32, 40);
        move_sprite(10, 24, 48);
        move_sprite(11, 32, 48);
        move_sprite(12, 24, 80);
        move_sprite(13, 32, 80);
        move_sprite(14, 24, 88);
        move_sprite(15, 32, 88);
        SWITCH_ROM(3);
        set_win_tiles(0, 0, 20, 18, TutorialMap);
        SHOW_SPRITES;
        SHOW_WIN;
        while (1) {
            if (joypad() & J_A) {
                move_sprite(8, 40, 64);
                move_sprite(9, 48, 64);
                move_sprite(10, 40, 72);
                move_sprite(11, 48, 72);
                move_sprite(12, 120, 64);
                move_sprite(13, 128, 64);
                move_sprite(14, 120, 72);
                move_sprite(15, 128, 72);
                return;
            }
        }
}

void debug_value(uint8_t value) {
    debug = value;
}
