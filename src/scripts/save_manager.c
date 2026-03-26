#pragma bank 1

#include "save_manager.h"
#include <gb/gb.h>
__at(0xA000) SaveSlot sram_data;

uint8_t load_game() BANKED {
    if (ng) {
        return 0;
    }
    ENABLE_RAM;
    SWITCH_RAM(0);

    if (sram_data.check == 0x54F1) {
        for(uint8_t i = 0; i < 5; i++) {
            player_name[i] = sram_data.player_name[i];
        }
        /* STARK STATS */
        max_hp = sram_data.max_hp;
        current_hp = sram_data.current_hp;
        attack = sram_data.attack;
        defense = sram_data.defense;
        level = sram_data.level;
        experience = sram_data.experience;

        /* POWER UPS */
        sword_lvl = sram_data.sword_lvl;
        shield_lvl = sram_data.shield_lvl;
        arrow_lvl = sram_data.arrow_lvl;
        quiver_lvl = sram_data.quiver_lvl;
        potion_quant_lvl = sram_data.potion_quant_lvl;
        potion_heal_lvl = sram_data.potion_heal_lvl;

        /* NUMBER OF ITEMS */
        max_heals = sram_data.max_heals;
        heals = sram_data.heals;
        heal_quantity = sram_data.heal_quantity;
        arrow_damage = sram_data.arrow_damage;
        num_arrows = sram_data.num_arrows;
        max_num_arrows = sram_data.max_num_arrows;
        minerals = sram_data.minerals;

        /* GAME STATS */
        frames = sram_data.frames;
        seconds = sram_data.seconds;
        minutes = sram_data.minutes;
        hours = sram_data.hours;
        enemies_defeated = sram_data.enemies_defeated;
        max_floor = sram_data.max_floor;
        power_ups = sram_data.power_ups;
        DISABLE_RAM;
        return 1;
    }
    DISABLE_RAM;
    return 0;
}

void save_game() BANKED {
    ENABLE_RAM;
    SWITCH_RAM(0);

    sram_data.check = 0x54F1;

    /* 2. STARK STATS */
    for(uint8_t i = 0; i < 5; i++) {
        sram_data.player_name[i] = player_name[i];
    }
    sram_data.max_hp = max_hp;
    sram_data.current_hp = current_hp;
    sram_data.attack = attack;
    sram_data.defense = defense;
    sram_data.level = level;
    sram_data.experience = experience;

    /* 3. POWER UPS */
    sram_data.sword_lvl = sword_lvl;
    sram_data.shield_lvl = shield_lvl;
    sram_data.arrow_lvl = arrow_lvl;
    sram_data.quiver_lvl = quiver_lvl;
    sram_data.potion_quant_lvl = potion_quant_lvl;
    sram_data.potion_heal_lvl = potion_heal_lvl;

    /* 4. ITEMS & RESOURCES */
    sram_data.max_heals = max_heals;
    sram_data.heals = heals;
    sram_data.heal_quantity = heal_quantity;
    sram_data.arrow_damage = arrow_damage;
    sram_data.num_arrows = num_arrows;
    sram_data.max_num_arrows = max_num_arrows;
    sram_data.minerals = minerals;

    /* 5. GAME STATS */
    sram_data.frames = frames;
    sram_data.seconds = seconds;
    sram_data.minutes = minutes;
    sram_data.hours = hours;
    sram_data.enemies_defeated = enemies_defeated;
    sram_data.max_floor = max_floor;
    sram_data.power_ups = power_ups;

    DISABLE_RAM;
}
