# Makefile for Puzzle2

# Compiler and flags
CC := gcc
CFLAGS := -std=c11 -Wall -Wextra -pedantic

# Binary name
TARGET := fraction

# Source files
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

# Phony targets
.PHONY: all clean test run

# Default target
all: $(TARGET)

# Linking
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Compiling
%.o: %.c
	$(CC) $(CFLAGS) -c $<

# Test target (customize as needed)
test: $(TARGET)
	@echo "Running tests for $(TARGET)"
	# Add your test commands here

# Run target
run: $(TARGET)
	./$(TARGET)

# Clean target
clean:
	rm -f $(TARGET) $(OBJS)
