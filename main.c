#include <gb/gb.h>
#include "src/scripts/init.h"
#include "src/scripts/actions.h"

const uint8_t stairs[] = {241, 242, 243, 244};
const uint8_t menu_body[] = {187};
const uint8_t arrow_tile = 245;
unsigned char current_room[360];


void main(void) {
    game_init();
    DISPLAY_ON;


    while(1) {
        check_open_menu();
        if (menu_opened == 0){
            check_input_movement();
            check_input_keys();
            set_mini_menu();
            change_room();
        }
        else if (menu_opened == 2) {
            check_menu_options(0);
        }
        else if (menu_opened == 3) {
            check_menu_options(1);
        }
        else if (menu_opened == 4) {
            // void
        }
        else if (menu_opened == 5) {
            check_map_options();
        }
        else if (menu_opened == 6) {
            if (joypad() & J_A || joypad() & J_B) {
                DISPLAY_OFF;
                move_win(7, 136);
                menu_opened = 0;
                set_mini_menu();
                SHOW_SPRITES;
                DISPLAY_ON;
                delay(300);
            }
            show_time();
        }

        if (returning_to_camp) {
            returning_to_camp = 0;
            return_to_camp();
        }
        check_time();
        wait_vbl_done();
    }
}
