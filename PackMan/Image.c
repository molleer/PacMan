#include "Image.h"

bool image_getPixel(Image* image, uint16_t x, uint16_t y)
{
    if(x >= image->width || y >= image->height)
        return true;
    
    return (image->bits[x/8 + y*(image->width/8)]>>(x%8))%2;
}
