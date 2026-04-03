#ifndef INIT_H
#define INIT_H

#include <gb/gb.h>
#include "titlescreen.h"
#include "sound.h"
#include "songs.h"
#include "intro.h"
#include "gui.h"
#include "insert_name.h"
#include "maps.h"
#include "utils.h"

void game_init();

void set_title_data();
void set_game_sprites();
void set_game_gui();
extern const unsigned char blank[16];
extern const unsigned char black[16];

extern uint8_t load_game() BANKED;

#endif
