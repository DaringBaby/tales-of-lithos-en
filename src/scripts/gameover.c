#pragma bank 1

#include "gameover.h"
#include <gb/gb.h>
#include "../tiles/GameOverText.h"
#include "../maps/GameOver.h"

void game_over() BANKED {
    enemy_death(&enemy);
    HIDE_WIN;
    HIDE_SPRITES;
    black_spiral();
    DISPLAY_OFF;
    delay(500);
    uint8_t obt_m[2];
    uint8_t obt_e[3];
    obt_m[0] = obt_mythril / 10 + 26;
    obt_m[1] = obt_mythril % 10 + 26;
    obt_e[0] = obt_exp / 100 + 26;
    obt_e[1] = obt_exp % 100 / 10 + 26;
    obt_e[2] = obt_exp % 10 + 26;
    set_bkg_data(0, 50, GameOverText);
    set_bkg_tiles(0, 0, 20, 18, GameOver);
    set_bkg_tiles(16, 8, 3, 1, obt_e);
    set_bkg_tiles(17, 10, 2, 1, obt_m);
    DISPLAY_ON;
    uint8_t respawn = 0;
    while (!respawn) {
        if (joypad() & J_START) {
            respawn = 1;
        }
    }
    DISPLAY_OFF;

    SHOW_SPRITES;
    current_location = 0;
    current_hp = max_hp;
    num_arrows = max_num_arrows;
    heals = max_heals;
    
    return;
}

void black_spiral() {
    int8_t top = 0;
    int8_t bottom = 17;
    int8_t left = 0;
    int8_t right = 19;
    uint8_t black = 246;
    while (top <= bottom && left <= right) {
        for (int8_t i = left; i <= right; i++) {
            set_bkg_tiles(i, top, 1, 1, &black);
            delay(5);
        }
        top++;

        for (int8_t i = top; i <= bottom; i++) {
            set_bkg_tiles(right, i, 1, 1, &black);
            delay(5);
        }
        right--;

        if (top <= bottom) {
            for (int8_t i = right; i >= left; i--) {
                set_bkg_tiles(i, bottom, 1, 1, &black);
                delay(5);
            }
            bottom--;
        }

        if (left <= right) {
            for (int8_t i = bottom; i >= top; i--) {
                set_bkg_tiles(left, i, 1, 1, &black);
                delay(5);
            }
            left++;
        }
    }
}

