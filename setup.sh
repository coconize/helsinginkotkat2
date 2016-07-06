#!/bin/bash

clear

[ $UID -eq 0 ] && echo "Skriptiä ei tule ajaa sudona, jotta ladottujen dokumenttien käyttöoikeudet pysyvät kunnossa. Skriptissä ajetaan pakettien asennus sudona erikseen." && exit 1

echo "sudona ajetaan vain ja ainoastaan pakettien asentaminen"

secs='5 4 3 2 1 0'

for second in $secs;do
	echo $second
	sleep 1
done

sudo apt-get install texlive texlive-latex-recommended texlive-latex-extra texlive-lang-european make tree inotify-tools 

clear

echo "seuraavaksi ladotaan dokumentit"

secs='5 4 3 2 1 0'

for second in $secs;do
	echo $second
	sleep 1
done

make

clear

echo "Dokumentit ladottu. Symboliset linkit .pdf-tiedostoihin löytyvät kansiosta walpuri-public."
echo "Muista lukea README.md!!!"
tree -l
