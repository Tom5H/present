.PHONY: help init all handout presentation bib

help:
	@echo "********************************************************"
	@echo "LaTeX Beamer presentation builder"
	@echo "********************************************************"
	@echo "GNU make program to run commands to build commented and"
	@echo "uncommented versions of a LaTeX beamer presentations"
	@echo "run:"
	@echo "--------------------------------------------------------"
	@echo "make help          :  this page"
	@echo "make               :  same as make handout"
	@echo "make init          :  calls make handout and"
	@echo "                   :  make presentation"
	@echo "make handout       :  presentation with comments"
	@echo "make presentation  :  presentation without comments"
	@echo "make bib           :  run biber for commented and"
	@echo "                   :  uncommented presentation"
	@echo "make all           :  presentation with comments and"
	@echo "                   :  presentation without comments"
	@echo "                   :  and bibliography"
	@echo "--------------------------------------------------------"

init: handout presentation

all: bib handout presentation

handout:
	@cd tex; \
	lualatex -shell-escape -aux-directory=.build \
	-output-directory=.build handout.tex
	@mv tex/.build/handout.pdf handout.pdf
	                           ########### name of the output pdf file

presentation:
	@cd tex; \
	lualatex -shell-escape -aux-directory=.build \
	-output-directory=.build presentation.tex
	@mv tex/.build/presentation.pdf presentation.pdf
	                                ################ name of the output pdf file

bib:
	@cd tex; \
	biber .build/handout; biber .build/presentation
