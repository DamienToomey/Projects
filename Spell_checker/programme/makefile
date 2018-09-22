SRCDIR=src
LIBDIR=lib
BINDIR=bin
INCLUDEDIR=include
TESTDIR=tests
DOCDIR=doc
RAPPORTDIR=../rapport
CC=gcc
AR=ar
CFLAGS=-Wall -pedantic -g -I$(INCLUDEDIR)
EXEC=asispell

.PHONY : doc
.PHONY : rapport

all : programme tests doc rapport

tests : testsLCM testsE testsAbN testsMot testsDico testsCO

programme : $(BINDIR)/$(EXEC)

testsLCM : $(SRCDIR)/mot.o  $(SRCDIR)/listeChaineeMot.o  $(SRCDIR)/listeChaineeMotTU.o
		$(CC) -o $(TESTDIR)/testLCM $^ -lcunit
		$(shell mkdir -p $(TESTDIR))

testsE : $(SRCDIR)/mot.o  $(SRCDIR)/listeChaineeMot.o  $(SRCDIR)/ensemble.o $(SRCDIR)/ensembleTU.o
			$(CC) -o $(TESTDIR)/testE $^ -lcunit
			$(shell mkdir -p $(TESTDIR))

testsAbN : $(SRCDIR)/mot.o  $(SRCDIR)/arbreN.o $(SRCDIR)/arbreNTU.o
			$(CC) -o $(TESTDIR)/testAbN $^ -lcunit
			$(shell mkdir -p $(TESTDIR))

testsMot : $(SRCDIR)/mot.o  $(SRCDIR)/motTU.o
			$(CC) -o $(TESTDIR)/testMot $^ -lcunit
			$(shell mkdir -p $(TESTDIR))

testsDico : $(SRCDIR)/mot.o  $(SRCDIR)/arbreN.o $(SRCDIR)/dictionnaire.o $(SRCDIR)/existeFichier.o $(SRCDIR)/dictionnaireTU.o
			$(CC) -o $(TESTDIR)/testDico $^ -lcunit
			$(shell mkdir -p $(TESTDIR))

testsCO : $(SRCDIR)/mot.o $(SRCDIR)/listeChaineeMot.o $(SRCDIR)/ensemble.o $(SRCDIR)/correcteurOrthographique.o $(SRCDIR)/arbreN.o $(SRCDIR)/dictionnaire.o $(SRCDIR)/existeFichier.o $(SRCDIR)/correcteurOrthographiqueTU.o
			$(CC) -o $(TESTDIR)/testCO $^ -lcunit
			$(shell mkdir -p $(TESTDIR))

$(BINDIR)/$(EXEC) : $(SRCDIR)/main.o $(SRCDIR)/arbreN.o $(SRCDIR)/affichages.o $(LIBDIR)/libmot.a $(SRCDIR)/existeFichier.o $(SRCDIR)/dictionnaire.o $(LIBDIR)/libcorrecteurOrthographique.a
			$(CC) -o $@ $^

$(LIBDIR)/libmot.a : $(SRCDIR)/mot.o $(SRCDIR)/ensemble.o $(SRCDIR)/listeChaineeMot.o
	$(AR) -r $@ $^
	$(shell mkdir -p $(LIBDIR))
	$(shell mkdir -p $(BINDIR)) 

$(LIBDIR)/libcorrecteurOrthographique.a : $(SRCDIR)/correcteurOrthographique.o
	$(AR) -r $@ $^

$(SRCDIR)/%.o : $(SRCDIR)/%.c
			$(CC) -o $@ -c $^ $(CFLAGS)

doc : 
	$(shell mkdir -p $(DOCDIR))
	doxygen ./Doxyfile

rapport :
			cd $(RAPPORTDIR) && pdflatex rapport.tex && pdflatex rapport.tex

clean :
	rm -f $(BINDIR)/asispell
	rm -f $(TESTDIR)/*
	rm -f $(SRCDIR)/*.o
	rm -f $(LIBDIR)/*
	rm -rf $(DOCDIR)/*
	rm -f $(RAPPORTDIR)/*.aux
	rm -f $(RAPPORTDIR)/*.log
	rm -f $(RAPPORTDIR)/*.out
	rm -f $(RAPPORTDIR)/*.pdf
	rm -f $(RAPPORTDIR)/*.synctex.gz
	rm -f $(RAPPORTDIR)/*.toc
	rm -f dicoTest.txt
