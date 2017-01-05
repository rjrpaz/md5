CC = gcc

CFLAGS = -O2 -Wall

LDFLAGS = -lcrypto -lssl

TARGET = mddriver

all: $(TARGET)

.c.o: *.h
	$(CC) -c $(CFLAGS) $<

md5c.o: md5c.c md5.h global.h
	$(CC) -c $(CFLAGS) md5c.c

mddriver.o: mddriver.c
	$(CC) -c $(CFLAGS) mddriver.c

mddriver: md5c.o mddriver.o
	$(CC) $(CFLAGS) mddriver.o md5c.o -o mddriver $(LDFLAGS)

clean:
	$(RM) $(TARGET) *.o *~
