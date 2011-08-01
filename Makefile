SOURCE_DIR=src
EBIN_DIR=ebin
DOC_DIR=doc
INCLUDE_DIR=include
INCLUDES=$(wildcard $(INCLUDE_DIR)/*.hrl)
SOURCES=$(wildcard $(SOURCE_DIR)/*.erl)
TARGETS=$(patsubst $(SOURCE_DIR)/%.erl, $(EBIN_DIR)/%.beam,$(SOURCES))
ERLC_OPTS=-I $(INCLUDE_DIR) -o $(EBIN_DIR) -Wall +debug_info # +native -v

all: $(EBIN_DIR) $(TARGETS)

$(EBIN_DIR)/%.beam: $(SOURCE_DIR)/%.erl $(INCLUDES)
	erlc $(ERLC_OPTS) $<

$(EBIN_DIR):
	mkdir -p $(EBIN_DIR)

clean:
	rm -f ebin/*.beam
	rm -f $(TARGETS)
	rm -f doc/*
	rmdir ebin
