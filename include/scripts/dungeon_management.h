#ifndef DUNGEON_MANAGEMENT_H
#define DUNGEON_MANAGEMENT_H
#include <gb/gb.h>

void assign_obstacles(uint8_t x, uint8_t y) BANKED;
void put_on_room(unsigned char *obstacle, uint8_t x, uint8_t y, uint8_t size) BANKED;
void set_room_tiles(uint8_t door, const unsigned char* room_ptr, Coords coord) BANKED;
extern unsigned char current_room[360];
extern char dungeon[4][4];

#endif
