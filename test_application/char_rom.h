
#ifndef CHAR_ROM_H
#define CHAR_ROM_H


#include "stdint.h"


#define BACK_COLOR *(( uint32_t *) 0x43C00000)
#define CHAR_COLOR *(( uint32_t *) 0x43C00004)
#define CHAR_LOC   *(( uint32_t *) 0x43C00008)
#define CHAR_SET   *(( uint32_t *) 0x43C0000C)


typedef struct Color_t
{
    uint32_t black;
    uint32_t white;
    uint32_t red;
    uint32_t blue;
    uint32_t green;
} Color;

Color color;


void clear_char(void);

void init(void);

void set_background_color(uint32_t color);

void set_char_color(uint32_t color);

void set_char_pos(uint16_t x, uint16_t y);

void display_char(char ch);

uint32_t create_color(uint8_t R, uint8_t G, uint8_t B);


#endif // CHAR_ROM_H
