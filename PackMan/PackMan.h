#include "types.h"
#include "Image.h"
#include "snack.h"

#ifndef PACKMAN_H
#define PACKMAN_H

#include "packmanClosed.xbm"
#include "packmanUp.xbm"
#include "packmanDown.xbm"
#include "packmanRight.xbm"
#include "packmanLeft.xbm"

#define MOUTH_TICKER_MAX 20
#define MOVE_TICKER_MAX 1
#define MOVE_SPEED_MAX 1

/*Image mouthClosed = {packmanClosed_bits,packmanClosed_height,packmanClosed_width}
    ,mouthUp = {packmanUp_bits,packmanUp_height,packmanUp_width}
    ,mouthDown={packmanDown_bits,packmanDown_height,packmanDown_width}
    ,mouthRight={packmanRight_bits,packmanRight_height,packmanRight_width}
    ,mouthLeft={packmanLeft_bits,packmanLeft_height,packmanLeft_width};*/

typedef struct packman {
    
    uint16_t posX,posY,sizeX,sizeY;
    int8_t speedX,speedY;
    uint8_t mouthTicker, moutOpen;
    uint8_t moveTicker;
    Image *map;
    
    bool (*canMove)(struct packman*);
    void (*move)(struct packman*);
    Image* (*getImage)(struct packman*);
    
    uint8_t score;
} Packman;

Packman createPackman(uint16_t x,uint16_t y,Image *map);

bool canMove(Packman*);
void move(Packman*);
Image* getImage(Packman*);
bool eatSnack(Packman*, Snack*, int);

#endif //PACKMAN_H