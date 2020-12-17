
#include "char_rom.h"

extern Color color;


void init(void)
{
    clear_char();
    set_char_pos(0, 0);
    set_background_color(0);
    set_char_color(0);

    color.black = 0x000000;
    color.white = 0xFFFFFF;
    color.red   = 0xFF0000;
    color.green = 0x00FF00;
    color.blue  = 0x0000FF;
}

void clear_char(void)
{
    display_char('\0');
}

void set_background_color(uint32_t color)
{
    BACK_COLOR = (color & 0xFFFFFF);
}

void set_char_color(uint32_t color)
{
    CHAR_COLOR = (color & 0xFFFFFF);
}

void set_char_pos(uint16_t x, uint16_t y)
{
    CHAR_LOC = (x & 0xFFF);
    CHAR_LOC <<= 12;
    CHAR_LOC |= (y & 0xFFF);
}

void display_char(char ch)
{
    CHAR_SET = (ch & 0xFF);
}

uint32_t create_color(uint8_t R, uint8_t G, uint8_t B)
{
    uint32_t color = R;
    color <<= 8;
    color |= (G & 0xFF);
    color <<= 8;
    color |= (B & 0xFF);
}
