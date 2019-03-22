#include "types.h"

#ifndef IMAGE_H
#define IMAGE_H

typedef struct {
    unsigned char *bits;
    uint16_t height, width;
} Image;

bool image_getPixel(Image* image,uint16_t x, uint16_t y);
#endif //IMAGE_H