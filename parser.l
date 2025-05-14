%{
#include "parser.tab.h"
#include <string.h>
%}

%%
"class"       { printf("TOKEN: class\n"); return CLASS; }
"struct"      { printf("TOKEN: struct\n"); return STRUCT; }
"public"      { printf("TOKEN: public\n"); return PUBLIC; }
"private"     { printf("TOKEN: private\n"); return PRIVATE; }
"protected"   { printf("TOKEN: protected\n"); return PROTECTED; }
"virtual"     { printf("TOKEN: virtual\n"); return VIRTUAL; }
"override"    { printf("TOKEN: override\n"); return OVERRIDE; }

[a-zA-Z_][a-zA-Z0-9_]*    { yylval.str = strdup(yytext); printf("TOKEN: IDENTIFIER (%s)\n", yytext); return IDENTIFIER; }
"::"          { printf("TOKEN: ::\n"); return SCOPE; }
":"           { printf("TOKEN: :\n"); return COLON; }
"{"           { printf("TOKEN: {\n"); return LBRACE; }
"}"           { printf("TOKEN: }\n"); return RBRACE; }
"("           { printf("TOKEN: (\n"); return LPAREN; }
")"           { printf("TOKEN: )\n"); return RPAREN; }
";"           { printf("TOKEN: ;\n"); return SEMICOLON; }

[ \t\r\n]+    { /* skip whitespace */ }
.             { printf("TOKEN: unknown character '%s'\n", yytext); }
%%

int yywrap() {
    return 1;
}
