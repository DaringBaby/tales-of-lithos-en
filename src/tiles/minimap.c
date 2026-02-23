#pragma bank 3

#include "minimap.h"
#include <gb/gb.h>

#define WHITESPACE 175
#define OFFSET_UI 179
#define TOPLEFT     (OFFSET_UI + 0)
#define TOP         (OFFSET_UI + 1)
#define TOPRIGHT    (OFFSET_UI + 2)
#define RIGHT       (OFFSET_UI + 3)
#define BOTTOMRIGHT (OFFSET_UI + 4)
#define BOTTOM      (OFFSET_UI + 5)
#define BOTTOMLEFT  (OFFSET_UI + 6)
#define LEFT        (OFFSET_UI + 7)
#define BODY        (OFFSET_UI + 8)



const unsigned char Minimap[] =
{
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x81,
  0xFF,0x81,0xFF,0x81,0xFF,0x81,0xFF,0xFF,
  0xFF,0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x80,
  0xFF,0x80,0xFF,0x81,0xFF,0x81,0xFF,0xFF,
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x80,
  0xFF,0x80,0xFF,0x81,0xFF,0x81,0xFF,0xFF,
  0xFF,0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x81,
  0xFF,0x81,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x81,
  0xFF,0x81,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x80,
  0xFF,0x80,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x80,
  0xFF,0x80,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x01,
  0xFF,0x01,0xFF,0x81,0xFF,0x81,0xFF,0xFF,
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x01,
  0xFF,0x01,0xFF,0x81,0xFF,0x81,0xFF,0xFF,
  0xFF,0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x00,
  0xFF,0x00,0xFF,0x81,0xFF,0x81,0xFF,0xFF,
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x00,
  0xFF,0x00,0xFF,0x81,0xFF,0x81,0xFF,0xFF,
  0xFF,0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x01,
  0xFF,0x01,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x01,
  0xFF,0x01,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x00,
  0xFF,0x00,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xE7,0xFF,0x81,0xFF,0x81,0xFF,0x00,
  0xFF,0x00,0xFF,0x81,0xFF,0x81,0xFF,0xE7,
  0xFF,0xFF,0x81,0xFF,0x81,0xFF,0x81,0xFF,
  0x81,0xFF,0x81,0xFF,0x81,0xFF,0xFF,0xFF,
  0xFF,0x00,0xE7,0x00,0xDB,0x00,0xA5,0x00,
  0xA5,0x00,0xDB,0x00,0xE7,0x00,0xFF,0x00
};

const unsigned char map_menu[] = {
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   164,   164,   140,   132,   141,   148,   164,   164,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   130,    142,    141,    147,    136,    141,    148,    128,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,    BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   146,    147,    128,    147,    136,    146,    147,    136,    130,    135,    132,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   132,    146,    130,    136,    BODY,   BODY,   BODY,   BODY,   BODY,   TOPLEFT,   TOP,   TOP,   TOP,   TOP,   TOPRIGHT,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   LEFT,   123,   123,   123,   123,   RIGHT,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   LEFT,   123,   123,   123,   123,   RIGHT,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   LEFT,   123,   123,   123,   123,   RIGHT,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   LEFT,   123,   123,   123,   123,   RIGHT,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BOTTOMLEFT,   BOTTOM,   BOTTOM,   BOTTOM,   BOTTOM,   BOTTOMRIGHT,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char stats_menu[] = {
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   141,    132,    140,    136,    130,    136,    WHITESPACE,     146,    130,    142,    141,    133,    166,    177,   BODY,   BODY,   BODY,    RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,    BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   143,    136,    128,    141,    142,    WHITESPACE,140,  128,    146,    146,    136,    140,    142,   177,   BODY,   BODY,     BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   143,    142,    147,    166,    WHITESPACE,142, 147,    147,    132,    141,    148,    147,    136,    177,   BODY,   BODY,   BODY,    RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   147,    132,    140,    143,    142,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};


void set_map_menu() BANKED {
    uint8_t p_pos = 124;
    if (current_location == 1) {
        for (uint8_t i = 0; i<4; i++) {
            for (uint8_t j = 0; j<4; j++) {
                if (doors[i][j] == 0) {
                    map[j][i] = 123;
                }
                else {
                    map[j][i] = 107 + doors[i][j];
                }
            }
        }
    }
    set_win_tiles(13, 11, 4, 4, (uint8_t *)map);
    if (current_location == 1) {
        set_win_tiles(13+player_coords.x, 11+player_coords.y, 1, 1, &p_pos);
    }   
}

void empty_map_tiles() BANKED {
  for (uint8_t i=0; i<4; i++) {
        for (uint8_t j = 0; j<4; j++) {
            map[i][j] = 123;
        }
    }
}

/* End of MINIMAP.C */


