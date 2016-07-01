TEX1=toke
TEX2=toke2s
#TEX2=joku
#TEX3=jokutointn
#jne...

all:
	make -C osiot
	make $(TEX1).pdf	#Tähän lisätään kaikki kansiosta löytyvät ladottavat filut
	make $(TEX2).pdf
	make clean		#Poistetaan samalla tarpeeton tauhka, lopputuloksena .tex- ja .pdf-filut

#Näitä lisää tarpeen mukaan, jokaiselle filulle oma sääntö
$(TEX1).pdf: $(TEX1).tex
	pdflatex $(TEX1).tex
	pdflatex $(TEX1).tex

$(TEX2).pdf: $(TEX2).tex
	pdflatex $(TEX2).tex
	pdflatex $(TEX2).tex

yksipuoleinen: $(TEX1).tex
	pdflatex $(TEX1).tex
	pdflatex $(TEX1).tex

kaksipuoleinen: $(TEX2).tex
	pdflatex $(TEX2).tex
	pdflatex $(TEX2).tex
#Makro, joka vahtii tiedostoa ja latoo sen aina uudelleen kun tiedosto tallennetaan tekstieditorista käsin.
watch1:
	@while [ 1 ]; do inotifywait $(TEX1).tex; sleep 0.1; make all; done

#Poistaa tauhkat
clean:
	rm -rf *~ *.log *.out *.aux *.toc *.snm *.nav *.bbl *.blg	
