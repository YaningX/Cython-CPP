CC = g++
CFLAGS = -Wall -Werror
LFLAGS =
TARGET = libtime.so

.PYONY: all clean

all: $(TARGET)

$(TARGET): time.o date.o
	$(CC) $(CFLAGS) -shared -o $@ $^ $(LFLAGS)

time.o: time.cpp time.h date.h
	$(CC) $(CFLAGS) -c -fpic -o $@ $< $(LFLAGS)

date.o: date.cpp date.h
	$(CC) $(CFLAGS) -c -fpic -o $@ $< $(LFLAGS)

clean:
	rm -f *.o *.so *~