CXXFLAGS = -g -Wall -std=c++14
# LDFLAGS = 

OBJDIR = obj
BINDIR = bin
SRCDIR = .

#Name of executable
EXEC = main

#Source files
SRC_FILES = main.cpp

#Object files based on source files
O_FILES = $(SRC_FILES:%.cpp=%.o)

#######################################################
# Additional rules make should know about to compile
#######################################################

all : $(EXEC)

$(EXEC) : $(O_FILES)

depend:
		makedepend -- $(CXXFLAGS) -- -Y $(SRC_FILES)


clean : 
		del $(O_FILES) core *.rpo
