#include "systick.h"
#include "GPIO.h"
#include "types.h"

#ifndef ALFA_DISP_H
#define ALFA_DISP_H

#define ASCII_B_E 0x40    //enable
#define ASCII_B_SELECT 4  //select bit
#define ASCII_B_RW 2      //read/write
#define ASCII_B_RS 1

#define ALFAPORT ((GPIO*)(GPIO_E_ADR))
typedef uint8_t unit8_t;

void ascii_ctrlbit_set(char);
void ascii_ctrlbit_clear(char);
void ascii_write_controller(char);
char ascii_read_controller();
char ascii_read_status();
void ascii_write_cmd(char);
void ascii_write_data(char);
void ascii_write_char(char);
void ascii_write_string(char*);
void ascii_gotoxy(unit8_t, unit8_t);
void ascii_function_set();
void ascii_display_control();
void ascii_entry_mode_set();
void ascii_init();

#endif //ALFA_DISP_H