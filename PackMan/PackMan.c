#include "PackMan.h"

Packman createPackman(uint16_t x, uint16_t y, Image *map)
{
    Packman p = {x,y,packmanClosed_width,packmanClosed_height,0,0,
                MOUTH_TICKER_MAX,0,MOVE_TICKER_MAX,map,
                canMove,move,getImage,0};
    return p;
}

bool canMove(Packman *pack)
{
	
	if(pack->speedX != 0)
	{
		int x = pack->posX + pack->speedX + (pack->speedX>0?pack->sizeX - 1 :0);
		int y = pack->posY;
		for(int i = 0; i < pack->sizeY; i++)
			if(image_getPixel(pack->map, x, y+i))
				return false;
	}
		
	else if(pack->speedY != 0)
	{
		int x = pack->posX;
		int y = pack->posY + pack->speedY + (pack->speedY > 0 ? pack->sizeY - 1: 0 );
		for(int i = 0; i < pack->sizeX; i++)
			if(image_getPixel(pack->map, x+i, y))
				return false;
	}
	
	return true;
}

void move(Packman *pack)
{
    if(pack->moveTicker--)
        return;
    
    pack->moveTicker = MOVE_TICKER_MAX;
    pack->posX += pack->speedX;
    pack->posY += pack->speedY;
}

Image* getImage(Packman *pack)
{
    #if 0
    if(!(pack->mouthTicker--))
    {
        pack->mouthTicker = MOUTH_TICKER_MAX;
        pack->moutOpen = ~pack->moutOpen;
    }
        
    if(pack->moutOpen)
    {
        if(pack->speedX > 0)
            return mouthRight;
        if(pack->speedX < 0)
            return mouthLeft;
        if(pack->speedY > 0)
            return mouthDown;
        if(pack->speedY < 0)
            return mouthUp;
    }
    
    return mouthClosed;
    #endif
    
    return 0;
}

bool eatSnack(Packman* p, Snack* snacks, int size)
{
    for(int i=0; i < size; i++)
    {
        if(snacks[i].isEaten)
            continue;
        if(snacks[i].posX > (p->posX + p->sizeX))
            continue;
        if(snacks[i].posX < p->posX)
            continue;
        if(snacks[i].posY > (p->posY + p->sizeY))
            continue;
        if(snacks[i].posY < p->posY)
            continue;
        
        snacks[i].isEaten = true;
        p->score++;
		return true;
    }
	
	return false;
}