#include <gb/gb.h>
#include "../scripts/songs.h"
#include "game_vars.h"
#include "player_vars.h"
#include "locked_doors.h"
#include "enemy.h"
#include "boss.h"
#include "movement.h"

void set_camp_map();
void hide_camp_sprites();
void set_dungeon_map();
void set_room(Coords coord);
void change_room();
void return_to_camp();
void go_into_dungeon();
void go_next_floor();

extern uint8_t doors[4][4];
extern const uint8_t chest_closed[];
extern const uint8_t chest_opened[];
extern const uint8_t stairs[];

extern Boss boss;

extern void empty_map_tiles() BANKED;
extern void set_room_tiles(uint8_t door, const unsigned char* room_ptr, Coords coord) BANKED;
extern void hide_door() BANKED;
extern void spawn_enemies_in_room(uint8_t i, uint8_t j, Enemy *enemies) BANKED;
extern void spawn_boss(Boss *boss) BANKED;
extern void set_enemy_sprite() BANKED;
extern void clear_drops();
