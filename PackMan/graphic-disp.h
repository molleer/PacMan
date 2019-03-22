#include "GPIO.h"
#include "types.h"

#ifndef GRAPHIC_DISP_H
#define GRAPHIC_DISP_H

#define DISPPORT ((GPIO*) GPIO_E_ADR)

#define B_E 0x40
#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 8
#define B_SELECT 4
#define B_RW 2
#define B_RS 1

#define LCD_ON 0x3F
#define LCD_OFF 0x3E
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_DISP_START 0xC0
#define LCD_BUSY 0x80

typedef union{
    uint8_t byteArr[1024];
    unsigned long long longArr[128];
}Buffer;

void graphic_initialize();
static void select_controller(uint8_t);
static void graphic_cotrl_bit_set(uint8_t);
static void graphic_cotrl_bit_clear(uint8_t);
static void graphic_write(uint8_t,uint8_t);
static void graphic_write_cmd(uint8_t,uint8_t);
static void graphic_write_data(uint8_t,uint8_t);
static uint8_t graphic_read(uint8_t);
static uint8_t graphic_read_data(uint8_t);
static void graphic_wait_ready();
void clear_backBuffer();
void backBuffer_pixel(uint8_t,uint8_t,uint8_t);
void graphic_write_backBuffer();
void write_to_buffer(uint8_t*,uint8_t,uint8_t,uint8_t,uint8_t);

static Buffer backBuffer;

#endif //GRAPHIC_DISP_H