TARGET = opengl

BUILD_DIR = bin
OBJ_DIR = obj
OBJ_FILES = main.o
OBJS = $(patsubst %,$(OBJ_DIR)/%,$(OBJ_FILES))

CC = g++
CFLAGS = -Wall -Werror

all: $(BUILD_DIR)/$(TARGET)

# Compile the target
#$@ means the target. $^ means all prerequisites (objects)
$(BUILD_DIR)/$(TARGET) : $(OBJS)
		$(CC) $(CFLAGS) -o $@ $^ 

#For each object needed by target compile the object
#$< means the first prerequisite (%.cpp. for the file name.cpp)
$(OBJ_DIR)/%.o : %.cpp
		$(CC) $(CFLAGS) -c $< -o $@

clean : 
	del $(OBJ_DIR)\*.o