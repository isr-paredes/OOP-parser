# How to run the parser flex parser.l
flex parser.l
bison -d -t parser.y

gcc lex.yy.c parser.tab.c
