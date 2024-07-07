# Top-level Makefile

# List of all puzzle directories
PUZZLES := $(wildcard Puzzle*)

# Phony targets
.PHONY: all clean $(PUZZLES)

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

# Targets for individual puzzles
makePuzzle%:
	@$(MAKE) -C Puzzle$*
