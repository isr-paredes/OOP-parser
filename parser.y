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

%start program
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
      VIRTUAL IDENTIFIER IDENTIFIER LPAREN RPAREN override_opt SEMICOLON
      {
          printf("Detected virtual method: %s\n", $3);
          is_oop = 1;
      }
      | IDENTIFIER IDENTIFIER LPAREN RPAREN override_opt SEMICOLON
      ;

override_opt:
      OVERRIDE
      |
      ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(){
    yyparse();
    if(is_oop) {
       printf("Object-Oriented: YES\n");
    } else {
        printf("Object-Oriented: NO\n");
    }
    return 0;
}
