CFLAGS 	= -g -Wall
MRUBY 	= vendor/mruby
MRBC 		= $(MRUBY)/bin/mrbc

all: bin/merv

bin/merv: mruby build/main.o
	$(CC) $(CFLAGS) -o bin/merv build/main.o -lmruby -lm -L$(MRUBY)/build/host/lib

build/main.o: src/main.c build/main_rb_bin.h
	$(CC) $(CFLAGS) -o build/main.o -c src/main.c -I ./build -I $(MRUBY)/include

build/main_rb_bin.h: src/main.rb
	$(MRBC) -B main_rb_bin -o build/main_rb_bin.h src/main.rb

mruby: $(MRBC)

$(MRUBY)/bin/mrbc:
	git submodule update --init
	$(MAKE) -C $(MRUBY) MRUBY_CONFIG=../../build_config.rb

clean:
	cd $(MRUBY) && git reset --hard && git clean -fdx
	rm -f bin/merv build/main.o build/main_rb_bin.h

.PHONY: all mruby clean .FORCE
