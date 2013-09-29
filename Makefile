RM = rm -f
FLAGS =  -Cr -O1 -gv -gw -g -vw
builddir = ./build/
TD = ./tasks/
SHELL := /bin/bash

targets=$(shell for file in `find . -maxdepth 1 -name '*.pas' -type f -printf "%f\n" | \
		  sed 's/\..*/\.exe/'`; do echo "$$file "; done;)

all: $(targets)

%.exe:%.pas
	fpc $< $(FLAGS) -o$(builddir)$@

clean:
	$(RM) $(builddir)*

