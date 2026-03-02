#pragma bank 3

#include <gb/gb.h>

void draw_lock_v(uint8_t x, uint8_t y) BANKED {
    set_sprite_tile(25, 51);
    set_sprite_prop(25, 0);
    move_sprite(25, x, y);

    set_sprite_tile(26, 55);
    set_sprite_prop(26, 0);
    move_sprite(26, x, y + 8);

    set_sprite_tile(27, 52);
    set_sprite_prop(27, 0);
    move_sprite(27, x + 8, y);

    set_sprite_tile(28, 56);
    set_sprite_prop(28, 0);
    move_sprite(28, x + 8, y + 8);

    set_sprite_tile(29, 52);
    set_sprite_prop(29, S_FLIPX);
    move_sprite(29, x + 16, y);

    set_sprite_tile(30, 56);
    set_sprite_prop(30, S_FLIPX);
    move_sprite(30, x + 16, y + 8);

    set_sprite_tile(31, 51);
    set_sprite_prop(31, S_FLIPX);
    move_sprite(31, x + 24, y);

    set_sprite_tile(32, 55);
    set_sprite_prop(32, S_FLIPX);
    move_sprite(32, x + 24, y + 8);
}

void draw_flip_lock_v(uint8_t x, uint8_t y) BANKED {
    set_sprite_tile(25, 55);
    set_sprite_prop(25, S_FLIPY);
    move_sprite(25, x, y);

    set_sprite_tile(26, 50);
    set_sprite_prop(26, S_FLIPY);
    move_sprite(26, x, y + 8);

    set_sprite_tile(27, 56);
    set_sprite_prop(27, S_FLIPY);
    move_sprite(27, x + 8, y);

    set_sprite_tile(28, 50);
    set_sprite_prop(28, S_FLIPY);
    move_sprite(28, x + 8, y + 8);

    set_sprite_tile(29, 56);
    set_sprite_prop(29, S_FLIPX | S_FLIPY);
    move_sprite(29, x + 16, y);

    set_sprite_tile(30, 50);
    set_sprite_prop(30, S_FLIPX | S_FLIPY);
    move_sprite(30, x + 16, y + 8);

    set_sprite_tile(31, 55);
    set_sprite_prop(31, S_FLIPX | S_FLIPY);
    move_sprite(31, x + 24, y);

    set_sprite_tile(32, 50);
    set_sprite_prop(32, S_FLIPX | S_FLIPY);
    move_sprite(32, x + 24, y + 8);
}

void draw_lock_h(uint8_t x, uint8_t y) BANKED {
    set_sprite_tile(25, 53);
    set_sprite_prop(25, 0);
    move_sprite(25, x, y);

    set_sprite_tile(26, 54);
    set_sprite_prop(26, 0);
    move_sprite(26, x + 8, y);

    set_sprite_tile(27, 57);
    set_sprite_prop(27, 0);
    move_sprite(27, x, y + 8);

    set_sprite_tile(28, 58);
    set_sprite_prop(28, 0);
    move_sprite(28, x + 8, y + 8);

    move_sprite(29, 0, 0);
    move_sprite(30, 0, 0);
    move_sprite(31, 0, 0);
    move_sprite(32, 0, 0);
}

void draw_flip_lock_h(uint8_t x, uint8_t y) BANKED {
    set_sprite_tile(25, 53);
    set_sprite_prop(25, S_FLIPX);
    move_sprite(25, x + 8, y);

    set_sprite_tile(26, 54);
    set_sprite_prop(26, S_FLIPX);
    move_sprite(26, x, y);

    set_sprite_tile(27, 57);
    set_sprite_prop(27, S_FLIPX);
    move_sprite(27, x + 8, y + 8);

    set_sprite_tile(28, 58);
    set_sprite_prop(28, S_FLIPX);
    move_sprite(28, x, y + 8);

    move_sprite(29, 0, 0);
    move_sprite(30, 0, 0);
    move_sprite(31, 0, 0);
    move_sprite(32, 0, 0);
}