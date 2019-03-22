#include "graphic-disp.h"

void graphic_initialize()
{
    DISPPORT->E_MODER = 0x55555555;
    clear_backBuffer();
    
    graphic_cotrl_bit_set(B_E);
    delay_micro(10);
    
    graphic_cotrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
    delay_ms(30);
    graphic_cotrl_bit_set(B_RST);
    delay_ms(100);
    graphic_write_cmd(LCD_OFF,          B_CS1|B_CS2);
    graphic_write_cmd(LCD_ON,           B_CS1|B_CS2);
    graphic_write_cmd(LCD_DISP_START,   B_CS1|B_CS2);
    graphic_write_cmd(LCD_SET_ADD,      B_CS1|B_CS2);
    graphic_write_cmd(LCD_SET_PAGE,     B_CS1|B_CS2);
    select_controller(0);
}

void clear_backBuffer()
{
    for(int i=0; i < 1024; i++)
        backBuffer.byteArr[i] = 0;
}

static void graphic_cotrl_bit_set(uint8_t bit)
{
    uint8_t c = DISPPORT->E_ODRLOW;
    c |= (bit & ~B_SELECT);
    DISPPORT->E_ODRLOW = c;
}

static void graphic_cotrl_bit_clear(uint8_t bit)
{
    uint8_t c = DISPPORT->E_ODRLOW;
    c &= (~bit & ~B_SELECT);
    DISPPORT->E_ODRLOW = c;
}

static void select_controller(uint8_t ctrl)
{
    switch(ctrl)
    {
        case 0:
            graphic_cotrl_bit_clear(B_CS1|B_CS2);
            break;
        case B_CS1:
            graphic_cotrl_bit_clear(B_CS2);
            graphic_cotrl_bit_set(B_CS1);
            break;
        case B_CS2:
            graphic_cotrl_bit_clear(B_CS1);
            graphic_cotrl_bit_set(B_CS2);
            break;
        case B_CS1|B_CS2:
            graphic_cotrl_bit_set(B_CS1|B_CS2);
    }
}

static void graphic_write_cmd(uint8_t cmd, uint8_t ctrl)
{
    graphic_cotrl_bit_clear(B_E);
    select_controller(ctrl);
    graphic_cotrl_bit_clear(B_RS|B_RW);
    graphic_write(cmd,ctrl);
}

static void graphic_write_data(uint8_t data, uint8_t ctrl)
{
    graphic_cotrl_bit_clear(B_E);
    select_controller(ctrl);
    graphic_cotrl_bit_clear(B_RW);
    graphic_cotrl_bit_set(B_RS);
    graphic_write(data,ctrl);
}

static void graphic_wait_ready()
{
    uint8_t c;
    graphic_cotrl_bit_clear(B_E);
    DISPPORT->E_MODER = 0x00005555;
    graphic_cotrl_bit_clear(B_RS);
    graphic_cotrl_bit_set(B_RW);
    delay_250ns();
    delay_250ns();
    
    while(1)
    {
        graphic_cotrl_bit_set(B_E);
        delay_250ns();
        delay_250ns();
        c = DISPPORT->E_IDRLOW & LCD_BUSY;
        graphic_cotrl_bit_clear(B_E);
        delay_250ns();
        delay_250ns();
        if(!c) break;
    }
    DISPPORT->E_MODER = 0x55555555;
}

static uint8_t graphic_read(uint8_t ctrl)
{
    uint8_t c;
    graphic_cotrl_bit_clear(B_E);
    DISPPORT->E_MODER = 0x00005555;
    graphic_cotrl_bit_set(B_RS|B_RW);
    select_controller(ctrl);
    delay_250ns();
    delay_250ns();
    graphic_cotrl_bit_set(B_E);
    delay_250ns();
    delay_250ns();
    c = DISPPORT->E_IDRHIGH;
    graphic_cotrl_bit_clear(B_E);
    DISPPORT->E_MODER = 0x55555555;
    
    if(ctrl & B_CS1)
    {
        select_controller(B_CS1);
        graphic_wait_ready();
    }
    if(ctrl & B_CS2)
    {
        select_controller(B_CS2);
        graphic_wait_ready();
    }
    return c;
}

static uint8_t graphic_read_data(uint8_t ctrl)
{
    graphic_read(ctrl);
    return graphic_read(ctrl);
}

void backBuffer_pixel(uint8_t x, uint8_t y, uint8_t set)
{
    uint8_t bit;
    
    if(x >= 128 || y >= 64) return;
    
    bit = 1 <<(y%8);
    
    if(set)
        backBuffer.byteArr[(x<<3)+(y/8)] |= bit;
    else
        backBuffer.byteArr[(x<<3)+(y/8)] &= ~bit;
}

static void graphic_write(uint8_t value,uint8_t ctrl)
{
    DISPPORT->E_ODRHIGH = value;
    select_controller(ctrl);
    delay_250ns();
    delay_250ns();
    graphic_cotrl_bit_set(B_E);
    delay_250ns();
    delay_250ns();
    graphic_cotrl_bit_clear(B_E);
    
    if(ctrl & B_CS1)
    {
        select_controller(B_CS1);
        graphic_wait_ready();
    }
    
    if(ctrl & B_CS2)
    {
        select_controller(B_CS2);
        graphic_wait_ready();
    }
    
    DISPPORT->E_ODRHIGH = 0;
    graphic_cotrl_bit_set(B_E);
    select_controller(0);
}

void graphic_write_backBuffer()
{
    for(int page = 0; page < 8; page++)
    {
        graphic_write_cmd(LCD_SET_ADD, B_CS1);
        graphic_write_cmd(LCD_SET_PAGE|page,B_CS1);
        
        for(int adr = 0; adr < 64; adr++)
            graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS1);
        
        graphic_write_cmd(LCD_SET_ADD, B_CS2);
        graphic_write_cmd(LCD_SET_PAGE|page,B_CS2);
        
        for(int adr = 64; adr < 128; adr++)
            graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS2);
    }
}

void write_to_buffer(unsigned char* image,uint8_t width,uint8_t height, uint8_t _x, uint8_t _y)
{
    for(int x=0; x < width; x++)
        for(int y=0; y < height; y++)
            backBuffer_pixel(x + _x, y + _y, (image[x/8 + y*(width/8 + 1)]>>(x%8))%2);
}