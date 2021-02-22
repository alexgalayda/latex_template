FROM blang/latex:ubuntu
ARG NAME
ARG CONFIG
ARG PROJECT_PATH
ARG TEMPLATE_PATH
ENV NAME $NAME

RUN apt-get update && apt-get install -y \
	biber \
	vim 

WORKDIR /root
ADD $PROJECT_PATH app
#COPY $PROJECT_PATH/$CONFIG $CONFIG
#COPY $PROJECT_PATH/Makefile Makefile
#COPY $PROJECT_PATH/$NAME.tex $NAME.tex
#ADD $PROJECT_PATH/sections ./sections
#ADD $PROJECT_PATH/assets ./assets

#COPY $TEMPLATE_PATH/preamble.tex preamble.tex
#COPY $TEMPLATE_PATH/glossary.tex glossary.tex
#COPY $TEMPLATE_PATH/tipa.tex tipa.tex
#COPY $TEMPLATE_PATH/bibliography.bib bibliography.bib

RUN mkdir ./ans
WORKDIR ./app
#CMD make build; chmod +777 $NAME.pdf; mv $NAME.pdf ../ans
CMD make build; mv $NAME.pdf ../ans
