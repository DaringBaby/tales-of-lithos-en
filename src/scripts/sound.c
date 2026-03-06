#pragma bank 3
#include <gb/gb.h>

void init_sound() BANKED {
    NR52_REG = 0x80;
    NR51_REG = 0xFF;
    NR50_REG = 0x77;
}

void arrow_sfx() BANKED {
    NR10_REG = 0x1E;
    NR11_REG = 0x41;
    NR12_REG = 0x73;
    NR13_REG = 0x00;
    NR14_REG = 0x86;
}

void hit_sfx() BANKED {
    NR41_REG = 0x1F;
    NR42_REG = 0xA1;
    NR43_REG = 0x51;
    NR44_REG = 0xC0;
}

void heal_sfx() BANKED {
    NR10_REG = 0x74; 
    NR11_REG = 0x87; 
    NR12_REG = 0x44; 
    NR13_REG = 0x73; 
    NR14_REG = 0x86;
}

void stairs_sfx() BANKED {
    NR41_REG = 0x1E; 
    NR42_REG = 0xA1; 
    NR43_REG = 0x33; 
    NR44_REG = 0xC0;
    delay(200);
    NR41_REG = 0x1E; 
    NR42_REG = 0xA1; 
    NR43_REG = 0x32; 
    NR44_REG = 0xC0;
}

void unlock_sfx() BANKED {
    NR41_REG = 0x14; 
    NR42_REG = 0x81; 
    NR43_REG = 0x34; 
    NR44_REG = 0xC0;
}

void start_sfx() BANKED {
    NR10_REG = 0x65;
    NR11_REG = 0x84;
    NR12_REG = 0x54;
    NR13_REG = 0x72;
    NR14_REG = 0xC6;
}

void death_sfx() BANKED {
    NR10_REG = 0x7C;
    NR11_REG = 0x87;
    NR12_REG = 0x44;
    NR13_REG = 0x73;
    NR14_REG = 0x86;
}

void enemy_death_sfx() BANKED {
    NR41_REG = 0x01; 
    NR42_REG = 0xA2; 
    NR43_REG = 0x47; 
    NR44_REG = 0xC0;
}
