#include <gb/gb.h>
#include <rand.h>
#include <stdio.h>
#include "generate_dungeon.h"


const uint8_t min_length = 6;
const uint8_t max_length = 10;
char dungeon[4][4];
uint8_t doors[4][4];

uint8_t locked_door;
uint16_t current_seed = 3;

#define NORD 1
#define EST 2
#define SUD 4
#define OVEST 8



void generate_dungeon(uint8_t current_floor) {
    wait_vbl_done();
    DISPLAY_OFF;
    uint8_t dungeon_complete = 0;
    uint8_t floor = current_floor;
    current_seed++;
    while (!dungeon_complete){
        initrand(current_seed); // seed di partenza
        empty_array();
        uint8_t start_x = rand() % 4;
        uint8_t start_y = rand() % 4;
        uint8_t length;
        // per ora, num stanze dipende dal piano
        switch (current_floor % 5) {
            case 1:
                length = 6;
                break;
            case 2:
                length = 7;
                break;
            case 3:
                length = 8;
                break;
            case 4:
                length = 9;
                break;
            case 0:
                length = 10;
                break;
        };
        // crea dungeon, se non riesce a mettere il ramo chiave lo ricrea
        dungeon[start_x][start_y] = 'S';
        if (create_layout(start_x, start_y, length)) {
            uint8_t key = add_branch('A', 'K');
            if (key) {
                dungeon_complete = 1;
                add_branch('B', 'T');
            }
        }
        if (!dungeon_complete) {
            current_seed++;
        }
    }
    wait_vbl_done();
    DISPLAY_ON;
}

void empty_array(){
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            dungeon[i][j] = '0';
            doors[i][j] = 0;
        }
    }
}

uint8_t create_layout(uint8_t curr_x, uint8_t curr_y, uint8_t target_rooms) {
    uint8_t curr_room = 1;
    
    while (curr_room < target_rooms) {
        char directions[4];
        uint8_t num_dirs = 0;
        // direzioni in cui si può creare la stanza
        if (curr_y > 0 && dungeon[curr_x][curr_y - 1] == '0') {
            append(directions, '1', &num_dirs);
        }
        if (curr_x < 3 && dungeon[curr_x+1][curr_y] == '0') {
            append(directions, '2', &num_dirs);
        }
        if (curr_y < 3 && dungeon[curr_x][curr_y+1] == '0') {
            append(directions, '3', &num_dirs);
        }
        if (curr_x > 0 && dungeon[curr_x-1][curr_y] == '0') {
            append(directions, '4', &num_dirs);
        }

        if (num_dirs == 0) {
            return 0;
        }

        // posizione corrente (stanza vecchia)
        uint8_t vx = curr_x;
        uint8_t vy = curr_y;

        // direzione
        uint8_t dir = directions[rand() % num_dirs];

        // creazione porte
        uint8_t current_door;
        switch (dir) {
            case '1':
                curr_y--;
                doors[vx][vy] |= NORD;
                current_door = NORD;
                doors[curr_x][curr_y] |= SUD;
                break;
            case '2':
                curr_x++;
                doors[vx][vy] |= EST;
                current_door = EST;
                doors[curr_x][curr_y] |= OVEST;
                break;
            case '3':
                curr_y++;
                doors[vx][vy] |= SUD;
                current_door = SUD;
                doors[curr_x][curr_y] |= NORD;
                break;
            case '4':
                curr_x--;
                doors[vx][vy] |= OVEST;
                current_door = OVEST;
                doors[curr_x][curr_y] |= EST;
                break;
        }

        curr_room++;

        // tipo stanza
        if (curr_room == target_rooms) {
            dungeon[curr_x][curr_y] = 'E';
        }
        else if (curr_room == (int)(target_rooms / 2) + 1) {
            dungeon[curr_x][curr_y] = 'L';
        }
        else if (curr_room == (int)(target_rooms / 2) + 2) {
            locked_door = current_door;
        }
        else if (curr_room < (int)(target_rooms / 2) + 1) {
            dungeon[curr_x][curr_y] = 'A';
        }
        else if (curr_room > (int) (target_rooms / 2) + 1) {
            dungeon[curr_x][curr_y] = 'B';
        }
    
    }
    return 1;
}


