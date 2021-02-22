FROM blang/latex:ubuntu
ARG PROJECT_PATH
ARG TEMPLATE_PATH

RUN apt-get update && apt-get install -y \
	biber \
	vim 

WORKDIR /root
ADD $TEMPLATE_PATH app
ADD $PROJECT_PATH app

RUN mkdir ./ans
WORKDIR ./app
CMD make build; mv $NAME.pdf ../ans
