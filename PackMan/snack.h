#include "types.h"


#ifndef SNACK_H
#define SNACK_H

typedef struct {
    uint8_t posX, posY;
    bool isEaten;
} Snack;

void snack_init18(Snack*);

#endif //SNACK_H