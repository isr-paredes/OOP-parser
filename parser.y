%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int is_oop = 0;

void yyerror(const char *s);
int yylex(void);
%}

%union {
  char* str;
}

%token <str> IDENTIFIER
%token CLASS STRUCT PUBLIC PRIVATE PROTECTED VIRTUAL OVERRIDE
%token SCOPE COLON LBRACE RBRACE LPAREN RPAREN SEMICOLON

%%
program:
       class_declaration program
       |
       ;

class_declaration: 
      CLASS IDENTIFIER inheritance_opt LBRACE class_body RBRACE SEMICOLON
      {
          printf("Detected class: %s\n", $2);
          is_oop = 1;
      }
      | STRUCT IDENTIFIER inheritance_opt LBRACE class_body RBRACE SEMICOLON
      {
          printf("Detected struct: %s\n", $2);
          is_oop = 1;
      }
      ;

inheritance_opt:
      COLON access_spec IDENTIFIER
      |
      ;


access_spec:
      PUBLIC | PRIVATE | PROTECTED
      ;

class_body:
      class_body_element class_body
      |
      ;

class_body_element:
      function_declaration
      | access_spec COLON
      ;

function_declaration:
      VIRTUAL IDENTIFIER LPAREN RPAREN SEMICOLON
      {
          printf("Detected virtual method: %s\n", $2);
          is_oop = 1;
      }
      | IDENTIFIER LPAREN RPAREN SEMICOLON
      ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
