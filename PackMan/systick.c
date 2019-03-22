#include "systick.h"

void delay_250ns()
{
    *STK_CTRL = 0;
    *STK_LOAD = 41;
    *STK_VAL = 0;
    *STK_CTRL = 5;
    while(!(*STK_CTRL & 0x10000));
    
    *STK_CTRL = 0;
}
 
void delay_micro(unsigned int us)
{
	while(us--)
	{
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void delay_ms(unsigned int ms)
{
	#ifdef SIMULATOR
	ms/=1000;
	ms++;
	#endif
	
	delay_micro(ms*1000);
}