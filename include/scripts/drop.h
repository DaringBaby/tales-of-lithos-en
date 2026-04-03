#ifndef DROP_H
#define DROP_H

#include <gb/gb.h>
#include "player_vars.h"

typedef struct {
    uint8_t drop_type;
    uint8_t x;
    uint8_t y;
} Drop;

void spawn_drop(uint8_t x, uint8_t y);
void clear_drops();
void check_drops(uint8_t x, uint8_t y);

extern Drop drops[2];

#endif