void append(char directions[], char value, uint8_t *num_dirs) {
    if (*num_dirs < 4) {
        directions[*num_dirs] = value;
        (*num_dirs)++;
    }
}

uint8_t add_branch(char zone, char item) {
    Coords possible_starts[16];
    uint8_t starts_count = 0;

    // trova possibili punti iniziali per piazzare il ramo
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            if (item == 'K') {
                if (dungeon[i][j] == zone || dungeon[i][j] == 'S') {
                    possible_starts[starts_count].x = i;
                    possible_starts[starts_count].y = j;
                    starts_count++;
                }
            }
            else if (item == 'T') {
                if (dungeon[i][j] == zone || dungeon[i][j] == 'G') {
                    possible_starts[starts_count].x = i;
                    possible_starts[starts_count].y = j;
                    starts_count++;
                }
            }
        }
    }

    shuffle_starts(possible_starts, starts_count);

    for (uint8_t i=0; i<starts_count; i++) {
        Coords start = possible_starts[i];
        Coords dir_branch = find_near_void_cell(start);
        if (dir_branch.x != 0 || dir_branch.y != 0) {
            uint8_t br_x = start.x + dir_branch.x;
            uint8_t br_y = start.y + dir_branch.y;
            dungeon[br_x][br_y] = zone;
            create_doors(start.x, start.y, br_x, br_y, dir_branch);
            Coords br = {br_x, br_y};
            Coords final_dir = find_near_void_cell(br);
            if (final_dir.x != 0 || final_dir.y != 0) {
                uint8_t obj_x = br_x + final_dir.x;
                uint8_t obj_y = br_y + final_dir.y;
                dungeon[obj_x][obj_y] = item;
                create_doors(br_x, br_y, obj_x, obj_y, final_dir);
                return 1;
            }
        }
    }
    return 0;
}

Coords find_near_void_cell(Coords start) {
    Coords dirs[4] = {{0 , -1}, {1 , 0}, {0 , 1}, {-1 , 0}};
    Coords fail = {0 , 0};

    // shuffle direzioni
    for (uint8_t i = 3; i > 0; i--) {
        uint8_t j = rand() % (i+1);
        Coords temp = dirs[i];
        dirs[i] = dirs[j];
        dirs[j] = temp;
    }

    for (uint8_t i = 0; i < 4; i++) {
        Coords dir = dirs[i];
        uint8_t nx = start.x + dir.x;
        uint8_t ny = start.y + dir.y;
        if (nx >= 0 && nx < 4 && ny >= 0 && ny < 4) {
            if (dungeon[nx][ny] == '0') {
                return dir;
            }
        }
    }
    return fail;
}


void shuffle_starts(Coords possible_starts[], uint8_t starts_count) {
    if (starts_count < 2) {
        return;
    }
    for (uint8_t i = starts_count - 1; i > 0; i--) {
        uint8_t j = rand() % (i+1);
        Coords temp = possible_starts[i];
        possible_starts[i] = possible_starts[j];
        possible_starts[j] = temp;
    }
}

void create_doors(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, Coords dir) {
    if (dir.x == 0 && dir.y == -1) {
        doors[x1][y1] |= NORD;
        doors[x2][y2] |= SUD;
    }
    else if (dir.x == 1 && dir.y == 0) {
        doors[x1][y1] |= EST;
        doors[x2][y2] |= OVEST;
    }
    else if (dir.x == 0 && dir.y == 1) {
        doors[x1][y1] |= SUD;
        doors[x2][y2] |= NORD;
    }
    else if (dir.x == -1 && dir.y == 0) {
        doors[x1][y1] |= OVEST;
        doors[x2][y2] |= EST;
    }
}