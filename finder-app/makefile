CC=gcc
ifeq ($(CROSS_COMPILE), aarch64-none-linux-gnu-)
	CC=$(CROSS_COMPILE)gcc
endif

CFLAGS=-Wall

all: writer

writer:writer.o
	$(CC) $(CFLAGS) writer.o -o writer

clean:
	rm -f writer writer.o
