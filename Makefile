P = generic

CC = cc
CFLAGS = -O2
LDFLAGS =
LIBS =

OBJS = src/main.o src/ds.o
EXEC =

include mk/$(P).mk

.PHONY: all format clean
.SUFFIXES: .c .o .rc .res

all: cabinet$(EXEC)

cabinet$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

.rc.res:
	$(RC) -O coff $< $@

format:
	clang-format --verbose -i `find src '(' -name "*.c" -or -name "*.h" ')' -and -not -name "stb_ds.h"`

clean:
	rm -f cabinet cabinet.exe src/*.o src/*/*.o src/*.res
