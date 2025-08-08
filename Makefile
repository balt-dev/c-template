SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=obj/%.o)
HEADER = $(wildcard src/*.h)
OUT = dist/fbwm

CFLAGS = -I./lib/include
LDFLAGS = -L./lib

obj dist:
	mkdir -p $@

obj/%.o: src/%.c $(HEADER) | obj
	$(CC) $(CFLAGS) -c $< -o $@

$(OUT): $(OBJ) | dist
	$(CC) -shared $(OBJ) $(LDFLAGS) $(LIBS) -o $@

compile: $(OBJ)

build: $(OUT)

clean:
	rm -rf obj/* dist/*

all: clean compile build