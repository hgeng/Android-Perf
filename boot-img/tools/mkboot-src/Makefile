CC=gcc
SRC=src

mkbootfs : $(SRC)/android_filesystem_config.h $(SRC)/mkbootfs.c
	$(CC) -o mkbootfs $(SRC)/mkbootfs.c

rsa.o :  $(SRC)/rsa.h  $(SRC)/rsa.c
	$(CC) -c $(SRC)/rsa.c 

sha.o :  $(SRC)/sha.h  $(SRC)/sha.c
	$(CC) -c  $(SRC)/sha.c 

mkbootimg :  rsa.o  sha.o
	$(CC) rsa.o sha.o -o mkbootimg $(SRC)/mkbootimg.c

clean :
	rm *.o
	rm mkbootfs
	rm mkbootimg

all :
	make mkbootfs
	make mkbootimg