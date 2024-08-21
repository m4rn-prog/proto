exec = proto.out
sources = $(wildcard src/*.c)
objects = $(sources:.c=.o)
flags = -g


$(exec): $(objects)
	gcc $(objects) $(flags) -o $(exec)

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

install:
	make
	mv ./proto.out /home/marneusc/.local/bin/proto

clean:
	-rm *.out
	-rm *.o
	-rm src/*.o
