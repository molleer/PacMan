//#define SIMULATOR

#ifndef SYSTICK_H
#define SYSTICK_H

#define systicadr 0xE000E010
#define systictype (volatile unsigned int*)
#define STK_CTRL (systictype (systicadr + 0x0))
#define STK_LOAD (systictype (systicadr + 0x4))
#define STK_VAL (systictype (systicadr + 0x8))
#define STK_CALIB (systictype (systicadr + 0xC))

void delay_250ns();
void delay_micro(unsigned int us);
void delay_ms(unsigned int ms);

#endif //SYSTICK_H