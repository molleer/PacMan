#include "PackMan.h"
#include "graphic-disp.h"
#include "alfa-disp.h"
#include "Image.h"
#include "map1.xbm"
#include "keyb.h"
#include "snack.h"
#include "snack.xbm"

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
void writePackToBuff(Packman* p);
void write_blank(uint8_t width, uint8_t height, uint8_t _x, uint8_t _y);
void changeDir(Packman*);

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}
void app_init()
{
	*((unsigned char*) 0x40023830) = 0x18;
	__asm volatile("LDR R0,=0x8000209\nBLX R0\n");
    keyb_init();
    graphic_initialize();
    ascii_init();
}
void main(void)
{
    app_init();
    
    #if 0
    Image map = {map1_bits,map1_height,map1_width};
    
    ascii_gotoxy(1,1);
    for(int x = 0; x < 128; x++)
        for(int y = 0; y < 64; y++)
            backBuffer_pixel(x, y, image_getPixel(&map, x, y));
    graphic_write_backBuffer();
    #endif
    
    #if 1
    
    Snack snacks[18];
    char score[3];
    snack_init18(snacks);
    Image map = {map1_bits,map1_height,map1_width};
    Packman p = createPackman(0,0,&map);
	
    score[2] = 0;
    
    clear_backBuffer();
    write_to_buffer(map1_bits,127,63,0,0);
    for(int i=0; i < 18; i++)
        write_to_buffer(snack_bits,snack_width,snack_height,snacks[i].posX,snacks[i].posY);
    
    graphic_write_backBuffer();
	
	ascii_write_string("Score: 00");
	ascii_gotoxy(1,2);
	ascii_write_string("High score: 20");
	
    while(1)
    {
        write_blank(p.sizeX, p.sizeY, p.posX,p.posY);
        changeDir(&p);
        if(p.canMove(&p))
            p.move(&p);
        else
            p.speedX = p.speedY = 0;

        if(eatSnack(&p,snacks,18))
		{
			score[0] = (char) (p.score)/10 + 48;
			score[1] = (char) (p.score%10) + 48;
			
			ascii_gotoxy(8,1);
			ascii_write_string(score);
		}
        writePackToBuff(&p);
        graphic_write_backBuffer();
        
		//ascii_gotoxy(1,1);
		//ascii_write_string("     ");
		
        
        if(p.score >= 18)
		{
			ascii_gotoxy(1,1);
			ascii_write_string("You won!    ");
			ascii_gotoxy(1,2);
			ascii_write_string("No highscore :(");
		}
    }
    
    #endif
    return 0;
}

void writePackToBuff(Packman* pack)
{
    if(!(pack->mouthTicker--))
    {
        pack->mouthTicker = MOUTH_TICKER_MAX;
        pack->moutOpen = ~pack->moutOpen;
    }
    
    if(pack->moutOpen)
    {
        if(pack->speedX > 0)
        {
            write_to_buffer(packmanRight_bits,packmanRight_width,packmanRight_height,pack->posX,pack->posY);
            return;
        }
        if(pack->speedX < 0)
        {
            write_to_buffer(packmanLeft_bits,packmanLeft_width,packmanLeft_height,pack->posX,pack->posY);
            return;
        }
        if(pack->speedY > 0)
        {
            write_to_buffer(packmanDown_bits,packmanDown_width,packmanDown_height,pack->posX,pack->posY);
            return;
        }
        if(pack->speedY < 0)
        {
            write_to_buffer(packmanUp_bits,packmanUp_width,packmanUp_height,pack->posX,pack->posY);
            return;
        }
    }
    
    write_to_buffer(packmanClosed_bits,packmanClosed_width,packmanClosed_height,pack->posX,pack->posY);
}

void write_blank(uint8_t width, uint8_t height, uint8_t _x, uint8_t _y)
{
    for(int x=0; x < width; x++)
        for(int y=0; y < height; y++)
            backBuffer_pixel(x + _x, y + _y, 0);
}

void changeDir(Packman* pack)
{
    uint8_t c = keyb();
    switch(c)
    {
        case 2:
            pack->speedX = 0;
            pack->speedY = -MOVE_SPEED_MAX;
            break;
        case 4:
            pack->speedX = -MOVE_SPEED_MAX;
            pack->speedY = 0;
            break;
        case 6:
            pack->speedX = MOVE_SPEED_MAX;
            pack->speedY = 0;
            break;
        case 8:
            pack->speedX = 0;
            pack->speedY = MOVE_SPEED_MAX;
            break;
        case 5:
            pack->speedX = 0;
            pack->speedY = 0;
    }
}