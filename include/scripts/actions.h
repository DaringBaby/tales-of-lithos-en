#ifndef ACTIONS_H
#define ACTIONS_H

#include <gb/gb.h>
#include "enemy.h"
#include "boss.h"
#include "player_vars.h"
#include "game_vars.h"
#include "songs.h"

void check_input_keys();
void open_chest(uint8_t type);
void open_npc_menu(uint8_t npc_id);

extern char dungeon[4][4];
extern const uint8_t chest_opened[];
extern const unsigned char hector_menu[];
extern const unsigned char safy_menu[];
extern const uint8_t arrow_tile;
extern Enemy current_enemies[2];
extern Boss boss;

extern void hide_door() BANKED;
extern void shoot_arrow();
extern void move_enemy(Enemy *e);
extern void move_boss(Boss *boss) BANKED;
extern void set_textbox(uint8_t item);
extern void save_game() BANKED;
extern void heal_player();

#endif
