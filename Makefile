# Top-level Makefile

# List of all puzzle directories
PUZZLES := $(wildcard Puzzle*)

# Phony targets
.PHONY: all clean test $(PUZZLES)

# Default target
all: $(PUZZLES)

# Target for each puzzle
$(PUZZLES):
	@echo "Building $@"
	@$(MAKE) -C $@

# Clean target
clean:
	@for dir in $(PUZZLES); do \
		echo "Cleaning $$dir"; \
		$(MAKE) -C $$dir clean; \
	done

# Test target
test: $(PUZZLES)
	@echo "Running tests for all puzzles"
	@for dir in $(PUZZLES); do \
		echo "Testing $$dir"; \
		$(MAKE) -C $$dir test || exit 1; \
	done
	@echo "All tests passed successfully!"

# Targets for individual puzzles
makePuzzle%:
	@$(MAKE) -C Puzzle$*