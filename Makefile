P = generic

CC = cc
CFLAGS = -O2
LDFLAGS =
LIBS =

OBJS = src/main.o src/ds.o
EXEC =

include mk/$(P).mk

.PHONY: all clean
.SUFFIXES: .c .o .rc .res

all: cabinet$(EXEC)

cabinet$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

.rc.res:
	$(RC) -O coff $< $@

clean:
	rm -f cabinet cabinet.exe src/*.o src/*/*.o src/*.res
