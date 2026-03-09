#include <gb/gb.h>
#include "../maps/Dungeon.h"

void assign_obstacles(uint8_t x, uint8_t y) BANKED;
void put_on_room(unsigned char *obstacle, uint8_t x, uint8_t y, uint8_t size) BANKED;
void set_room_tiles(uint8_t door, const unsigned char* room_ptr, Coords coord) BANKED;
extern unsigned char current_room[360];

/* ROOMS */
extern const unsigned char room1[];
extern const unsigned char room2[];
extern const unsigned char room3[];
extern const unsigned char room4[];
extern const unsigned char room5[];
extern const unsigned char room6[];
extern const unsigned char room7[];
extern const unsigned char room8[];
extern const unsigned char room9[];
extern const unsigned char room10[];
extern const unsigned char room11[];
extern const unsigned char room12[];
extern const unsigned char room13[];
extern const unsigned char room14[];
extern const unsigned char room15[];