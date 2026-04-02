#include "utils.h"

void debug_value(uint8_t value) {
    debug = value;
}

void music_vbl_interrupt() {
    uint8_t bank_precedente = _current_bank;
    SWITCH_ROM(current_song_bank);
    hUGE_dosound();
    SWITCH_ROM(bank_precedente);
}
