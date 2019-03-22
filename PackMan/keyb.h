#include "GPIO.h"
#include "types.h"

#ifndef KEYB_H
#define KEYB_H

#define PORT ((volatile GPIO*)(GPIO_D_ADR))

void kbdActivate(unsigned short);
unsigned char keyb();
int getCol();
void out7seg(unsigned char);
void keyb_init();

#endif //KEYB_H