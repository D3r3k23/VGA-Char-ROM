
#include "char_rom.h"

extern Colors colors;


void delay(int x)
    { for (int i = 0; i < x * 20000000; i++); }


int main(void)
{
    init();

    delay(40);

    set_background_color(colors.BLACK);
    set_char_color(colors.WHITE);

    set_char_pos(632, 352); // Center of screen
    display_char('E');

    delay(10);

    clear_char();
    set_background_color(colors.WHITE);
    set_char_color(colors.BLUE);
    delay(4);
    while(1)
    {
        set_char_pos(588, 352);
        display_char('V');
        delay(1);
        set_char_pos(604, 352);
        display_char('E');
        delay(1);
        set_char_pos(616, 352);
        display_char('R');
        delay(1);
        set_char_pos(632, 352);
        display_char('I');
        delay(1);
        set_char_pos(648, 352);
        display_char('L');
        delay(1);
        set_char_pos(664, 352);
        display_char('O');
        delay(1);
        set_char_pos(680, 352);
        display_char('G');
        delay(1);
    }

    return 0;
}
