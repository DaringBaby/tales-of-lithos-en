#pragma bank 6

#include <gb/gb.h>

#define TL1 227
#define T1 228
#define TR1 229
#define R1 230
#define DR1 231
#define D1 232
#define DL1 233
#define L1 234

// riga vuota
const unsigned char line_empty[] = {9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9};
// once upon a time,
const unsigned char line1[] = {209, 208, 197, 199, 12, 215, 210, 209, 208, 12, 195, 12, 214, 203, 207, 199, 221, 12};

// lithos was a
const unsigned char line2[] = {206, 203, 214, 202, 209, 213, 12, 217, 195, 213, 12, 195, 12, 12, 12, 12, 12, 12};

// peaceful and
const unsigned char line3[] = {210, 199, 195, 197, 199, 200, 215, 206, 12, 195, 208, 198, 12, 12, 12, 12, 12, 12};
// prosperous realm.
const unsigned char line4[] = {210, 212, 209, 213, 210, 199, 212, 209, 215, 213, 12, 212, 199, 195, 206, 207, 223, 12};
// but one day,
const unsigned char line5[] = {191, 210, 209, 9, 204, 203, 194, 9, 193, 190, 214, 239, 9, 9, 9, 9, 9, 9};
// something
const unsigned char line6[] = {208, 204, 202, 194, 209, 197, 198, 203, 196, 9, 9, 9, 9, 9, 9, 9, 9, 9};
// unthinkable
const unsigned char line7[] = {210, 203, 209, 197, 198, 203, 200, 190, 191, 201, 194, 9, 9, 9, 9, 9, 9, 9};
// happened: a dark
const unsigned char line8[] = {197, 190, 205, 205, 194, 203, 194, 193, 237, 9, 190, 9, 193, 190, 207, 200, 9, 9};
// threat appeared
const unsigned char line9[] = {209, 197, 207, 194, 190, 209, 9, 190, 205, 205, 190, 207, 194, 193, 9, 9, 9, 9};
// behind the
const unsigned char line10[] = {191, 194, 197, 198, 203, 193, 9, 209, 197, 194, 9, 9, 9, 9, 9, 9, 9, 9};
// mountains.
const unsigned char line11[] = {202, 204, 210, 203, 209, 190, 198, 203, 208, 236, 9, 9, 9, 9, 9, 9, 9, 9};
// the king trusted
const unsigned char line12[] = {166, 154, 151, 0, 157, 155, 160, 153, 0, 166, 164, 167, 165, 166, 151, 150, 0, 0};
// a brave knight,
const unsigned char line13[] = {147, 0, 148, 164, 147, 168, 151, 0, 157, 160, 155, 153, 154, 166, 0, 0, 0, 0};
// to defeat the
const unsigned char line14[] = {166, 161, 0, 150, 151, 152, 147, 151, 166, 0, 166, 154, 151, 0, 0, 0, 0, 0};
// new threat,
const unsigned char line15[] = {160, 151, 169, 0, 166, 154, 164, 151, 147, 166, 176, 0, 0, 0, 0, 0, 0, 0};
// joined by hector
const unsigned char line16[] = {156, 161, 155, 160, 151, 150, 0, 148, 171, 0, 154, 151, 149, 166, 161, 164, 0, 0};
// the smith and safy
const unsigned char line17[] = {166, 154, 151, 0, 165, 159, 155, 166, 154, 0, 147, 160, 150, 0, 165, 147, 152, 171};
// the priestess.
const unsigned char line18[] = {166, 154, 151, 0, 162, 164, 155, 151, 165, 166, 151, 165, 165, 175, 0, 0, 0, 0};
// will they succeed?
const unsigned char line19[] = {169, 155, 158, 158, 0, 166, 154, 151, 171, 0, 165, 167, 149, 149, 151, 151, 150, 178};
