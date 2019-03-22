#include "alfa-disp.h"

void ascii_ctrlbit_set(char x)
{
    char c;
    c = ALFAPORT->E_ODRLOW;
    c |= (ASCII_B_SELECT|x);
    ALFAPORT->E_ODRLOW = c;
}

void ascii_ctrlbit_clear(char x)
{
    char c;
    c = ALFAPORT->E_ODRLOW;
    c &= (ASCII_B_SELECT|~x);
    ALFAPORT->E_ODRLOW = c;
}

void ascii_write_controller(char c)
{
    ascii_ctrlbit_set(ASCII_B_E);
    ALFAPORT->E_ODRHIGH = c;
    delay_250ns();
    ascii_ctrlbit_clear(ASCII_B_E);
}

char ascii_read_controller()
{
    char c;
    ascii_ctrlbit_set(ASCII_B_E);
    delay_250ns();
    delay_250ns();
    c = ALFAPORT->E_IDRLOW;
    ascii_ctrlbit_clear(ASCII_B_E);
    return c;
}

char ascii_read_status()
{
    char c;
    
    ascii_ctrlbit_set(ASCII_B_RW);
    ascii_ctrlbit_clear(ASCII_B_RS);
    
    ALFAPORT->E_MODER = 0x00005555;
    c = ascii_read_controller();
    ALFAPORT->E_MODER = 0x55555555;
    return c;
}

void ascii_write_cmd(char cmd)
{
    ascii_ctrlbit_clear(ASCII_B_RS);
    ascii_ctrlbit_clear(ASCII_B_RW);
    ascii_write_controller(cmd);
}

void ascii_write_data(char data)
{
    ascii_ctrlbit_set(ASCII_B_RS);
    ascii_ctrlbit_clear(ASCII_B_RW);
    ascii_write_controller(data);
}

void ascii_write_char(char c)
{
    while((ascii_read_status() & 0x80) == 0x80){}; //FIX
    delay_micro(20);
    ascii_write_data(c);
    delay_micro(43);
}

void ascii_gotoxy(unit8_t x, unit8_t y)
{
    unit8_t address = x - 1;
    if(y == 2)
        address += 0x40;
    ascii_write_cmd(0x80|address);
}

void ascii_function_set()
{
    while((ascii_read_status() & 0x80) == 0x80){}; //FIX
    delay_micro(8);
    ascii_write_cmd(0b111000);
    delay_micro(39);
}

void ascii_display_control()
{
    while((ascii_read_status() & 0x80) == 0x80);
    delay_micro(8);
    ascii_write_cmd(0b1110);
    delay_micro(39);
}

void ascii_entry_mode_set()
{
    while((ascii_read_status() & 0x80) == 0x80);
    delay_micro(8);
    ascii_write_cmd(0b110);
    delay_micro(39);
}

void ascii_init()
{
    ALFAPORT->E_MODER = 0x55555555;
    ascii_function_set();
    ascii_display_control();
    ascii_entry_mode_set();
}

void ascii_write_string(char* s)
{
	do
		ascii_write_char(*s++);
	while(*s);
}