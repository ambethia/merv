CFLAGS 	= -Wall
MRUBY 	= vendor/mruby
MRBC 		= $(MRUBY)/bin/mrbc
TARGET  = merv

all: bin/merv

bin/$(TARGET): $(MRUBY)/bin/mrbc build/main.o
	$(CC) $(CFLAGS) -o bin/$(TARGET) build/main.o -l mruby -L $(MRUBY)/build/host/lib

build/main.o: src/main.c build/$(TARGET)_bin.h
	$(CC) $(CFLAGS) -o build/main.o -c src/main.c -I ./build -I $(MRUBY)/include

build/$(TARGET)_bin.h: build/merv.rb src/*.rb
	$(MRBC) -B $(TARGET)_bin -o build/$(TARGET)_bin.h build/$(TARGET).rb

vendor/mrubymix/bin/mrubymix:
	git submodule update --init

$(MRUBY)/bin/mrbc: build_config.rb
	git submodule update --init
	$(MAKE) -C $(MRUBY) MRUBY_CONFIG=../../build_config.rb

build/merv.rb: vendor/mrubymix/bin/mrubymix src/*.rb
	ruby ./vendor/mrubymix/bin/mrubymix src/merv.rb build/merv.rb

build/merv_test.rb: vendor/mrubymix/bin/mrubymix src/*.rb test/*.rb
	ruby ./vendor/mrubymix/bin/mrubymix test/merv_test.rb build/merv_test.rb

test: $(MRUBY)/bin/mrbc build/merv_test.rb
	@$(MRUBY)/bin/mruby build/merv_test.rb

clean:
	cd $(MRUBY) && git reset --hard && git clean -fdx
	rm -f bin/merv build/*.o build/*.h build/*.rb

.PHONY: all test clean
