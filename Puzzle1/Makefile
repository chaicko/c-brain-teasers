# Makefile for Puzzle1

# Compiler and flags
CC := gcc
CFLAGS := -std=c11 -Wall -Wextra -pedantic -D_POSIX_C_SOURCE=200112L

# Binary name
TARGET := count

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

# Test target
test: $(TARGET)
	@echo "Running tests for $(TARGET)"
	@./$(TARGET) test_input.txt > test_output.txt
	@diff test_output.txt expected_output.txt && echo "Test passed!" || (echo "Test failed!"; exit 1)

# Run target
run: $(TARGET)
	./$(TARGET)

# Clean target
clean:
	rm -f $(TARGET) $(OBJS)
