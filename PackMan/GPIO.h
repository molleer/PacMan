#ifndef GPIO_H
#define GPIO_H

#define GPIO_A_ADR 0x40020000
#define GPIO_B_ADR 0x40020400
#define GPIO_C_ADR 0x40020800
#define GPIO_D_ADR 0x40020C00
#define GPIO_E_ADR 0x40021000

typedef volatile struct
{
    int E_MODER;
    char E_OTYPERLOW;
    char E_OTYPERHIGH;
    short fill1;
    int E_OSPEEDR;
    int E_PUPDR;
    char E_IDRLOW;
    char E_IDRHIGH;
    short fill2;
    char E_ODRLOW;
    char E_ODRHIGH;
    short fill3;
    int E_BSSR;
    int E_LCKR;
    int E_AFRL;
    int E_AFRH;
}GPIO;

#endif