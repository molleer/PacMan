#include "snack.h"

void snack_init18(Snack* snacks)
{
    uint8_t x[] = {14,37,4 ,48,48,4 ,4 ,14,37};
    uint8_t y[] = {4 ,4 ,14,14,35,44,58,58,58};
    
    for(int i=0; i<9; i++)
    {
        snacks[i].posX = x[i];
        snacks[i].posY = y[i];
        snacks[i].isEaten = false;
    }
    
    for(int i=0; i< 9; i++)
    {
        snacks[i+9].posX = (snacks[i].posX-64)*-1 + 62;
        snacks[i+9].posY = (snacks[i].posY-32)*-1 + 30;
        snacks[i+9].isEaten = false;
    }
    
}