#include "../songs/hUGEDriver.h"
#include <gb/gb.h>

void play_song(uint8_t song_id);



extern const hUGESong_t gameover_jingle;            // 0
extern const hUGESong_t boss_defeated_jingle;       // 1
extern const hUGESong_t item_found;                 // 2
extern const hUGESong_t dungeon_theme;              // 3
extern const hUGESong_t boss_theme;                 // 4
extern const hUGESong_t camp_theme;                 // 5
extern const hUGESong_t intro_theme;                // 6
extern const hUGESong_t ending_song;                // 7
extern uint8_t current_song_bank;

extern void init_sound() BANKED;
extern void arrow_sfx() BANKED;
extern void hit_sfx() BANKED;
extern void heal_sfx() BANKED;
extern void stairs_sfx() BANKED;
extern void unlock_sfx() BANKED;
extern void start_sfx() BANKED;
extern void death_sfx() BANKED;
extern void enemy_death_sfx() BANKED;
