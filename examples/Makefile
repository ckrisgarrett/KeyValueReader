# Builds the main.c example
# Uses the gcc compiler
# Notice, you also need to link with the c++ standard library "-lstdc++"

.PHONY: build
build:
	gcc -Wall main.c ../lib/libKeyValueReader.a -lstdc++ -o ex_c.x
	gfortran -Wall ../include/KeyValueReader.f90 main.f90 ../lib/libKeyValueReader.a -lstdc++ -o ex_f90.x

