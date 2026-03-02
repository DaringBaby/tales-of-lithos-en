#ifndef DUNGEON_LOGIC_H
#define DUNGEON_LOGIC_H

#include <gb/gb.h>


typedef struct {
    int8_t x;
    int8_t y;
} Coords;


#define NORD  1
#define EST   2
#define SUD   4
#define OVEST 8


extern char dungeon[4][4];
extern uint8_t doors[4][4];
extern uint8_t room_enemies[4][4];
extern uint8_t obstacles[4][4];
extern uint8_t locked_door;

void generate_dungeon(uint8_t current_floor); 
void empty_array();
uint8_t create_layout(uint8_t curr_x, uint8_t curr_y, uint8_t target_rooms);
void append(char directions[], char value, uint8_t *num_dirs);
uint8_t add_branch(char zone, char item);
Coords find_near_void_cell(Coords start);
void shuffle_starts(Coords possible_starts[], uint8_t starts_count);
void create_doors(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, Coords dir);
void add_obstacles(uint8_t x, uint8_t y);

#endif