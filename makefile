output = .output
rnwfile = Sweave_MCQ
backup = .backup

all:
	R CMD Sweave $(rnwfile).Rnw
	-mkdir $(output)
	-cp *.sty $(output)
	-mv *.tex *.pdf *.eps $(output)
	cd $(output); texify --run-viewer --pdf $(rnwfile).tex 

tex:
	cd $(output); texify --run-viewer --pdf $(rnwfile).tex

clean:
	-rm $(output)/*
	
backup:
	-mkdir $(backup)
	cp 	$(output)/$(rnwfile).pdf $(backup)/$(rnwfile).pdf 