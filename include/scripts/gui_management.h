#ifndef GUI_MANAGEMENT_H
#define GUI_MANAGEMENT_H

#include "player_vars.h"
#include "game_vars.h"

void check_map_options() BANKED;
void check_map_menu_input() BANKED;
void show_time() BANKED;
void check_menu_options(uint8_t chara) BANKED;
void safy_upgrades();
void hector_upgrades();
void set_stats() BANKED;
void set_mini_menu() BANKED;
void show_number(uint8_t damage, uint8_t mode, uint8_t target, uint8_t index) BANKED;
void print_debug(uint8_t value) BANKED;


extern void check_time() BANKED;
extern uint8_t debug;
extern const unsigned char mini_gui[];
extern const uint8_t menu_body[];
extern const uint8_t arrow_tile;
extern uint8_t returning_to_camp;

#endif
