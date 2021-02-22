source config.env
if [ "$LANG" == "rus" ]
then
	sed -i 's/\[english\]/\[english,russian\]/' preamble.tex
fi
if [ "$LANG" == "eng" ]
then
        sed -i 's/\[english,russian\]/\[english\]/' preamble.tex
fi
cp Makefile ..
cp example.env ..
cp doc.tex ../main.tex
cp -r assets ..
cp -r sections ..

sed -i 's/config.env/example.env/' ../Makefile
sed -i 's/\\input{sections\/example}/%\\input{sections\/example}/' ../main.tex
