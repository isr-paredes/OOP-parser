%{
#include "parser.tab.h"
%}

%%
"class"       { return CLASS; }
"struct"      { return STRUCT; }
"public"      { return PUBLIC; }
"private"     { return PRIVATE; }
"protected"   { return PROTECTED; }
"virtual"     { return VIRTUAL; }
"override"    { return OVERRIDE; }

[a-zA-Z][a-zA-Z0-9_]*     { yylval.str = strdup(yytext); return IDENTIFIER; }
"::"          { return SCOPE; }
":"           { return COLON; }
"{"           { return LBRACE; }
"}"           { return RBRACE; } 
"("           { return LPAREN; } 
")"           { return RPAREN; }
";"           { return SEMICOLON;}

[\t\r\n]+     { /* ignore whitespaces */ }
.             { /* ignore everything else */ }
%%
