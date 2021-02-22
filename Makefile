.PHONY: all build run compose stop docker clear
CONFIG=config.env
include ${CONFIG}

#all: build run
all: compose

build:
	pdflatex ${NAME}.tex
	biber ${NAME}
	makeglossaries ${NAME}
	pdflatex ${NAME}.tex
run:
	evince ${NAME}.pdf &
compose:
	docker-compose -f ${COMPOSE_PATH} --env-file ${CONFIG} up --build
stop:
	docker-compose down
docker:
	docker build -f Dockerfile --build-arg NAME=${NAME} --build-arg CONFIG=${CONFIG} -t latex_img .
	docker run -it -v ${PWD}:/root/ans:Z --rm --name latex_doc latex_img
clear:
	rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.toc *.bbl *bcf *.blg *.xml *.snm *.nav
	rm -f *.acn *.acr *.alg *.glg *.glo *.gls *.ist
