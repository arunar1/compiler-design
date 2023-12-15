%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<math.h>

#define YYSTYPE double // Change YYSTYPE to double to handle floating-point numbers



%}

%token NUM

%left '+' '-'
%left '*' '/'
%left '(' ')'
%right UMINUS
%right '^'

%%

stm: E { printf("\nResult=%lf\n", $$); } // Changed %d to %lf to print doubles
E: E '+' E { $$ = $1 + $3; } 
 | E '*' E { $$ = $1 * $3; }
 | E '-' E { $$ = $1 - $3; }
 | E '/' E { $$ = $1 / $3; }
 | '-' E %prec UMINUS { $$ = -$2; }
 | '(' E ')' { $$ = $2; }
 | E '^' E { $$ = pow($1, $3); } // Use pow directly
 | NUM { $$ = $1; }
;

%%

int main(){
    printf("Enter the expression:\n");
    yyparse();
    return 0;
}

int yyerror() {
    printf("Invalid Expression\n");
    return 0;
}
