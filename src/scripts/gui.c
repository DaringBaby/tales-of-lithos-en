#include <gb/gb.h>
#include "gui.h"
/* GUI TILES */
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

/* SYMBOLS TILES */
#define OFFSET_CHAR 128
#define SWORD_LV 169
#define SHIELD_LV 170
#define ARROW_LV 171
#define QUIVER_LV 172
#define NUM_POT_LV 173
#define HEALING_LV 174
#define MYTHRIL 178
#define WHITESPACE 175
#define ZERO 154


const unsigned char gui_map[] = {
    TOPLEFT,  TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOP,    TOPRIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   164,   164,   140,   132,   141,   148,   164,   164,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   188,   189,   190,   191,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   192,   193,   194,   195,   BODY,   141,   128,   140,   132,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   196,   197,   198,   199,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   200,   201,   202,   203,   BODY,   135,   143,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   128,   147,   147,   128,   130,   138,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   131,   132,   133,   132,   141,   146,   132,   177,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   SWORD_LV,   BODY,   BODY,   BODY,   BODY,   QUIVER_LV,   BODY,   BODY,   BODY,   BODY,   139,   149,   166,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   SHIELD_LV,   BODY,   BODY,   BODY,   BODY,   NUM_POT_LV,   BODY,   BODY,   BODY,   BODY,   132,   146,   146,   177,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    LEFT,     BODY,   ARROW_LV,   BODY,   BODY,   BODY,   BODY,   HEALING_LV,   BODY,   BODY,   BODY,   BODY,   MYTHRIL,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   RIGHT,
    BOTTOMLEFT, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOM, BOTTOMRIGHT
};

const unsigned char mini_gui[] = {
    135, 143,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   BODY,   220,   BODY,   BODY,   221,   BODY,   BODY,   BODY,   222,   164,   BODY, BODY };
