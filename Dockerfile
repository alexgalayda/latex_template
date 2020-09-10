FROM blang/latex

ARG NAME
ARG CONFIG
ARG PROJECT_PATH
ARG TEMPLATE_PATH
ENV NAME $NAME

RUN apt-get update && apt-get install -y \
    biber \
    vim

WORKDIR /root
COPY $PROJECT_PATH/$CONFIG $CONFIG
COPY $PROJECT_PATH/Makefile Makefile
COPY $PROJECT_PATH/$NAME.tex $NAME.tex
COPY $TEMPLATE_PATH/preamble.tex preamble.tex
COPY $TEMPLATE_PATH/bibliography.bib bibliography.bib
ADD $PROJECT_PATH/sections ./sections
ADD $PROJECT_PATH/assets ./assets
RUN mkdir ./ans
CMD make build; chmod +777 $NAME.pdf; mv $NAME.pdf ./ans
