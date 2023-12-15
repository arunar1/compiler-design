
%{
#define YYSTYPE double
#include "calculator.tab.h"
#include <stdio.h>
%}
%%
[0-9]+([.][0-9][0-9]*)? { yylval= atof(yytext); return NUM;}
[\t] ;
\n return 0;
. return yytext[0];
%%
int yywrap(){
    return 1;
}