cp Makefile ..
cp example.env ..
cp doc.tex ../main.tex
cp assets ..
cp sections ..
sed -i 's/config.env/example.env/' ../Makefile
