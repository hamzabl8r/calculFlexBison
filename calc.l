%{
#include "calc.tab.h"  
#include <stdlib.h>
void yyerror(char *);
%}

%%
[ \t]    ;  
[0-9]+   { yylval = atoi(yytext); return INTEGER; }
[a-z]    { yylval = yytext[0] - 'a'; return VARIABLE; }
[-+*/()=] { return yytext[0]; }  
\n       { return EOL; }
.        { yyerror("Invalid character"); }
%%

int yywrap() { return 1; }