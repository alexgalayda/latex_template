FROM blang/latex

ARG NAME
ARG CONFIG

RUN apt-get update && apt-get install -y \
    biber \
    vim

WORKDIR /root
COPY $CONFIG $CONFIG
COPY Makefile Makefile
COPY $NAME $NAME
COPY preamble.tex preamble.tex
COPY bibliography.bib bibliography.bib
ADD sections ./sections
ADD assets ./assets
RUN mkdir ./ans
CMD make build; chmod +777 doc.pdf; mv doc.pdf ./ans
