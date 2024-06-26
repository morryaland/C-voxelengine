BUILD_NAME=voxelengine
BUILD_STATUS:=DEBUG

CC=gcc
OPT=3

PREFIX_SRC= ./src/
PREFIX_OBJ= ./obj/
PREFIX_BIN= ./bin/

SRC= main.c octree.o point_cloud.c voxel.c core.c
OBJ= main.o octree.o point_cloud.o voxel.o core.o

SRC:= $(addprefix $(PREFIX_SRC), $(SRC))
OBJ:= $(addprefix $(PREFIX_OBJ), $(OBJ))

FLUGS+= -lm -lX11 
CFLUGS+= -Wall -O$(OPT)

ifeq ($(BUILD_STATUS),DEBUG)
	CFLUGS+= -D DEBUG
endif

$(PREFIX_BIN)$(BUILD_NAME) : $(OBJ)
	mkdir -p $(PREFIX_BIN)
	$(CC) $(OBJ) -o $(PREFIX_BIN)$(BUILD_NAME) $(FLUGS)
	ln -f $(PREFIX_BIN)$(BUILD_NAME) $(BUILD_NAME)

$(PREFIX_OBJ)%.o : $(PREFIX_SRC)%.c
	mkdir -p $(PREFIX_OBJ)
	$(CC) -c $< -o $@ $(CFLUGS)

clean :
	rm -fr $(PREFIX_BIN)* $(PREFIX_OBJ)*.o
	rm $(BUILD_NAME)
