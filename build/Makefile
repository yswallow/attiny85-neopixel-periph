neopixel.out:
	avr-gcc -mmcu=attiny85 -o neopixel.out ../neopixel/neopixel.S

neopixel.hex: neopixel.out
	avr-objcopy -O ihex neopixel.out neopixel.hex

avrdude: neopixel.hex
	avrdude -pattiny85 -carduino -P/dev/ttyACM0 -b19200 -Uflash:w:neopixel.hex:i

clean:
	rm neopixel.out

