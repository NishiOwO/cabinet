P = generic

CC = cc
CFLAGS = -O2 -DHAVE_CONFIG_H -DPCRE_STATIC
LDFLAGS =
LIBS =

# Cabinet
OBJS = src/cabinet/main.o src/cabinet/gui.o

# STB
OBJS += src/stb/stb_ds.o src/stb/stb_image.o

# PCRE
OBJS += src/pcre/pcre_byte_order.o src/pcre/pcre_chartables.o src/pcre/pcre_compile.o src/pcre/pcre_config.o src/pcre/pcre_dfa_exec.o src/pcre/pcre_exec.o src/pcre/pcre_fullinfo.o src/pcre/pcre_get.o src/pcre/pcre_globals.o src/pcre/pcre_maketables.o src/pcre/pcre_newline.o src/pcre/pcre_ord2utf8.o src/pcre/pcre_refcount.o src/pcre/pcre_string_utils.o src/pcre/pcre_study.o src/pcre/pcre_tables.o src/pcre/pcre_ucd.o src/pcre/pcre_valid_utf8.o src/pcre/pcre_version.o src/pcre/pcre_xclass.o

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
	clang-format --verbose -i `find src/cabinet -name "*.c" -or -name "*.h"`

clean:
	rm -f cabinet cabinet.exe src/*.o src/*/*.o src/*.res
