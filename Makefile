CONFIG=config.env
include ${CONFIG}

all: build run

build:
	latexmk -pdf ${NAME}.tex
run:
	evince ${NAME}.pdf &
compose:
	docker-compose -f docker-compose.yml up --build
stop:
	docker-compose down
docker:
	docker build -f Dockerfile --build-arg NAME=${NAME} --build-arg CONFIG=${CONFIG} -t latex_img .
	docker run -it -v ${PWD}:/root/ans:Z --rm --name latex_doc latex_img
