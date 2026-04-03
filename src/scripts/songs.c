#include "scripts/songs.h"

void play_song(uint8_t song_id) {
    switch (song_id) {
        case 0:         // gameover jingle
            current_song_bank = 3;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&gameover_jingle);
            break;
        case 1:         // boss defeated jingle
            current_song_bank = 3;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&boss_defeated_jingle);
            break;
        case 2:         // item found jingle
            current_song_bank = 1;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&item_found);
            break;
        case 3:         // dungeon song
            current_song_bank = 4;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&dungeon_theme);
            break;
        case 4:         // boss theme
            current_song_bank = 4;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&boss_theme);
            break;
        case 5:         // camp theme
            current_song_bank = 5;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&camp_theme);
            break;
        case 6:         // intro theme
            current_song_bank = 5;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&intro_theme);
            break;
        case 7:         // ending song
            current_song_bank = 5;
            SWITCH_ROM(current_song_bank);
            hUGE_init(&ending_song);
            break;
    }
    SWITCH_ROM(1);
}
