   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"graphic-disp.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.bss
  16              		.align	3
  17              	backBuffer:
  18 0000 00000000 		.space	1024
  18      00000000 
  18      00000000 
  18      00000000 
  18      00000000 
  20              		.text
  21              		.align	1
  22              		.global	graphic_initialize
  23              		.syntax unified
  24              		.code	16
  25              		.thumb_func
  26              		.fpu softvfp
  28              	graphic_initialize:
  29              	.LFB0:
  30              		.file 1 "D:/PackMan/PackMan/graphic-disp.c"
   1:D:/PackMan/PackMan\graphic-disp.c **** #include "graphic-disp.h"
   2:D:/PackMan/PackMan\graphic-disp.c **** 
   3:D:/PackMan/PackMan\graphic-disp.c **** void graphic_initialize()
   4:D:/PackMan/PackMan\graphic-disp.c **** {
  31              		.loc 1 4 0
  32              		.cfi_startproc
  33              		@ args = 0, pretend = 0, frame = 0
  34              		@ frame_needed = 1, uses_anonymous_args = 0
  35 0000 80B5     		push	{r7, lr}
  36              		.cfi_def_cfa_offset 8
  37              		.cfi_offset 7, -8
  38              		.cfi_offset 14, -4
  39 0002 00AF     		add	r7, sp, #0
  40              		.cfi_def_cfa_register 7
   5:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_MODER = 0x55555555;
  41              		.loc 1 5 0
  42 0004 184B     		ldr	r3, .L2
  43 0006 194A     		ldr	r2, .L2+4
  44 0008 1A60     		str	r2, [r3]
   6:D:/PackMan/PackMan\graphic-disp.c ****     clear_backBuffer();
  45              		.loc 1 6 0
  46 000a FFF7FEFF 		bl	clear_backBuffer
   7:D:/PackMan/PackMan\graphic-disp.c ****     
   8:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_E);
  47              		.loc 1 8 0
  48 000e 4020     		movs	r0, #64
  49 0010 00F048F8 		bl	graphic_cotrl_bit_set
   9:D:/PackMan/PackMan\graphic-disp.c ****     delay_micro(10);
  50              		.loc 1 9 0
  51 0014 0A20     		movs	r0, #10
  52 0016 FFF7FEFF 		bl	delay_micro
  10:D:/PackMan/PackMan\graphic-disp.c ****     
  11:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
  53              		.loc 1 11 0
  54 001a 7820     		movs	r0, #120
  55 001c 00F064F8 		bl	graphic_cotrl_bit_clear
  12:D:/PackMan/PackMan\graphic-disp.c ****     delay_ms(30);
  56              		.loc 1 12 0
  57 0020 1E20     		movs	r0, #30
  58 0022 FFF7FEFF 		bl	delay_ms
  13:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_RST);
  59              		.loc 1 13 0
  60 0026 2020     		movs	r0, #32
  61 0028 00F03CF8 		bl	graphic_cotrl_bit_set
  14:D:/PackMan/PackMan\graphic-disp.c ****     delay_ms(100);
  62              		.loc 1 14 0
  63 002c 6420     		movs	r0, #100
  64 002e FFF7FEFF 		bl	delay_ms
  15:D:/PackMan/PackMan\graphic-disp.c ****     graphic_write_cmd(LCD_OFF,          B_CS1|B_CS2);
  65              		.loc 1 15 0
  66 0032 1821     		movs	r1, #24
  67 0034 3E20     		movs	r0, #62
  68 0036 00F0A8F8 		bl	graphic_write_cmd
  16:D:/PackMan/PackMan\graphic-disp.c ****     graphic_write_cmd(LCD_ON,           B_CS1|B_CS2);
  69              		.loc 1 16 0
  70 003a 1821     		movs	r1, #24
  71 003c 3F20     		movs	r0, #63
  72 003e 00F0A4F8 		bl	graphic_write_cmd
  17:D:/PackMan/PackMan\graphic-disp.c ****     graphic_write_cmd(LCD_DISP_START,   B_CS1|B_CS2);
  73              		.loc 1 17 0
  74 0042 1821     		movs	r1, #24
  75 0044 C020     		movs	r0, #192
  76 0046 00F0A0F8 		bl	graphic_write_cmd
  18:D:/PackMan/PackMan\graphic-disp.c ****     graphic_write_cmd(LCD_SET_ADD,      B_CS1|B_CS2);
  77              		.loc 1 18 0
  78 004a 1821     		movs	r1, #24
  79 004c 4020     		movs	r0, #64
  80 004e 00F09CF8 		bl	graphic_write_cmd
  19:D:/PackMan/PackMan\graphic-disp.c ****     graphic_write_cmd(LCD_SET_PAGE,     B_CS1|B_CS2);
  81              		.loc 1 19 0
  82 0052 1821     		movs	r1, #24
  83 0054 B820     		movs	r0, #184
  84 0056 00F098F8 		bl	graphic_write_cmd
  20:D:/PackMan/PackMan\graphic-disp.c ****     select_controller(0);
  85              		.loc 1 20 0
  86 005a 0020     		movs	r0, #0
  87 005c 00F068F8 		bl	select_controller
  21:D:/PackMan/PackMan\graphic-disp.c **** }
  88              		.loc 1 21 0
  89 0060 C046     		nop
  90 0062 BD46     		mov	sp, r7
  91              		@ sp needed
  92 0064 80BD     		pop	{r7, pc}
  93              	.L3:
  94 0066 C046     		.align	2
  95              	.L2:
  96 0068 00100240 		.word	1073876992
  97 006c 55555555 		.word	1431655765
  98              		.cfi_endproc
  99              	.LFE0:
 101              		.align	1
 102              		.global	clear_backBuffer
 103              		.syntax unified
 104              		.code	16
 105              		.thumb_func
 106              		.fpu softvfp
 108              	clear_backBuffer:
 109              	.LFB1:
  22:D:/PackMan/PackMan\graphic-disp.c **** 
  23:D:/PackMan/PackMan\graphic-disp.c **** void clear_backBuffer()
  24:D:/PackMan/PackMan\graphic-disp.c **** {
 110              		.loc 1 24 0
 111              		.cfi_startproc
 112              		@ args = 0, pretend = 0, frame = 8
 113              		@ frame_needed = 1, uses_anonymous_args = 0
 114 0070 80B5     		push	{r7, lr}
 115              		.cfi_def_cfa_offset 8
 116              		.cfi_offset 7, -8
 117              		.cfi_offset 14, -4
 118 0072 82B0     		sub	sp, sp, #8
 119              		.cfi_def_cfa_offset 16
 120 0074 00AF     		add	r7, sp, #0
 121              		.cfi_def_cfa_register 7
 122              	.LBB2:
  25:D:/PackMan/PackMan\graphic-disp.c ****     for(int i=0; i < 1024; i++)
 123              		.loc 1 25 0
 124 0076 0023     		movs	r3, #0
 125 0078 7B60     		str	r3, [r7, #4]
 126 007a 07E0     		b	.L5
 127              	.L6:
  26:D:/PackMan/PackMan\graphic-disp.c ****         backBuffer.byteArr[i] = 0;
 128              		.loc 1 26 0 discriminator 3
 129 007c 074A     		ldr	r2, .L7
 130 007e 7B68     		ldr	r3, [r7, #4]
 131 0080 D318     		adds	r3, r2, r3
 132 0082 0022     		movs	r2, #0
 133 0084 1A70     		strb	r2, [r3]
  25:D:/PackMan/PackMan\graphic-disp.c ****     for(int i=0; i < 1024; i++)
 134              		.loc 1 25 0 discriminator 3
 135 0086 7B68     		ldr	r3, [r7, #4]
 136 0088 0133     		adds	r3, r3, #1
 137 008a 7B60     		str	r3, [r7, #4]
 138              	.L5:
  25:D:/PackMan/PackMan\graphic-disp.c ****     for(int i=0; i < 1024; i++)
 139              		.loc 1 25 0 is_stmt 0 discriminator 1
 140 008c 7B68     		ldr	r3, [r7, #4]
 141 008e 044A     		ldr	r2, .L7+4
 142 0090 9342     		cmp	r3, r2
 143 0092 F3DD     		ble	.L6
 144              	.LBE2:
  27:D:/PackMan/PackMan\graphic-disp.c **** }
 145              		.loc 1 27 0 is_stmt 1
 146 0094 C046     		nop
 147 0096 BD46     		mov	sp, r7
 148 0098 02B0     		add	sp, sp, #8
 149              		@ sp needed
 150 009a 80BD     		pop	{r7, pc}
 151              	.L8:
 152              		.align	2
 153              	.L7:
 154 009c 00000000 		.word	backBuffer
 155 00a0 FF030000 		.word	1023
 156              		.cfi_endproc
 157              	.LFE1:
 159              		.align	1
 160              		.syntax unified
 161              		.code	16
 162              		.thumb_func
 163              		.fpu softvfp
 165              	graphic_cotrl_bit_set:
 166              	.LFB2:
  28:D:/PackMan/PackMan\graphic-disp.c **** 
  29:D:/PackMan/PackMan\graphic-disp.c **** static void graphic_cotrl_bit_set(uint8_t bit)
  30:D:/PackMan/PackMan\graphic-disp.c **** {
 167              		.loc 1 30 0
 168              		.cfi_startproc
 169              		@ args = 0, pretend = 0, frame = 16
 170              		@ frame_needed = 1, uses_anonymous_args = 0
 171 00a4 80B5     		push	{r7, lr}
 172              		.cfi_def_cfa_offset 8
 173              		.cfi_offset 7, -8
 174              		.cfi_offset 14, -4
 175 00a6 84B0     		sub	sp, sp, #16
 176              		.cfi_def_cfa_offset 24
 177 00a8 00AF     		add	r7, sp, #0
 178              		.cfi_def_cfa_register 7
 179 00aa 0200     		movs	r2, r0
 180 00ac FB1D     		adds	r3, r7, #7
 181 00ae 1A70     		strb	r2, [r3]
  31:D:/PackMan/PackMan\graphic-disp.c ****     uint8_t c = DISPPORT->E_ODRLOW;
 182              		.loc 1 31 0
 183 00b0 0C4A     		ldr	r2, .L10
 184 00b2 0F21     		movs	r1, #15
 185 00b4 7B18     		adds	r3, r7, r1
 186 00b6 127D     		ldrb	r2, [r2, #20]
 187 00b8 1A70     		strb	r2, [r3]
  32:D:/PackMan/PackMan\graphic-disp.c ****     c |= (bit & ~B_SELECT);
 188              		.loc 1 32 0
 189 00ba FB1D     		adds	r3, r7, #7
 190 00bc 1B78     		ldrb	r3, [r3]
 191 00be 5BB2     		sxtb	r3, r3
 192 00c0 0422     		movs	r2, #4
 193 00c2 9343     		bics	r3, r2
 194 00c4 5AB2     		sxtb	r2, r3
 195 00c6 7B18     		adds	r3, r7, r1
 196 00c8 1B78     		ldrb	r3, [r3]
 197 00ca 5BB2     		sxtb	r3, r3
 198 00cc 1343     		orrs	r3, r2
 199 00ce 5AB2     		sxtb	r2, r3
 200 00d0 7B18     		adds	r3, r7, r1
 201 00d2 1A70     		strb	r2, [r3]
  33:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_ODRLOW = c;
 202              		.loc 1 33 0
 203 00d4 034A     		ldr	r2, .L10
 204 00d6 7B18     		adds	r3, r7, r1
 205 00d8 1B78     		ldrb	r3, [r3]
 206 00da 1375     		strb	r3, [r2, #20]
  34:D:/PackMan/PackMan\graphic-disp.c **** }
 207              		.loc 1 34 0
 208 00dc C046     		nop
 209 00de BD46     		mov	sp, r7
 210 00e0 04B0     		add	sp, sp, #16
 211              		@ sp needed
 212 00e2 80BD     		pop	{r7, pc}
 213              	.L11:
 214              		.align	2
 215              	.L10:
 216 00e4 00100240 		.word	1073876992
 217              		.cfi_endproc
 218              	.LFE2:
 220              		.align	1
 221              		.syntax unified
 222              		.code	16
 223              		.thumb_func
 224              		.fpu softvfp
 226              	graphic_cotrl_bit_clear:
 227              	.LFB3:
  35:D:/PackMan/PackMan\graphic-disp.c **** 
  36:D:/PackMan/PackMan\graphic-disp.c **** static void graphic_cotrl_bit_clear(uint8_t bit)
  37:D:/PackMan/PackMan\graphic-disp.c **** {
 228              		.loc 1 37 0
 229              		.cfi_startproc
 230              		@ args = 0, pretend = 0, frame = 16
 231              		@ frame_needed = 1, uses_anonymous_args = 0
 232 00e8 80B5     		push	{r7, lr}
 233              		.cfi_def_cfa_offset 8
 234              		.cfi_offset 7, -8
 235              		.cfi_offset 14, -4
 236 00ea 84B0     		sub	sp, sp, #16
 237              		.cfi_def_cfa_offset 24
 238 00ec 00AF     		add	r7, sp, #0
 239              		.cfi_def_cfa_register 7
 240 00ee 0200     		movs	r2, r0
 241 00f0 FB1D     		adds	r3, r7, #7
 242 00f2 1A70     		strb	r2, [r3]
  38:D:/PackMan/PackMan\graphic-disp.c ****     uint8_t c = DISPPORT->E_ODRLOW;
 243              		.loc 1 38 0
 244 00f4 0D4A     		ldr	r2, .L13
 245 00f6 0F21     		movs	r1, #15
 246 00f8 7B18     		adds	r3, r7, r1
 247 00fa 127D     		ldrb	r2, [r2, #20]
 248 00fc 1A70     		strb	r2, [r3]
  39:D:/PackMan/PackMan\graphic-disp.c ****     c &= (~bit & ~B_SELECT);
 249              		.loc 1 39 0
 250 00fe FB1D     		adds	r3, r7, #7
 251 0100 1B78     		ldrb	r3, [r3]
 252 0102 DB43     		mvns	r3, r3
 253 0104 DBB2     		uxtb	r3, r3
 254 0106 7A18     		adds	r2, r7, r1
 255 0108 1278     		ldrb	r2, [r2]
 256 010a 1340     		ands	r3, r2
 257 010c DAB2     		uxtb	r2, r3
 258 010e 0800     		movs	r0, r1
 259 0110 7B18     		adds	r3, r7, r1
 260 0112 0421     		movs	r1, #4
 261 0114 8A43     		bics	r2, r1
 262 0116 1A70     		strb	r2, [r3]
  40:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_ODRLOW = c;
 263              		.loc 1 40 0
 264 0118 044A     		ldr	r2, .L13
 265 011a 0100     		movs	r1, r0
 266 011c 7B18     		adds	r3, r7, r1
 267 011e 1B78     		ldrb	r3, [r3]
 268 0120 1375     		strb	r3, [r2, #20]
  41:D:/PackMan/PackMan\graphic-disp.c **** }
 269              		.loc 1 41 0
 270 0122 C046     		nop
 271 0124 BD46     		mov	sp, r7
 272 0126 04B0     		add	sp, sp, #16
 273              		@ sp needed
 274 0128 80BD     		pop	{r7, pc}
 275              	.L14:
 276 012a C046     		.align	2
 277              	.L13:
 278 012c 00100240 		.word	1073876992
 279              		.cfi_endproc
 280              	.LFE3:
 282              		.align	1
 283              		.syntax unified
 284              		.code	16
 285              		.thumb_func
 286              		.fpu softvfp
 288              	select_controller:
 289              	.LFB4:
  42:D:/PackMan/PackMan\graphic-disp.c **** 
  43:D:/PackMan/PackMan\graphic-disp.c **** static void select_controller(uint8_t ctrl)
  44:D:/PackMan/PackMan\graphic-disp.c **** {
 290              		.loc 1 44 0
 291              		.cfi_startproc
 292              		@ args = 0, pretend = 0, frame = 8
 293              		@ frame_needed = 1, uses_anonymous_args = 0
 294 0130 80B5     		push	{r7, lr}
 295              		.cfi_def_cfa_offset 8
 296              		.cfi_offset 7, -8
 297              		.cfi_offset 14, -4
 298 0132 82B0     		sub	sp, sp, #8
 299              		.cfi_def_cfa_offset 16
 300 0134 00AF     		add	r7, sp, #0
 301              		.cfi_def_cfa_register 7
 302 0136 0200     		movs	r2, r0
 303 0138 FB1D     		adds	r3, r7, #7
 304 013a 1A70     		strb	r2, [r3]
  45:D:/PackMan/PackMan\graphic-disp.c ****     switch(ctrl)
 305              		.loc 1 45 0
 306 013c FB1D     		adds	r3, r7, #7
 307 013e 1B78     		ldrb	r3, [r3]
 308 0140 082B     		cmp	r3, #8
 309 0142 0CD0     		beq	.L17
 310 0144 02DC     		bgt	.L18
 311 0146 002B     		cmp	r3, #0
 312 0148 05D0     		beq	.L19
  46:D:/PackMan/PackMan\graphic-disp.c ****     {
  47:D:/PackMan/PackMan\graphic-disp.c ****         case 0:
  48:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_clear(B_CS1|B_CS2);
  49:D:/PackMan/PackMan\graphic-disp.c ****             break;
  50:D:/PackMan/PackMan\graphic-disp.c ****         case B_CS1:
  51:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_clear(B_CS2);
  52:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_set(B_CS1);
  53:D:/PackMan/PackMan\graphic-disp.c ****             break;
  54:D:/PackMan/PackMan\graphic-disp.c ****         case B_CS2:
  55:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_clear(B_CS1);
  56:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_set(B_CS2);
  57:D:/PackMan/PackMan\graphic-disp.c ****             break;
  58:D:/PackMan/PackMan\graphic-disp.c ****         case B_CS1|B_CS2:
  59:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_set(B_CS1|B_CS2);
  60:D:/PackMan/PackMan\graphic-disp.c ****     }
  61:D:/PackMan/PackMan\graphic-disp.c **** }
 313              		.loc 1 61 0
 314 014a 1AE0     		b	.L22
 315              	.L18:
  45:D:/PackMan/PackMan\graphic-disp.c ****     switch(ctrl)
 316              		.loc 1 45 0
 317 014c 102B     		cmp	r3, #16
 318 014e 0DD0     		beq	.L20
 319 0150 182B     		cmp	r3, #24
 320 0152 12D0     		beq	.L21
 321              		.loc 1 61 0
 322 0154 15E0     		b	.L22
 323              	.L19:
  48:D:/PackMan/PackMan\graphic-disp.c ****             break;
 324              		.loc 1 48 0
 325 0156 1820     		movs	r0, #24
 326 0158 FFF7C6FF 		bl	graphic_cotrl_bit_clear
  49:D:/PackMan/PackMan\graphic-disp.c ****         case B_CS1:
 327              		.loc 1 49 0
 328 015c 11E0     		b	.L16
 329              	.L17:
  51:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_set(B_CS1);
 330              		.loc 1 51 0
 331 015e 1020     		movs	r0, #16
 332 0160 FFF7C2FF 		bl	graphic_cotrl_bit_clear
  52:D:/PackMan/PackMan\graphic-disp.c ****             break;
 333              		.loc 1 52 0
 334 0164 0820     		movs	r0, #8
 335 0166 FFF79DFF 		bl	graphic_cotrl_bit_set
  53:D:/PackMan/PackMan\graphic-disp.c ****         case B_CS2:
 336              		.loc 1 53 0
 337 016a 0AE0     		b	.L16
 338              	.L20:
  55:D:/PackMan/PackMan\graphic-disp.c ****             graphic_cotrl_bit_set(B_CS2);
 339              		.loc 1 55 0
 340 016c 0820     		movs	r0, #8
 341 016e FFF7BBFF 		bl	graphic_cotrl_bit_clear
  56:D:/PackMan/PackMan\graphic-disp.c ****             break;
 342              		.loc 1 56 0
 343 0172 1020     		movs	r0, #16
 344 0174 FFF796FF 		bl	graphic_cotrl_bit_set
  57:D:/PackMan/PackMan\graphic-disp.c ****         case B_CS1|B_CS2:
 345              		.loc 1 57 0
 346 0178 03E0     		b	.L16
 347              	.L21:
  59:D:/PackMan/PackMan\graphic-disp.c ****     }
 348              		.loc 1 59 0
 349 017a 1820     		movs	r0, #24
 350 017c FFF792FF 		bl	graphic_cotrl_bit_set
 351              		.loc 1 61 0
 352 0180 FFE7     		b	.L22
 353              	.L16:
 354              	.L22:
 355 0182 C046     		nop
 356 0184 BD46     		mov	sp, r7
 357 0186 02B0     		add	sp, sp, #8
 358              		@ sp needed
 359 0188 80BD     		pop	{r7, pc}
 360              		.cfi_endproc
 361              	.LFE4:
 363              		.align	1
 364              		.syntax unified
 365              		.code	16
 366              		.thumb_func
 367              		.fpu softvfp
 369              	graphic_write_cmd:
 370              	.LFB5:
  62:D:/PackMan/PackMan\graphic-disp.c **** 
  63:D:/PackMan/PackMan\graphic-disp.c **** static void graphic_write_cmd(uint8_t cmd, uint8_t ctrl)
  64:D:/PackMan/PackMan\graphic-disp.c **** {
 371              		.loc 1 64 0
 372              		.cfi_startproc
 373              		@ args = 0, pretend = 0, frame = 8
 374              		@ frame_needed = 1, uses_anonymous_args = 0
 375 018a 80B5     		push	{r7, lr}
 376              		.cfi_def_cfa_offset 8
 377              		.cfi_offset 7, -8
 378              		.cfi_offset 14, -4
 379 018c 82B0     		sub	sp, sp, #8
 380              		.cfi_def_cfa_offset 16
 381 018e 00AF     		add	r7, sp, #0
 382              		.cfi_def_cfa_register 7
 383 0190 0200     		movs	r2, r0
 384 0192 FB1D     		adds	r3, r7, #7
 385 0194 1A70     		strb	r2, [r3]
 386 0196 BB1D     		adds	r3, r7, #6
 387 0198 0A1C     		adds	r2, r1, #0
 388 019a 1A70     		strb	r2, [r3]
  65:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_E);
 389              		.loc 1 65 0
 390 019c 4020     		movs	r0, #64
 391 019e FFF7A3FF 		bl	graphic_cotrl_bit_clear
  66:D:/PackMan/PackMan\graphic-disp.c ****     select_controller(ctrl);
 392              		.loc 1 66 0
 393 01a2 BB1D     		adds	r3, r7, #6
 394 01a4 1B78     		ldrb	r3, [r3]
 395 01a6 1800     		movs	r0, r3
 396 01a8 FFF7C2FF 		bl	select_controller
  67:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_RS|B_RW);
 397              		.loc 1 67 0
 398 01ac 0320     		movs	r0, #3
 399 01ae FFF79BFF 		bl	graphic_cotrl_bit_clear
  68:D:/PackMan/PackMan\graphic-disp.c ****     graphic_write(cmd,ctrl);
 400              		.loc 1 68 0
 401 01b2 BB1D     		adds	r3, r7, #6
 402 01b4 1A78     		ldrb	r2, [r3]
 403 01b6 FB1D     		adds	r3, r7, #7
 404 01b8 1B78     		ldrb	r3, [r3]
 405 01ba 1100     		movs	r1, r2
 406 01bc 1800     		movs	r0, r3
 407 01be 00F023F9 		bl	graphic_write
  69:D:/PackMan/PackMan\graphic-disp.c **** }
 408              		.loc 1 69 0
 409 01c2 C046     		nop
 410 01c4 BD46     		mov	sp, r7
 411 01c6 02B0     		add	sp, sp, #8
 412              		@ sp needed
 413 01c8 80BD     		pop	{r7, pc}
 414              		.cfi_endproc
 415              	.LFE5:
 417              		.align	1
 418              		.syntax unified
 419              		.code	16
 420              		.thumb_func
 421              		.fpu softvfp
 423              	graphic_write_data:
 424              	.LFB6:
  70:D:/PackMan/PackMan\graphic-disp.c **** 
  71:D:/PackMan/PackMan\graphic-disp.c **** static void graphic_write_data(uint8_t data, uint8_t ctrl)
  72:D:/PackMan/PackMan\graphic-disp.c **** {
 425              		.loc 1 72 0
 426              		.cfi_startproc
 427              		@ args = 0, pretend = 0, frame = 8
 428              		@ frame_needed = 1, uses_anonymous_args = 0
 429 01ca 80B5     		push	{r7, lr}
 430              		.cfi_def_cfa_offset 8
 431              		.cfi_offset 7, -8
 432              		.cfi_offset 14, -4
 433 01cc 82B0     		sub	sp, sp, #8
 434              		.cfi_def_cfa_offset 16
 435 01ce 00AF     		add	r7, sp, #0
 436              		.cfi_def_cfa_register 7
 437 01d0 0200     		movs	r2, r0
 438 01d2 FB1D     		adds	r3, r7, #7
 439 01d4 1A70     		strb	r2, [r3]
 440 01d6 BB1D     		adds	r3, r7, #6
 441 01d8 0A1C     		adds	r2, r1, #0
 442 01da 1A70     		strb	r2, [r3]
  73:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_E);
 443              		.loc 1 73 0
 444 01dc 4020     		movs	r0, #64
 445 01de FFF783FF 		bl	graphic_cotrl_bit_clear
  74:D:/PackMan/PackMan\graphic-disp.c ****     select_controller(ctrl);
 446              		.loc 1 74 0
 447 01e2 BB1D     		adds	r3, r7, #6
 448 01e4 1B78     		ldrb	r3, [r3]
 449 01e6 1800     		movs	r0, r3
 450 01e8 FFF7A2FF 		bl	select_controller
  75:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_RW);
 451              		.loc 1 75 0
 452 01ec 0220     		movs	r0, #2
 453 01ee FFF77BFF 		bl	graphic_cotrl_bit_clear
  76:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_RS);
 454              		.loc 1 76 0
 455 01f2 0120     		movs	r0, #1
 456 01f4 FFF756FF 		bl	graphic_cotrl_bit_set
  77:D:/PackMan/PackMan\graphic-disp.c ****     graphic_write(data,ctrl);
 457              		.loc 1 77 0
 458 01f8 BB1D     		adds	r3, r7, #6
 459 01fa 1A78     		ldrb	r2, [r3]
 460 01fc FB1D     		adds	r3, r7, #7
 461 01fe 1B78     		ldrb	r3, [r3]
 462 0200 1100     		movs	r1, r2
 463 0202 1800     		movs	r0, r3
 464 0204 00F000F9 		bl	graphic_write
  78:D:/PackMan/PackMan\graphic-disp.c **** }
 465              		.loc 1 78 0
 466 0208 C046     		nop
 467 020a BD46     		mov	sp, r7
 468 020c 02B0     		add	sp, sp, #8
 469              		@ sp needed
 470 020e 80BD     		pop	{r7, pc}
 471              		.cfi_endproc
 472              	.LFE6:
 474              		.align	1
 475              		.syntax unified
 476              		.code	16
 477              		.thumb_func
 478              		.fpu softvfp
 480              	graphic_wait_ready:
 481              	.LFB7:
  79:D:/PackMan/PackMan\graphic-disp.c **** 
  80:D:/PackMan/PackMan\graphic-disp.c **** static void graphic_wait_ready()
  81:D:/PackMan/PackMan\graphic-disp.c **** {
 482              		.loc 1 81 0
 483              		.cfi_startproc
 484              		@ args = 0, pretend = 0, frame = 8
 485              		@ frame_needed = 1, uses_anonymous_args = 0
 486 0210 80B5     		push	{r7, lr}
 487              		.cfi_def_cfa_offset 8
 488              		.cfi_offset 7, -8
 489              		.cfi_offset 14, -4
 490 0212 82B0     		sub	sp, sp, #8
 491              		.cfi_def_cfa_offset 16
 492 0214 00AF     		add	r7, sp, #0
 493              		.cfi_def_cfa_register 7
  82:D:/PackMan/PackMan\graphic-disp.c ****     uint8_t c;
  83:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_E);
 494              		.loc 1 83 0
 495 0216 4020     		movs	r0, #64
 496 0218 FFF766FF 		bl	graphic_cotrl_bit_clear
  84:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_MODER = 0x00005555;
 497              		.loc 1 84 0
 498 021c 174B     		ldr	r3, .L31
 499 021e 184A     		ldr	r2, .L31+4
 500 0220 1A60     		str	r2, [r3]
  85:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_RS);
 501              		.loc 1 85 0
 502 0222 0120     		movs	r0, #1
 503 0224 FFF760FF 		bl	graphic_cotrl_bit_clear
  86:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_RW);
 504              		.loc 1 86 0
 505 0228 0220     		movs	r0, #2
 506 022a FFF73BFF 		bl	graphic_cotrl_bit_set
  87:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 507              		.loc 1 87 0
 508 022e FFF7FEFF 		bl	delay_250ns
  88:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 509              		.loc 1 88 0
 510 0232 FFF7FEFF 		bl	delay_250ns
 511              	.L28:
  89:D:/PackMan/PackMan\graphic-disp.c ****     
  90:D:/PackMan/PackMan\graphic-disp.c ****     while(1)
  91:D:/PackMan/PackMan\graphic-disp.c ****     {
  92:D:/PackMan/PackMan\graphic-disp.c ****         graphic_cotrl_bit_set(B_E);
 512              		.loc 1 92 0
 513 0236 4020     		movs	r0, #64
 514 0238 FFF734FF 		bl	graphic_cotrl_bit_set
  93:D:/PackMan/PackMan\graphic-disp.c ****         delay_250ns();
 515              		.loc 1 93 0
 516 023c FFF7FEFF 		bl	delay_250ns
  94:D:/PackMan/PackMan\graphic-disp.c ****         delay_250ns();
 517              		.loc 1 94 0
 518 0240 FFF7FEFF 		bl	delay_250ns
  95:D:/PackMan/PackMan\graphic-disp.c ****         c = DISPPORT->E_IDRLOW & LCD_BUSY;
 519              		.loc 1 95 0
 520 0244 0D4B     		ldr	r3, .L31
 521 0246 1B7C     		ldrb	r3, [r3, #16]
 522 0248 DAB2     		uxtb	r2, r3
 523 024a FB1D     		adds	r3, r7, #7
 524 024c 7F21     		movs	r1, #127
 525 024e 8A43     		bics	r2, r1
 526 0250 1A70     		strb	r2, [r3]
  96:D:/PackMan/PackMan\graphic-disp.c ****         graphic_cotrl_bit_clear(B_E);
 527              		.loc 1 96 0
 528 0252 4020     		movs	r0, #64
 529 0254 FFF748FF 		bl	graphic_cotrl_bit_clear
  97:D:/PackMan/PackMan\graphic-disp.c ****         delay_250ns();
 530              		.loc 1 97 0
 531 0258 FFF7FEFF 		bl	delay_250ns
  98:D:/PackMan/PackMan\graphic-disp.c ****         delay_250ns();
 532              		.loc 1 98 0
 533 025c FFF7FEFF 		bl	delay_250ns
  99:D:/PackMan/PackMan\graphic-disp.c ****         if(!c) break;
 534              		.loc 1 99 0
 535 0260 FB1D     		adds	r3, r7, #7
 536 0262 1B78     		ldrb	r3, [r3]
 537 0264 002B     		cmp	r3, #0
 538 0266 00D0     		beq	.L30
  92:D:/PackMan/PackMan\graphic-disp.c ****         delay_250ns();
 539              		.loc 1 92 0
 540 0268 E5E7     		b	.L28
 541              	.L30:
 542              		.loc 1 99 0
 543 026a C046     		nop
 100:D:/PackMan/PackMan\graphic-disp.c ****     }
 101:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_MODER = 0x55555555;
 544              		.loc 1 101 0
 545 026c 034B     		ldr	r3, .L31
 546 026e 054A     		ldr	r2, .L31+8
 547 0270 1A60     		str	r2, [r3]
 102:D:/PackMan/PackMan\graphic-disp.c **** }
 548              		.loc 1 102 0
 549 0272 C046     		nop
 550 0274 BD46     		mov	sp, r7
 551 0276 02B0     		add	sp, sp, #8
 552              		@ sp needed
 553 0278 80BD     		pop	{r7, pc}
 554              	.L32:
 555 027a C046     		.align	2
 556              	.L31:
 557 027c 00100240 		.word	1073876992
 558 0280 55550000 		.word	21845
 559 0284 55555555 		.word	1431655765
 560              		.cfi_endproc
 561              	.LFE7:
 563              		.align	1
 564              		.syntax unified
 565              		.code	16
 566              		.thumb_func
 567              		.fpu softvfp
 569              	graphic_read:
 570              	.LFB8:
 103:D:/PackMan/PackMan\graphic-disp.c **** 
 104:D:/PackMan/PackMan\graphic-disp.c **** static uint8_t graphic_read(uint8_t ctrl)
 105:D:/PackMan/PackMan\graphic-disp.c **** {
 571              		.loc 1 105 0
 572              		.cfi_startproc
 573              		@ args = 0, pretend = 0, frame = 16
 574              		@ frame_needed = 1, uses_anonymous_args = 0
 575 0288 80B5     		push	{r7, lr}
 576              		.cfi_def_cfa_offset 8
 577              		.cfi_offset 7, -8
 578              		.cfi_offset 14, -4
 579 028a 84B0     		sub	sp, sp, #16
 580              		.cfi_def_cfa_offset 24
 581 028c 00AF     		add	r7, sp, #0
 582              		.cfi_def_cfa_register 7
 583 028e 0200     		movs	r2, r0
 584 0290 FB1D     		adds	r3, r7, #7
 585 0292 1A70     		strb	r2, [r3]
 106:D:/PackMan/PackMan\graphic-disp.c ****     uint8_t c;
 107:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_E);
 586              		.loc 1 107 0
 587 0294 4020     		movs	r0, #64
 588 0296 FFF727FF 		bl	graphic_cotrl_bit_clear
 108:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_MODER = 0x00005555;
 589              		.loc 1 108 0
 590 029a 1E4B     		ldr	r3, .L37
 591 029c 1E4A     		ldr	r2, .L37+4
 592 029e 1A60     		str	r2, [r3]
 109:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_RS|B_RW);
 593              		.loc 1 109 0
 594 02a0 0320     		movs	r0, #3
 595 02a2 FFF7FFFE 		bl	graphic_cotrl_bit_set
 110:D:/PackMan/PackMan\graphic-disp.c ****     select_controller(ctrl);
 596              		.loc 1 110 0
 597 02a6 FB1D     		adds	r3, r7, #7
 598 02a8 1B78     		ldrb	r3, [r3]
 599 02aa 1800     		movs	r0, r3
 600 02ac FFF740FF 		bl	select_controller
 111:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 601              		.loc 1 111 0
 602 02b0 FFF7FEFF 		bl	delay_250ns
 112:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 603              		.loc 1 112 0
 604 02b4 FFF7FEFF 		bl	delay_250ns
 113:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_E);
 605              		.loc 1 113 0
 606 02b8 4020     		movs	r0, #64
 607 02ba FFF7F3FE 		bl	graphic_cotrl_bit_set
 114:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 608              		.loc 1 114 0
 609 02be FFF7FEFF 		bl	delay_250ns
 115:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 610              		.loc 1 115 0
 611 02c2 FFF7FEFF 		bl	delay_250ns
 116:D:/PackMan/PackMan\graphic-disp.c ****     c = DISPPORT->E_IDRHIGH;
 612              		.loc 1 116 0
 613 02c6 134A     		ldr	r2, .L37
 614 02c8 0F23     		movs	r3, #15
 615 02ca FB18     		adds	r3, r7, r3
 616 02cc 527C     		ldrb	r2, [r2, #17]
 617 02ce 1A70     		strb	r2, [r3]
 117:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_E);
 618              		.loc 1 117 0
 619 02d0 4020     		movs	r0, #64
 620 02d2 FFF709FF 		bl	graphic_cotrl_bit_clear
 118:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_MODER = 0x55555555;
 621              		.loc 1 118 0
 622 02d6 0F4B     		ldr	r3, .L37
 623 02d8 104A     		ldr	r2, .L37+8
 624 02da 1A60     		str	r2, [r3]
 119:D:/PackMan/PackMan\graphic-disp.c ****     
 120:D:/PackMan/PackMan\graphic-disp.c ****     if(ctrl & B_CS1)
 625              		.loc 1 120 0
 626 02dc FB1D     		adds	r3, r7, #7
 627 02de 1B78     		ldrb	r3, [r3]
 628 02e0 0822     		movs	r2, #8
 629 02e2 1340     		ands	r3, r2
 630 02e4 04D0     		beq	.L34
 121:D:/PackMan/PackMan\graphic-disp.c ****     {
 122:D:/PackMan/PackMan\graphic-disp.c ****         select_controller(B_CS1);
 631              		.loc 1 122 0
 632 02e6 0820     		movs	r0, #8
 633 02e8 FFF722FF 		bl	select_controller
 123:D:/PackMan/PackMan\graphic-disp.c ****         graphic_wait_ready();
 634              		.loc 1 123 0
 635 02ec FFF790FF 		bl	graphic_wait_ready
 636              	.L34:
 124:D:/PackMan/PackMan\graphic-disp.c ****     }
 125:D:/PackMan/PackMan\graphic-disp.c ****     if(ctrl & B_CS2)
 637              		.loc 1 125 0
 638 02f0 FB1D     		adds	r3, r7, #7
 639 02f2 1B78     		ldrb	r3, [r3]
 640 02f4 1022     		movs	r2, #16
 641 02f6 1340     		ands	r3, r2
 642 02f8 04D0     		beq	.L35
 126:D:/PackMan/PackMan\graphic-disp.c ****     {
 127:D:/PackMan/PackMan\graphic-disp.c ****         select_controller(B_CS2);
 643              		.loc 1 127 0
 644 02fa 1020     		movs	r0, #16
 645 02fc FFF718FF 		bl	select_controller
 128:D:/PackMan/PackMan\graphic-disp.c ****         graphic_wait_ready();
 646              		.loc 1 128 0
 647 0300 FFF786FF 		bl	graphic_wait_ready
 648              	.L35:
 129:D:/PackMan/PackMan\graphic-disp.c ****     }
 130:D:/PackMan/PackMan\graphic-disp.c ****     return c;
 649              		.loc 1 130 0
 650 0304 0F23     		movs	r3, #15
 651 0306 FB18     		adds	r3, r7, r3
 652 0308 1B78     		ldrb	r3, [r3]
 131:D:/PackMan/PackMan\graphic-disp.c **** }
 653              		.loc 1 131 0
 654 030a 1800     		movs	r0, r3
 655 030c BD46     		mov	sp, r7
 656 030e 04B0     		add	sp, sp, #16
 657              		@ sp needed
 658 0310 80BD     		pop	{r7, pc}
 659              	.L38:
 660 0312 C046     		.align	2
 661              	.L37:
 662 0314 00100240 		.word	1073876992
 663 0318 55550000 		.word	21845
 664 031c 55555555 		.word	1431655765
 665              		.cfi_endproc
 666              	.LFE8:
 668              		.align	1
 669              		.syntax unified
 670              		.code	16
 671              		.thumb_func
 672              		.fpu softvfp
 674              	graphic_read_data:
 675              	.LFB9:
 132:D:/PackMan/PackMan\graphic-disp.c **** 
 133:D:/PackMan/PackMan\graphic-disp.c **** static uint8_t graphic_read_data(uint8_t ctrl)
 134:D:/PackMan/PackMan\graphic-disp.c **** {
 676              		.loc 1 134 0
 677              		.cfi_startproc
 678              		@ args = 0, pretend = 0, frame = 8
 679              		@ frame_needed = 1, uses_anonymous_args = 0
 680 0320 80B5     		push	{r7, lr}
 681              		.cfi_def_cfa_offset 8
 682              		.cfi_offset 7, -8
 683              		.cfi_offset 14, -4
 684 0322 82B0     		sub	sp, sp, #8
 685              		.cfi_def_cfa_offset 16
 686 0324 00AF     		add	r7, sp, #0
 687              		.cfi_def_cfa_register 7
 688 0326 0200     		movs	r2, r0
 689 0328 FB1D     		adds	r3, r7, #7
 690 032a 1A70     		strb	r2, [r3]
 135:D:/PackMan/PackMan\graphic-disp.c ****     graphic_read(ctrl);
 691              		.loc 1 135 0
 692 032c FB1D     		adds	r3, r7, #7
 693 032e 1B78     		ldrb	r3, [r3]
 694 0330 1800     		movs	r0, r3
 695 0332 FFF7A9FF 		bl	graphic_read
 136:D:/PackMan/PackMan\graphic-disp.c ****     return graphic_read(ctrl);
 696              		.loc 1 136 0
 697 0336 FB1D     		adds	r3, r7, #7
 698 0338 1B78     		ldrb	r3, [r3]
 699 033a 1800     		movs	r0, r3
 700 033c FFF7A4FF 		bl	graphic_read
 701 0340 0300     		movs	r3, r0
 137:D:/PackMan/PackMan\graphic-disp.c **** }
 702              		.loc 1 137 0
 703 0342 1800     		movs	r0, r3
 704 0344 BD46     		mov	sp, r7
 705 0346 02B0     		add	sp, sp, #8
 706              		@ sp needed
 707 0348 80BD     		pop	{r7, pc}
 708              		.cfi_endproc
 709              	.LFE9:
 711              		.align	1
 712              		.global	backBuffer_pixel
 713              		.syntax unified
 714              		.code	16
 715              		.thumb_func
 716              		.fpu softvfp
 718              	backBuffer_pixel:
 719              	.LFB10:
 138:D:/PackMan/PackMan\graphic-disp.c **** 
 139:D:/PackMan/PackMan\graphic-disp.c **** void backBuffer_pixel(uint8_t x, uint8_t y, uint8_t set)
 140:D:/PackMan/PackMan\graphic-disp.c **** {
 720              		.loc 1 140 0
 721              		.cfi_startproc
 722              		@ args = 0, pretend = 0, frame = 16
 723              		@ frame_needed = 1, uses_anonymous_args = 0
 724 034a 90B5     		push	{r4, r7, lr}
 725              		.cfi_def_cfa_offset 12
 726              		.cfi_offset 4, -12
 727              		.cfi_offset 7, -8
 728              		.cfi_offset 14, -4
 729 034c 85B0     		sub	sp, sp, #20
 730              		.cfi_def_cfa_offset 32
 731 034e 00AF     		add	r7, sp, #0
 732              		.cfi_def_cfa_register 7
 733 0350 0400     		movs	r4, r0
 734 0352 0800     		movs	r0, r1
 735 0354 1100     		movs	r1, r2
 736 0356 FB1D     		adds	r3, r7, #7
 737 0358 221C     		adds	r2, r4, #0
 738 035a 1A70     		strb	r2, [r3]
 739 035c BB1D     		adds	r3, r7, #6
 740 035e 021C     		adds	r2, r0, #0
 741 0360 1A70     		strb	r2, [r3]
 742 0362 7B1D     		adds	r3, r7, #5
 743 0364 0A1C     		adds	r2, r1, #0
 744 0366 1A70     		strb	r2, [r3]
 141:D:/PackMan/PackMan\graphic-disp.c ****     uint8_t bit;
 142:D:/PackMan/PackMan\graphic-disp.c ****     
 143:D:/PackMan/PackMan\graphic-disp.c ****     if(x >= 128 || y >= 64) return;
 745              		.loc 1 143 0
 746 0368 FB1D     		adds	r3, r7, #7
 747 036a 1B78     		ldrb	r3, [r3]
 748 036c 5BB2     		sxtb	r3, r3
 749 036e 002B     		cmp	r3, #0
 750 0370 44DB     		blt	.L46
 751              		.loc 1 143 0 is_stmt 0 discriminator 1
 752 0372 BB1D     		adds	r3, r7, #6
 753 0374 1B78     		ldrb	r3, [r3]
 754 0376 3F2B     		cmp	r3, #63
 755 0378 40D8     		bhi	.L46
 144:D:/PackMan/PackMan\graphic-disp.c ****     
 145:D:/PackMan/PackMan\graphic-disp.c ****     bit = 1 <<(y%8);
 756              		.loc 1 145 0 is_stmt 1
 757 037a BB1D     		adds	r3, r7, #6
 758 037c 1B78     		ldrb	r3, [r3]
 759 037e 0722     		movs	r2, #7
 760 0380 1340     		ands	r3, r2
 761 0382 0122     		movs	r2, #1
 762 0384 9A40     		lsls	r2, r2, r3
 763 0386 0F23     		movs	r3, #15
 764 0388 FB18     		adds	r3, r7, r3
 765 038a 1A70     		strb	r2, [r3]
 146:D:/PackMan/PackMan\graphic-disp.c ****     
 147:D:/PackMan/PackMan\graphic-disp.c ****     if(set)
 766              		.loc 1 147 0
 767 038c 7B1D     		adds	r3, r7, #5
 768 038e 1B78     		ldrb	r3, [r3]
 769 0390 002B     		cmp	r3, #0
 770 0392 17D0     		beq	.L45
 148:D:/PackMan/PackMan\graphic-disp.c ****         backBuffer.byteArr[(x<<3)+(y/8)] |= bit;
 771              		.loc 1 148 0
 772 0394 FB1D     		adds	r3, r7, #7
 773 0396 1B78     		ldrb	r3, [r3]
 774 0398 DB00     		lsls	r3, r3, #3
 775 039a BA1D     		adds	r2, r7, #6
 776 039c 1278     		ldrb	r2, [r2]
 777 039e D208     		lsrs	r2, r2, #3
 778 03a0 D0B2     		uxtb	r0, r2
 779 03a2 0200     		movs	r2, r0
 780 03a4 9B18     		adds	r3, r3, r2
 781 03a6 174A     		ldr	r2, .L47
 782 03a8 D15C     		ldrb	r1, [r2, r3]
 783 03aa FB1D     		adds	r3, r7, #7
 784 03ac 1B78     		ldrb	r3, [r3]
 785 03ae DB00     		lsls	r3, r3, #3
 786 03b0 0200     		movs	r2, r0
 787 03b2 9B18     		adds	r3, r3, r2
 788 03b4 0F22     		movs	r2, #15
 789 03b6 BA18     		adds	r2, r7, r2
 790 03b8 1278     		ldrb	r2, [r2]
 791 03ba 0A43     		orrs	r2, r1
 792 03bc D1B2     		uxtb	r1, r2
 793 03be 114A     		ldr	r2, .L47
 794 03c0 D154     		strb	r1, [r2, r3]
 795 03c2 1CE0     		b	.L41
 796              	.L45:
 149:D:/PackMan/PackMan\graphic-disp.c ****     else
 150:D:/PackMan/PackMan\graphic-disp.c ****         backBuffer.byteArr[(x<<3)+(y/8)] &= ~bit;
 797              		.loc 1 150 0
 798 03c4 FB1D     		adds	r3, r7, #7
 799 03c6 1B78     		ldrb	r3, [r3]
 800 03c8 DB00     		lsls	r3, r3, #3
 801 03ca BA1D     		adds	r2, r7, #6
 802 03cc 1278     		ldrb	r2, [r2]
 803 03ce D208     		lsrs	r2, r2, #3
 804 03d0 D1B2     		uxtb	r1, r2
 805 03d2 0A00     		movs	r2, r1
 806 03d4 9B18     		adds	r3, r3, r2
 807 03d6 0B4A     		ldr	r2, .L47
 808 03d8 D35C     		ldrb	r3, [r2, r3]
 809 03da 5BB2     		sxtb	r3, r3
 810 03dc 0F22     		movs	r2, #15
 811 03de BA18     		adds	r2, r7, r2
 812 03e0 1278     		ldrb	r2, [r2]
 813 03e2 52B2     		sxtb	r2, r2
 814 03e4 D243     		mvns	r2, r2
 815 03e6 52B2     		sxtb	r2, r2
 816 03e8 1340     		ands	r3, r2
 817 03ea 5AB2     		sxtb	r2, r3
 818 03ec FB1D     		adds	r3, r7, #7
 819 03ee 1B78     		ldrb	r3, [r3]
 820 03f0 DB00     		lsls	r3, r3, #3
 821 03f2 5B18     		adds	r3, r3, r1
 822 03f4 D1B2     		uxtb	r1, r2
 823 03f6 034A     		ldr	r2, .L47
 824 03f8 D154     		strb	r1, [r2, r3]
 825 03fa 00E0     		b	.L41
 826              	.L46:
 143:D:/PackMan/PackMan\graphic-disp.c ****     
 827              		.loc 1 143 0
 828 03fc C046     		nop
 829              	.L41:
 151:D:/PackMan/PackMan\graphic-disp.c **** }
 830              		.loc 1 151 0
 831 03fe BD46     		mov	sp, r7
 832 0400 05B0     		add	sp, sp, #20
 833              		@ sp needed
 834 0402 90BD     		pop	{r4, r7, pc}
 835              	.L48:
 836              		.align	2
 837              	.L47:
 838 0404 00000000 		.word	backBuffer
 839              		.cfi_endproc
 840              	.LFE10:
 842              		.align	1
 843              		.syntax unified
 844              		.code	16
 845              		.thumb_func
 846              		.fpu softvfp
 848              	graphic_write:
 849              	.LFB11:
 152:D:/PackMan/PackMan\graphic-disp.c **** 
 153:D:/PackMan/PackMan\graphic-disp.c **** static void graphic_write(uint8_t value,uint8_t ctrl)
 154:D:/PackMan/PackMan\graphic-disp.c **** {
 850              		.loc 1 154 0
 851              		.cfi_startproc
 852              		@ args = 0, pretend = 0, frame = 8
 853              		@ frame_needed = 1, uses_anonymous_args = 0
 854 0408 80B5     		push	{r7, lr}
 855              		.cfi_def_cfa_offset 8
 856              		.cfi_offset 7, -8
 857              		.cfi_offset 14, -4
 858 040a 82B0     		sub	sp, sp, #8
 859              		.cfi_def_cfa_offset 16
 860 040c 00AF     		add	r7, sp, #0
 861              		.cfi_def_cfa_register 7
 862 040e 0200     		movs	r2, r0
 863 0410 FB1D     		adds	r3, r7, #7
 864 0412 1A70     		strb	r2, [r3]
 865 0414 BB1D     		adds	r3, r7, #6
 866 0416 0A1C     		adds	r2, r1, #0
 867 0418 1A70     		strb	r2, [r3]
 155:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_ODRHIGH = value;
 868              		.loc 1 155 0
 869 041a 1C4A     		ldr	r2, .L52
 870 041c FB1D     		adds	r3, r7, #7
 871 041e 1B78     		ldrb	r3, [r3]
 872 0420 5375     		strb	r3, [r2, #21]
 156:D:/PackMan/PackMan\graphic-disp.c ****     select_controller(ctrl);
 873              		.loc 1 156 0
 874 0422 BB1D     		adds	r3, r7, #6
 875 0424 1B78     		ldrb	r3, [r3]
 876 0426 1800     		movs	r0, r3
 877 0428 FFF782FE 		bl	select_controller
 157:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 878              		.loc 1 157 0
 879 042c FFF7FEFF 		bl	delay_250ns
 158:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 880              		.loc 1 158 0
 881 0430 FFF7FEFF 		bl	delay_250ns
 159:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_E);
 882              		.loc 1 159 0
 883 0434 4020     		movs	r0, #64
 884 0436 FFF735FE 		bl	graphic_cotrl_bit_set
 160:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 885              		.loc 1 160 0
 886 043a FFF7FEFF 		bl	delay_250ns
 161:D:/PackMan/PackMan\graphic-disp.c ****     delay_250ns();
 887              		.loc 1 161 0
 888 043e FFF7FEFF 		bl	delay_250ns
 162:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_clear(B_E);
 889              		.loc 1 162 0
 890 0442 4020     		movs	r0, #64
 891 0444 FFF750FE 		bl	graphic_cotrl_bit_clear
 163:D:/PackMan/PackMan\graphic-disp.c ****     
 164:D:/PackMan/PackMan\graphic-disp.c ****     if(ctrl & B_CS1)
 892              		.loc 1 164 0
 893 0448 BB1D     		adds	r3, r7, #6
 894 044a 1B78     		ldrb	r3, [r3]
 895 044c 0822     		movs	r2, #8
 896 044e 1340     		ands	r3, r2
 897 0450 04D0     		beq	.L50
 165:D:/PackMan/PackMan\graphic-disp.c ****     {
 166:D:/PackMan/PackMan\graphic-disp.c ****         select_controller(B_CS1);
 898              		.loc 1 166 0
 899 0452 0820     		movs	r0, #8
 900 0454 FFF76CFE 		bl	select_controller
 167:D:/PackMan/PackMan\graphic-disp.c ****         graphic_wait_ready();
 901              		.loc 1 167 0
 902 0458 FFF7DAFE 		bl	graphic_wait_ready
 903              	.L50:
 168:D:/PackMan/PackMan\graphic-disp.c ****     }
 169:D:/PackMan/PackMan\graphic-disp.c ****     
 170:D:/PackMan/PackMan\graphic-disp.c ****     if(ctrl & B_CS2)
 904              		.loc 1 170 0
 905 045c BB1D     		adds	r3, r7, #6
 906 045e 1B78     		ldrb	r3, [r3]
 907 0460 1022     		movs	r2, #16
 908 0462 1340     		ands	r3, r2
 909 0464 04D0     		beq	.L51
 171:D:/PackMan/PackMan\graphic-disp.c ****     {
 172:D:/PackMan/PackMan\graphic-disp.c ****         select_controller(B_CS2);
 910              		.loc 1 172 0
 911 0466 1020     		movs	r0, #16
 912 0468 FFF762FE 		bl	select_controller
 173:D:/PackMan/PackMan\graphic-disp.c ****         graphic_wait_ready();
 913              		.loc 1 173 0
 914 046c FFF7D0FE 		bl	graphic_wait_ready
 915              	.L51:
 174:D:/PackMan/PackMan\graphic-disp.c ****     }
 175:D:/PackMan/PackMan\graphic-disp.c ****     
 176:D:/PackMan/PackMan\graphic-disp.c ****     DISPPORT->E_ODRHIGH = 0;
 916              		.loc 1 176 0
 917 0470 064B     		ldr	r3, .L52
 918 0472 0022     		movs	r2, #0
 919 0474 5A75     		strb	r2, [r3, #21]
 177:D:/PackMan/PackMan\graphic-disp.c ****     graphic_cotrl_bit_set(B_E);
 920              		.loc 1 177 0
 921 0476 4020     		movs	r0, #64
 922 0478 FFF714FE 		bl	graphic_cotrl_bit_set
 178:D:/PackMan/PackMan\graphic-disp.c ****     select_controller(0);
 923              		.loc 1 178 0
 924 047c 0020     		movs	r0, #0
 925 047e FFF757FE 		bl	select_controller
 179:D:/PackMan/PackMan\graphic-disp.c **** }
 926              		.loc 1 179 0
 927 0482 C046     		nop
 928 0484 BD46     		mov	sp, r7
 929 0486 02B0     		add	sp, sp, #8
 930              		@ sp needed
 931 0488 80BD     		pop	{r7, pc}
 932              	.L53:
 933 048a C046     		.align	2
 934              	.L52:
 935 048c 00100240 		.word	1073876992
 936              		.cfi_endproc
 937              	.LFE11:
 939              		.align	1
 940              		.global	graphic_write_backBuffer
 941              		.syntax unified
 942              		.code	16
 943              		.thumb_func
 944              		.fpu softvfp
 946              	graphic_write_backBuffer:
 947              	.LFB12:
 180:D:/PackMan/PackMan\graphic-disp.c **** 
 181:D:/PackMan/PackMan\graphic-disp.c **** void graphic_write_backBuffer()
 182:D:/PackMan/PackMan\graphic-disp.c **** {
 948              		.loc 1 182 0
 949              		.cfi_startproc
 950              		@ args = 0, pretend = 0, frame = 16
 951              		@ frame_needed = 1, uses_anonymous_args = 0
 952 0490 80B5     		push	{r7, lr}
 953              		.cfi_def_cfa_offset 8
 954              		.cfi_offset 7, -8
 955              		.cfi_offset 14, -4
 956 0492 84B0     		sub	sp, sp, #16
 957              		.cfi_def_cfa_offset 24
 958 0494 00AF     		add	r7, sp, #0
 959              		.cfi_def_cfa_register 7
 960              	.LBB3:
 183:D:/PackMan/PackMan\graphic-disp.c ****     for(int page = 0; page < 8; page++)
 961              		.loc 1 183 0
 962 0496 0023     		movs	r3, #0
 963 0498 FB60     		str	r3, [r7, #12]
 964 049a 46E0     		b	.L55
 965              	.L60:
 184:D:/PackMan/PackMan\graphic-disp.c ****     {
 185:D:/PackMan/PackMan\graphic-disp.c ****         graphic_write_cmd(LCD_SET_ADD, B_CS1);
 966              		.loc 1 185 0
 967 049c 0821     		movs	r1, #8
 968 049e 4020     		movs	r0, #64
 969 04a0 FFF773FE 		bl	graphic_write_cmd
 186:D:/PackMan/PackMan\graphic-disp.c ****         graphic_write_cmd(LCD_SET_PAGE|page,B_CS1);
 970              		.loc 1 186 0
 971 04a4 FB68     		ldr	r3, [r7, #12]
 972 04a6 5BB2     		sxtb	r3, r3
 973 04a8 4822     		movs	r2, #72
 974 04aa 5242     		rsbs	r2, r2, #0
 975 04ac 1343     		orrs	r3, r2
 976 04ae 5BB2     		sxtb	r3, r3
 977 04b0 DBB2     		uxtb	r3, r3
 978 04b2 0821     		movs	r1, #8
 979 04b4 1800     		movs	r0, r3
 980 04b6 FFF768FE 		bl	graphic_write_cmd
 981              	.LBB4:
 187:D:/PackMan/PackMan\graphic-disp.c ****         
 188:D:/PackMan/PackMan\graphic-disp.c ****         for(int adr = 0; adr < 64; adr++)
 982              		.loc 1 188 0
 983 04ba 0023     		movs	r3, #0
 984 04bc BB60     		str	r3, [r7, #8]
 985 04be 0CE0     		b	.L56
 986              	.L57:
 189:D:/PackMan/PackMan\graphic-disp.c ****             graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS1);
 987              		.loc 1 189 0 discriminator 3
 988 04c0 BB68     		ldr	r3, [r7, #8]
 989 04c2 DA00     		lsls	r2, r3, #3
 990 04c4 FB68     		ldr	r3, [r7, #12]
 991 04c6 D318     		adds	r3, r2, r3
 992 04c8 1B4A     		ldr	r2, .L61
 993 04ca D35C     		ldrb	r3, [r2, r3]
 994 04cc 0821     		movs	r1, #8
 995 04ce 1800     		movs	r0, r3
 996 04d0 FFF77BFE 		bl	graphic_write_data
 188:D:/PackMan/PackMan\graphic-disp.c ****             graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS1);
 997              		.loc 1 188 0 discriminator 3
 998 04d4 BB68     		ldr	r3, [r7, #8]
 999 04d6 0133     		adds	r3, r3, #1
 1000 04d8 BB60     		str	r3, [r7, #8]
 1001              	.L56:
 188:D:/PackMan/PackMan\graphic-disp.c ****             graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS1);
 1002              		.loc 1 188 0 is_stmt 0 discriminator 1
 1003 04da BB68     		ldr	r3, [r7, #8]
 1004 04dc 3F2B     		cmp	r3, #63
 1005 04de EFDD     		ble	.L57
 1006              	.LBE4:
 190:D:/PackMan/PackMan\graphic-disp.c ****         
 191:D:/PackMan/PackMan\graphic-disp.c ****         graphic_write_cmd(LCD_SET_ADD, B_CS2);
 1007              		.loc 1 191 0 is_stmt 1
 1008 04e0 1021     		movs	r1, #16
 1009 04e2 4020     		movs	r0, #64
 1010 04e4 FFF751FE 		bl	graphic_write_cmd
 192:D:/PackMan/PackMan\graphic-disp.c ****         graphic_write_cmd(LCD_SET_PAGE|page,B_CS2);
 1011              		.loc 1 192 0
 1012 04e8 FB68     		ldr	r3, [r7, #12]
 1013 04ea 5BB2     		sxtb	r3, r3
 1014 04ec 4822     		movs	r2, #72
 1015 04ee 5242     		rsbs	r2, r2, #0
 1016 04f0 1343     		orrs	r3, r2
 1017 04f2 5BB2     		sxtb	r3, r3
 1018 04f4 DBB2     		uxtb	r3, r3
 1019 04f6 1021     		movs	r1, #16
 1020 04f8 1800     		movs	r0, r3
 1021 04fa FFF746FE 		bl	graphic_write_cmd
 1022              	.LBB5:
 193:D:/PackMan/PackMan\graphic-disp.c ****         
 194:D:/PackMan/PackMan\graphic-disp.c ****         for(int adr = 64; adr < 128; adr++)
 1023              		.loc 1 194 0
 1024 04fe 4023     		movs	r3, #64
 1025 0500 7B60     		str	r3, [r7, #4]
 1026 0502 0CE0     		b	.L58
 1027              	.L59:
 195:D:/PackMan/PackMan\graphic-disp.c ****             graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS2);
 1028              		.loc 1 195 0 discriminator 3
 1029 0504 7B68     		ldr	r3, [r7, #4]
 1030 0506 DA00     		lsls	r2, r3, #3
 1031 0508 FB68     		ldr	r3, [r7, #12]
 1032 050a D318     		adds	r3, r2, r3
 1033 050c 0A4A     		ldr	r2, .L61
 1034 050e D35C     		ldrb	r3, [r2, r3]
 1035 0510 1021     		movs	r1, #16
 1036 0512 1800     		movs	r0, r3
 1037 0514 FFF759FE 		bl	graphic_write_data
 194:D:/PackMan/PackMan\graphic-disp.c ****             graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS2);
 1038              		.loc 1 194 0 discriminator 3
 1039 0518 7B68     		ldr	r3, [r7, #4]
 1040 051a 0133     		adds	r3, r3, #1
 1041 051c 7B60     		str	r3, [r7, #4]
 1042              	.L58:
 194:D:/PackMan/PackMan\graphic-disp.c ****             graphic_write_data(backBuffer.byteArr[(adr<<3)+(page)],B_CS2);
 1043              		.loc 1 194 0 is_stmt 0 discriminator 1
 1044 051e 7B68     		ldr	r3, [r7, #4]
 1045 0520 7F2B     		cmp	r3, #127
 1046 0522 EFDD     		ble	.L59
 1047              	.LBE5:
 183:D:/PackMan/PackMan\graphic-disp.c ****     {
 1048              		.loc 1 183 0 is_stmt 1 discriminator 2
 1049 0524 FB68     		ldr	r3, [r7, #12]
 1050 0526 0133     		adds	r3, r3, #1
 1051 0528 FB60     		str	r3, [r7, #12]
 1052              	.L55:
 183:D:/PackMan/PackMan\graphic-disp.c ****     {
 1053              		.loc 1 183 0 is_stmt 0 discriminator 1
 1054 052a FB68     		ldr	r3, [r7, #12]
 1055 052c 072B     		cmp	r3, #7
 1056 052e B5DD     		ble	.L60
 1057              	.LBE3:
 196:D:/PackMan/PackMan\graphic-disp.c ****     }
 197:D:/PackMan/PackMan\graphic-disp.c **** }
 1058              		.loc 1 197 0 is_stmt 1
 1059 0530 C046     		nop
 1060 0532 BD46     		mov	sp, r7
 1061 0534 04B0     		add	sp, sp, #16
 1062              		@ sp needed
 1063 0536 80BD     		pop	{r7, pc}
 1064              	.L62:
 1065              		.align	2
 1066              	.L61:
 1067 0538 00000000 		.word	backBuffer
 1068              		.cfi_endproc
 1069              	.LFE12:
 1071              		.align	1
 1072              		.global	write_to_buffer
 1073              		.syntax unified
 1074              		.code	16
 1075              		.thumb_func
 1076              		.fpu softvfp
 1078              	write_to_buffer:
 1079              	.LFB13:
 198:D:/PackMan/PackMan\graphic-disp.c **** 
 199:D:/PackMan/PackMan\graphic-disp.c **** void write_to_buffer(unsigned char* image,uint8_t width,uint8_t height, uint8_t _x, uint8_t _y)
 200:D:/PackMan/PackMan\graphic-disp.c **** {
 1080              		.loc 1 200 0
 1081              		.cfi_startproc
 1082              		@ args = 4, pretend = 0, frame = 16
 1083              		@ frame_needed = 1, uses_anonymous_args = 0
 1084 053c 90B5     		push	{r4, r7, lr}
 1085              		.cfi_def_cfa_offset 12
 1086              		.cfi_offset 4, -12
 1087              		.cfi_offset 7, -8
 1088              		.cfi_offset 14, -4
 1089 053e 85B0     		sub	sp, sp, #20
 1090              		.cfi_def_cfa_offset 32
 1091 0540 00AF     		add	r7, sp, #0
 1092              		.cfi_def_cfa_register 7
 1093 0542 7860     		str	r0, [r7, #4]
 1094 0544 0C00     		movs	r4, r1
 1095 0546 1000     		movs	r0, r2
 1096 0548 1900     		movs	r1, r3
 1097 054a FB1C     		adds	r3, r7, #3
 1098 054c 221C     		adds	r2, r4, #0
 1099 054e 1A70     		strb	r2, [r3]
 1100 0550 BB1C     		adds	r3, r7, #2
 1101 0552 021C     		adds	r2, r0, #0
 1102 0554 1A70     		strb	r2, [r3]
 1103 0556 7B1C     		adds	r3, r7, #1
 1104 0558 0A1C     		adds	r2, r1, #0
 1105 055a 1A70     		strb	r2, [r3]
 1106              	.LBB6:
 201:D:/PackMan/PackMan\graphic-disp.c ****     for(int x=0; x < width; x++)
 1107              		.loc 1 201 0
 1108 055c 0023     		movs	r3, #0
 1109 055e FB60     		str	r3, [r7, #12]
 1110 0560 44E0     		b	.L64
 1111              	.L70:
 1112              	.LBB7:
 202:D:/PackMan/PackMan\graphic-disp.c ****         for(int y=0; y < height; y++)
 1113              		.loc 1 202 0
 1114 0562 0023     		movs	r3, #0
 1115 0564 BB60     		str	r3, [r7, #8]
 1116 0566 39E0     		b	.L65
 1117              	.L69:
 203:D:/PackMan/PackMan\graphic-disp.c ****             backBuffer_pixel(x + _x, y + _y, (image[x/8 + y*(width/8 + 1)]>>(x%8))%2);
 1118              		.loc 1 203 0 discriminator 3
 1119 0568 FB68     		ldr	r3, [r7, #12]
 1120 056a DAB2     		uxtb	r2, r3
 1121 056c 7B1C     		adds	r3, r7, #1
 1122 056e 1B78     		ldrb	r3, [r3]
 1123 0570 D318     		adds	r3, r2, r3
 1124 0572 D8B2     		uxtb	r0, r3
 1125 0574 BB68     		ldr	r3, [r7, #8]
 1126 0576 DAB2     		uxtb	r2, r3
 1127 0578 2023     		movs	r3, #32
 1128 057a FB18     		adds	r3, r7, r3
 1129 057c 1B78     		ldrb	r3, [r3]
 1130 057e D318     		adds	r3, r2, r3
 1131 0580 D9B2     		uxtb	r1, r3
 1132 0582 FB68     		ldr	r3, [r7, #12]
 1133 0584 002B     		cmp	r3, #0
 1134 0586 00DA     		bge	.L66
 1135 0588 0733     		adds	r3, r3, #7
 1136              	.L66:
 1137 058a DB10     		asrs	r3, r3, #3
 1138 058c 1C00     		movs	r4, r3
 1139 058e FB1C     		adds	r3, r7, #3
 1140 0590 1B78     		ldrb	r3, [r3]
 1141 0592 DB08     		lsrs	r3, r3, #3
 1142 0594 DBB2     		uxtb	r3, r3
 1143 0596 0133     		adds	r3, r3, #1
 1144 0598 BA68     		ldr	r2, [r7, #8]
 1145 059a 5343     		muls	r3, r2
 1146 059c E318     		adds	r3, r4, r3
 1147 059e 1A00     		movs	r2, r3
 1148 05a0 7B68     		ldr	r3, [r7, #4]
 1149 05a2 9B18     		adds	r3, r3, r2
 1150 05a4 1B78     		ldrb	r3, [r3]
 1151 05a6 1C00     		movs	r4, r3
 1152 05a8 FB68     		ldr	r3, [r7, #12]
 1153 05aa 154A     		ldr	r2, .L71
 1154 05ac 1340     		ands	r3, r2
 1155 05ae 04D5     		bpl	.L67
 1156 05b0 013B     		subs	r3, r3, #1
 1157 05b2 0822     		movs	r2, #8
 1158 05b4 5242     		rsbs	r2, r2, #0
 1159 05b6 1343     		orrs	r3, r2
 1160 05b8 0133     		adds	r3, r3, #1
 1161              	.L67:
 1162 05ba 1C41     		asrs	r4, r4, r3
 1163 05bc 2300     		movs	r3, r4
 1164 05be 114A     		ldr	r2, .L71+4
 1165 05c0 1340     		ands	r3, r2
 1166 05c2 04D5     		bpl	.L68
 1167 05c4 013B     		subs	r3, r3, #1
 1168 05c6 0222     		movs	r2, #2
 1169 05c8 5242     		rsbs	r2, r2, #0
 1170 05ca 1343     		orrs	r3, r2
 1171 05cc 0133     		adds	r3, r3, #1
 1172              	.L68:
 1173 05ce DBB2     		uxtb	r3, r3
 1174 05d0 1A00     		movs	r2, r3
 1175 05d2 FFF7FEFF 		bl	backBuffer_pixel
 202:D:/PackMan/PackMan\graphic-disp.c ****         for(int y=0; y < height; y++)
 1176              		.loc 1 202 0 discriminator 3
 1177 05d6 BB68     		ldr	r3, [r7, #8]
 1178 05d8 0133     		adds	r3, r3, #1
 1179 05da BB60     		str	r3, [r7, #8]
 1180              	.L65:
 202:D:/PackMan/PackMan\graphic-disp.c ****         for(int y=0; y < height; y++)
 1181              		.loc 1 202 0 is_stmt 0 discriminator 1
 1182 05dc BB1C     		adds	r3, r7, #2
 1183 05de 1B78     		ldrb	r3, [r3]
 1184 05e0 BA68     		ldr	r2, [r7, #8]
 1185 05e2 9A42     		cmp	r2, r3
 1186 05e4 C0DB     		blt	.L69
 1187              	.LBE7:
 201:D:/PackMan/PackMan\graphic-disp.c ****     for(int x=0; x < width; x++)
 1188              		.loc 1 201 0 is_stmt 1 discriminator 2
 1189 05e6 FB68     		ldr	r3, [r7, #12]
 1190 05e8 0133     		adds	r3, r3, #1
 1191 05ea FB60     		str	r3, [r7, #12]
 1192              	.L64:
 201:D:/PackMan/PackMan\graphic-disp.c ****     for(int x=0; x < width; x++)
 1193              		.loc 1 201 0 is_stmt 0 discriminator 1
 1194 05ec FB1C     		adds	r3, r7, #3
 1195 05ee 1B78     		ldrb	r3, [r3]
 1196 05f0 FA68     		ldr	r2, [r7, #12]
 1197 05f2 9A42     		cmp	r2, r3
 1198 05f4 B5DB     		blt	.L70
 1199              	.LBE6:
 204:D:/PackMan/PackMan\graphic-disp.c **** }...
 1200              		.loc 1 204 0 is_stmt 1
 1201 05f6 C046     		nop
 1202 05f8 BD46     		mov	sp, r7
 1203 05fa 05B0     		add	sp, sp, #20
 1204              		@ sp needed
 1205 05fc 90BD     		pop	{r4, r7, pc}
 1206              	.L72:
 1207 05fe C046     		.align	2
 1208              	.L71:
 1209 0600 07000080 		.word	-2147483641
 1210 0604 01000080 		.word	-2147483647
 1211              		.cfi_endproc
 1212              	.LFE13:
 1214              	.Letext0:
 1215              		.file 2 "D:/PackMan/PackMan/GPIO.h"
 1216              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1217              		.file 4 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 1218              		.file 5 "D:/PackMan/PackMan/graphic-disp.h"
