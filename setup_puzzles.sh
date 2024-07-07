#!/bin/bash

# Create top-level Makefile
cat > Makefile << EOL
# Top-level Makefile

# List of all puzzle directories
PUZZLES := \$(wildcard Puzzle*)

# Phony targets
.PHONY: all clean \$(PUZZLES)

# Default target
all: \$(PUZZLES)

# Target for each puzzle
\$(PUZZLES):
	@echo "Building \$@"
	@\$(MAKE) -C \$@

# Clean target
clean:
	@for dir in \$(PUZZLES); do \\
		echo "Cleaning \$\$dir"; \\
		\$(MAKE) -C \$\$dir clean; \\
	done

# Targets for individual puzzles
makePuzzle%:
	@\$(MAKE) -C Puzzle\$*
EOL

# Create puzzle directories and Makefiles
for i in {1..25}; do
    mkdir -p Puzzle$i
    cat > Puzzle$i/Makefile << EOL
# Makefile for Puzzle$i

# Compiler and flags
CC := gcc
CFLAGS := -std=c11 -Wall -Wextra -pedantic

# Binary name
TARGET := puzzle$i

# Source files
SRCS := \$(wildcard *.c)
OBJS := \$(SRCS:.c=.o)

# Phony targets
.PHONY: all clean test run

# Default target
all: \$(TARGET)

# Linking
\$(TARGET): \$(OBJS)
	\$(CC) \$(CFLAGS) -o \$@ \$^

# Compiling
%.o: %.c
	\$(CC) \$(CFLAGS) -c \$<

# Test target (customize as needed)
test: \$(TARGET)
	@echo "Running tests for \$(TARGET)"
	# Add your test commands here

# Run target
run: \$(TARGET)
	./\$(TARGET)

# Clean target
clean:
	rm -f \$(TARGET) \$(OBJS)
EOL

    echo "Created Puzzle$i/Makefile"
done

echo "Setup complete. Created top-level Makefile and 25 puzzle directories with Makefiles."