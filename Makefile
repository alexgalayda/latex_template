.PHONY: all build run compose stop clear
CONFIG=config.env
include ${CONFIG}

#all: build run
all: compose attach

build:
	pdflatex ${NAME}.tex
	biber ${NAME}
	makeglossaries ${NAME}
	pdflatex ${NAME}.tex
run:
	evince ${NAME}.pdf &
compose:
	docker-compose -f ${COMPOSE_PATH} --env-file ${CONFIG} up --build --detach
attach:
	docker attach ${CONTAINER}
stop:
	docker-compose down
clear:
	rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.toc *.bbl *bcf *.blg *.xml *.snm *.nav
	rm -f *.acn *.acr *.alg *.glg *.glo *.gls *.ist
