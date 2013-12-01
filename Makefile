CC=ocamlc
src=bouncyballs.ml
dest=build/bouncyballs

all:
	$(CC) graphics.cma $(src) -o $(dest)
	./$(dest)
