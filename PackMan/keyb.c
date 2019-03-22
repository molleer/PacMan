#include "keyb.h"

//--------------KEYPAD----------//
const unsigned char key[4][4] = {{0x1,0x2,0x3,0xA},
                                {0x4,0x5,0x6,0xB},
                                {0x7,0x8,0x9,0xC},
                                {0xE,0x0,0xF,0xD}};
const unsigned char numbers[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71};


unsigned char keyb(){
    
    //returnera tryckt tangent    
    uint8_t row, col;
    for(row = 1; row<5;row++){
        kbdActivateRow(row);
        col = kbdGetCol();
        if(col){
            kbdActivateRow(0);
            return key[row-1][col-1];
        }
    }
    kbdActivateRow(0);
    return 0xFF;

}

void kbdActivateRow(uint8_t row){
     if(row > 0 && row < 5){
        PORT->E_ODRHIGH = 0x8<<row;
     }else{      
        PORT->E_ODRHIGH = 0;
     }
}

int kbdGetCol (void){
    unsigned char c = PORT->E_IDRHIGH;
    if(c & 0x1) return 1;
    if(c & 0x2) return 2;
    if(c & 0x4) return 3;
    if(c & 0x8) return 4;
    /*for(int i = 1; i<5; i++){
        if(c & 1<<i) return i;
    }*/
    return 0;
}

void keyb_init()
{
	//KEYPAD ut
	PORT->E_MODER = 0x55005555;
}


#if 0


void kbdActivate(unsigned short row)
{
    if(row>4 || !row)
        row=0;
    else
        row = 1 << (row + 3);
    
    PORT->E_ODRHIGH = row;
}

int getCol()
{
    unsigned char i=0;
    unsigned short a = PORT->E_IDRHIGH;
    while(a>>i)i++;
    //while(PORT->E_IDRHIGH>>i)
    //  i++;
    return i;
}

unsigned char keyb()
{
    int col = 0;
    
    for(int row = 1; row <=4; row++)
    {
        kbdActivate(row);
        col = getCol();
        kbdActivate(0);
        if(col)
            return key[row-1][col-1];
    }
    
    return 0xFF;
}

void out7seg(unsigned char num)
{
    if(num > 0xF)
    {
        PORT->E_ODRLOW = 0;
        return;
    }
    PORT->E_ODRLOW = numbers[num];
}
#endif