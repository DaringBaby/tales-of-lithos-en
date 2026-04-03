#ifndef COMBAT_H
#define COMBAT_H
#include <gb/gb.h>
#include "songs.h"
#include "player_vars.h"
#include "boss.h"
#include "player_utils.h"
#include "play_effects.h"
#include "game_vars.h"
#include "maps.h"


void player_attack(uint8_t wpn, uint8_t index);
void shoot_arrow();
void heal_player();

extern Boss boss;

extern void set_textbox(uint8_t item);
extern void play_ending() BANKED;

#endif
