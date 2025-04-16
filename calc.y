%{
#include <stdio.h>
#include <stdlib.h>
int sym[26];  
void yyerror(char *);
int yylex(void);
%}

%token INTEGER VARIABLE EOL
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

program:
    | program statement EOL { printf("= %d\n", $2); }
    ;

statement:
    expression          { $$ = $1; }
    | VARIABLE '=' expression { sym[$1] = $3; $$ = $3; }
    ;

expression:
    INTEGER             { $$ = $1; }
    | VARIABLE          { $$ = sym[$1]; }
    | expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression { 
        if ($3 == 0) yyerror("Division by zero");
        else $$ = $1 / $3; 
      }
    | '-' expression %prec UMINUS { $$ = -$2; }
    | '(' expression ')' { $$ = $2; }
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Calculator (type expressions or e.g. 'x=5')\n");
    yyparse();
    return 0;
}