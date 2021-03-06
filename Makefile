#!/usr/bin/make -rf

all: link dependencies venv

link:
	test -s /usr/local/bin/chci || sudo ln -s ${PWD}/interpreter.py /usr/local/bin/chci
	chmod u+x ${PWD}/interpreter.py

test: all
	$(CURDIR)/venv/bin/python -m unittest "tests.py"


dependencies:
	virtualenv --version
	python3 --version
	pip3 --version

venv:
	virtualenv -p python3 venv

clean:
	rm -rf venv
	sudo rm -f /usr/local/bin/chci

.PHONY: all clean link dependencies venv
