#The target we are building
TARGET = opengl.exe

#The directories where stuff goes
BUILD_DIR = bin
OBJ_DIR = obj

#The objects we build
OBJ_FILES = main.o
OBJS = $(patsubst %,$(OBJ_DIR)/%,$(OBJ_FILES))

#Libraries linked
LIB_DIR = -L dependencies/GLFW/lib

#Include file search directories
INC_DIR = -I dependencies/GLFW/include

#Flags for the compiler
CC = g++
CFLAGS = -Wall -Werror $(INC_DIR) $(LIB_DIR) 
LINKED_LIBS = -lglfw3 -lopengl32 -lgdi32

all: directories $(BUILD_DIR)/$(TARGET)

directories :
		if not exist ./$(BUILD_DIR) then @mkdir $(BUILD_DIR)
		if not exist ./$(OBJ_DIR) then @mkdir $(OBJ_DIR)

# Compile the target
#$@ means the target. $^ means all prerequisites (objects)
$(BUILD_DIR)/$(TARGET) : $(OBJS)
		$(CC) $(CFLAGS) -o $@ $^ $(LINKED_LIBS)

#For each object needed by target compile the object
#$< means the first prerequisite (%.cpp. for the file name.cpp)
$(OBJ_DIR)/%.o : %.cpp
		$(CC) $(CFLAGS) -c $< -o $@

clean : 
	del $(OBJ_DIR)\*.o