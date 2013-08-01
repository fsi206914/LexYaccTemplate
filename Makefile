LEX=flex
YACC=bison
CC=g++
OBJECT=main			#���ɵ�Ŀ���ļ�

$(OBJECT): lex.yy.o  yacc.tab.o parse.o
	$(CC) lex.yy.o yacc.tab.o parse.o -o $(OBJECT)
	@./$(OBJECT)	#�������������

lex.yy.o: lex.yy.c  yacc.tab.h  main.h
	$(CC) -c lex.yy.c

yacc.tab.o: yacc.tab.c  main.h
	$(CC) -c yacc.tab.c

yacc.tab.c  yacc.tab.h: yacc.y
#	bisonʹ��-d��������.y�ļ�
	$(YACC) -d yacc.y

lex.yy.c: lex.l
	$(LEX) lex.l

parse.o: parse.cc
	$(CC) -c parse.cc

clean:
	@rm -f $(OBJECT)  *.o
