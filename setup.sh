#!/bin/bash

varmistus(){
	read -n1 -rsp $'Luettuasi ja ymmärrettyäsi yllä olevan tekstin, paina ANY-näppäintä.\nKeskeytys normaalisti CTRL+C:llä.\n'
}


clear

[ $UID -eq 0 ] && echo "Skriptiä ei tule ajaa sudona, jotta ladottujen dokumenttien käyttöoikeudet pysyvät kunnossa. Skriptissä ajetaan pakettien asennus sudona erikseen." && exit 1

echo "Sudona ajetaan vain ja ainoastaan pakettien asentaminen. Alla lyhyet selostukset siitä, mitä asennetaan ja miksi. Kaikki löytyvät ainakin Debian Jessien main-repositorystä."
echo "Asennettavat paketit:"
echo " * texlive, texlive-latex-recommended, texlive-latex-extra, texlive-lang-european - tarvittavat paketit, jotta dokumenttien latominen onnistuu"
echo " * make - Makefilujen käyttäminen on kätevää ja tämä työkalu tarvitaan vain ja ainoastaan siksi"
echo " * tree - Työkalu hakemistopolun tekemiseen"
echo " * inotify-tools - Mahdollistaa makron, jonka avulla dokumentteja voidaan latoa automaattisesti"
echo ""
varmistus

clear

sudo apt-get install texlive texlive-latex-recommended texlive-latex-extra texlive-lang-european make tree inotify-tools
echo ""
echo ""
echo ""
echo ""


echo "Paketit toivon mukaan asennettu oikein, seuraavaksi ladotaan dokumentit. Tässä saattaa kestää muutama minuutti, mikäli jokainen mahdollinen dokumentti ladotaan. Odota kärsivällisesti, niin kauan kuin latominen ei pysähdy, kaikki on OK. :)"
echo ""

varmistus

clear

make

clear

tree -l
echo "Dokumentit ladottu."
echo "Muista lukea README.md!!!"
