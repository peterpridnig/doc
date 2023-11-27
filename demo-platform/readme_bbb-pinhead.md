#BEAGLEBONE BLACK EVALUATION PLATFORM
pridnig, 28.10.2023

## DCDC
5V -> BBB
10V -> MEMS

## LEDs
Pin P8_14 red
Pin P8_16 green
Pin P8_17 pin
Pin P8_18 input (external pcb, connected to switch)
Pin P8_15 input (ads1015)

## OLED
SSD1306 (sbc oled01 joyit)
/dev/i2c-2 0x3c

## GPS
()
/dev/ttyS4, uart4

## ADC
ads1015
/dev/i2c-2, 0x48
ready P8_15

## ACCELEROMETER
AD MEMS

## LCD
/dev/i2c-2, 0x??

## FTDI debug console
/dev/con, uart0

## FTDI i/o
/dev/ttyS1, uart1

