LEX = flex
YACC = bison -d
CC = gcc
CFLAGS = -Iinclude

# Cibles finales et intermédiaires
PROG = analyseur
SRC_DIR = src
INCLUDE_DIR = include
BIN_DIR = bin

# Fichiers sources et en-tête
MAIN_SRC = main.c
GRAMMAIRE_SRC = $(SRC_DIR)/grammaire.tab.c
LEX_SRC = $(SRC_DIR)/lex.yy.c
OBJS = $(BIN_DIR)/main.o $(BIN_DIR)/grammaire.tab.o $(BIN_DIR)/lex.yy.o

# Règle par défaut
all: $(PROG)

# Compilation du programme
$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Génération des fichiers lex.yy.c et grammaire.tab.c
$(GRAMMAIRE_SRC): grammaire.y
	$(YACC) -o $@ $<

$(LEX_SRC): lex.l
	$(LEX) -o $@ $<

# Compilation des fichiers sources
$(BIN_DIR)/%.o: $(SRC_DIR)/%.c $(INCLUDE_DIR)/%.h
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ -c $<

$(BIN_DIR)/main.o: main.c
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ -c $<

$(BIN_DIR)/grammaire.tab.o: $(GRAMMAIRE_SRC)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ -c $<

$(BIN_DIR)/lex.yy.o: $(LEX_SRC)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ -c $<

# Nettoyage des fichiers générés
clean:
	rm -f $(PROG) $(OBJS) $(GRAMMAIRE_SRC) $(GRAMMAIRE_SRC:.c=.h) $(LEX_SRC)
	rm -rf $(BIN_DIR)

# Exécution du programme
run: $(PROG)
	./$(PROG)

# Dépendances
$(GRAMMAIRE_SRC): grammaire.y
$(LEX_SRC): lex.l

.PHONY: all clean run
