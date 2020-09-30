cp Makefile ..
cp example.env ..
cp doc.tex ../main.tex
cp -r assets ..
cp -r sections ..
sed -i 's/config.env/example.env/' ../Makefile
sed -i 's/\\input{sections\/example}/%/' ../main.tex
