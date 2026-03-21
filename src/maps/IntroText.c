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
// c'era una volta
const unsigned char line1[] = {197, 226, 199, 212, 195, 12, 215, 208, 195, 12, 216, 209, 206, 214, 195, 12, 203, 206, 12, 12};
// il regno di Lithos,
const unsigned char line2[] = {212, 199, 201, 208, 209, 12, 198, 203, 12, 206, 203, 214, 202, 209, 213, 221, 12, 12, 12, 12};
// un regno prosperoso
const unsigned char line3[] = {215, 208, 12, 212, 199, 201, 208, 209, 12, 209, 216, 199, 12, 12, 12, 12, 12, 12, 12, 12};
// ove regnava la pace.
const unsigned char line4[] = {212, 199, 201, 208, 195, 216, 195, 12, 206, 195, 12, 210, 195, 197, 199, 223, 12, 12, 12};
// ma un giorno
const unsigned char line5[] = {202, 190, 9, 210, 203, 9, 196, 198, 204, 207, 203, 204, 9, 9, 9, 9, 9, 9};
// accadde qualcosa
const unsigned char line6[] = {190, 192, 192, 190, 193, 193, 194, 9, 206, 210, 190, 201, 192, 204, 208, 190, 9, 9};
// di impensabile:
const unsigned char line7[] = {193, 198, 9, 198, 202, 205, 194, 203, 208, 190, 191, 198, 201, 194, 237, 9, 9, 9};
// una minaccia
const unsigned char line8[] = {210, 203, 190, 9, 202, 198, 203, 190, 192, 192, 198, 190, 9, 9, 9, 9, 9, 9};
// oscura fece la
const unsigned char line9[] = {204, 208, 192, 210, 207, 190, 9, 195, 194, 192, 194, 9, 201, 190, 9, 9, 9, 9};
// sua comparsa tra
const unsigned char line10[] = {208, 210, 190, 9, 192, 204, 202, 205, 190, 207, 208, 190, 9, 209, 207, 190, 9, 9};
// le montagne.
const unsigned char line11[] = {201, 194, 9, 202, 204, 203, 209, 190, 196, 203, 194, 236, 9, 9, 9, 9, 9, 9};
// il re ha affidato
const unsigned char line12[] = {155, 158, 0, 164, 151, 0, 154, 147, 0, 147, 152, 152, 155, 150, 147, 166, 161, 0};
// l'incarico di
const unsigned char line13[] = {158, 177, 155, 160, 149, 147, 164, 155, 149, 161, 0, 150, 155, 0, 0, 0, 0, 0};
// sconfiggere la
const unsigned char line14[] = {165, 149, 161, 160, 152, 155, 153, 153, 151, 164, 151, 0, 158, 147, 0, 0, 0, 0};
// nuova minaccia ad
const unsigned char line15[] = {160, 167, 161, 168, 147, 0, 159, 155, 160, 147, 149, 149, 155, 147, 0, 147, 150, 0};
// un suo fidato
const unsigned char line16[] = {167, 160, 0, 165, 167, 161, 0, 152, 155, 150, 147, 166, 161, 0, 0, 0, 0, 0};
// cavaliere,
const unsigned char line17[] = {149, 147, 168, 147, 158, 155, 151, 164, 151, 176, 0, 0, 0, 0, 0, 0, 0, 0};
// accompagnato dal
const unsigned char line18[] = {147, 149, 149, 161, 159, 162, 147, 153, 160, 147, 166, 161, 0, 150, 147, 158, 0, 0};
// fabbro hector e
const unsigned char line19[] = {152, 147, 148, 148, 164, 161, 0, 154, 151, 149, 166, 161, 164, 0, 151, 0, 0, 0};
// dalla sacerdotessa
const unsigned char line20[] = {150, 147, 158, 158, 147, 0, 165, 147, 149, 151, 164, 150, 161, 166, 151, 165, 165, 147};
// safy. riusciranno
const unsigned char line21[] = {165, 147, 152, 171, 173, 0, 164, 155, 167, 165, 149, 155, 164, 147, 160, 160, 161, 0};
// nella loro
const unsigned char line22[] = {160, 151, 158, 158, 147, 0, 158, 161, 164, 161, 0, 0, 0, 0, 0, 0, 0, 0};
// impresa?
const unsigned char line23[] = {155, 159, 162, 164, 151, 165, 147, 178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
