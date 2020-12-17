
#ifndef VGA_CHAR_ROM_H
#define VGA_CHAR_ROM_H


#include "stdint.h"


#define BACK_COLOR *(( uint32_t *) 0x43C00000)
#define CHAR_COLOR *(( uint32_t *) 0x43C00004)
#define CHAR_LOC   *(( uint32_t *) 0x43C00008)
#define CHAR_SET   *(( uint32_t *) 0x43C0000C)


typedef uint32_t Color;

typedef struct Colors_t
{
    Color BLACK;
    Color WHITE;
    Color RED;
    Color GREEN;
    Color BLUE;
} Colors;

Colors colors;


void clear_char(void);

void init(void);

void set_background_color(Color color);

void set_char_color(Color color);

void set_char_pos(uint16_t x, uint16_t y);

void display_char(char ch);

Color create_color(uint8_t R, uint8_t G, uint8_t B);


#endif // VGA_CHAR_ROM_H
