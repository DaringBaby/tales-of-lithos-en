#include <gb/gb.h>

typedef struct {
    uint8_t drop_type;
    uint8_t x;
    uint8_t y;
} Drop;

void spawn_drop(uint8_t x, uint8_t y);
void clear_drops();
void check_drops(uint8_t x, uint8_t y);

extern Drop drops[2];
extern uint8_t num_arrows;
extern uint8_t max_num_arrows;
extern uint8_t current_hp;
extern uint8_t max_hp;

