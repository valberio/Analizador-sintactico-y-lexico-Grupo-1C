%{
    #include <stdlib.h>
%}

/* SECCION: TOKENS */
LETRA [A-Z]
GUION [_]
DIGITO [0-9]
PUNTO [.]
IDENTIFICADOR ({LETRA}|{GUION})+
ENTERO {DIGITO}+{PUNTO}{DIGITO}+
OPERADOR [+|-|*|/|^]
CARACTER_PUNTUACION  [#|#.]
PALABRA_RESERVADA [REPETIR|DEVOLVER|CONSTANTE|RAIZ|e|PI]
%%
{PALABRA_RESERVADA} {printf("Palabra reservada %s\n", yytext);}
{IDENTIFICADOR}  {printf("Identificador %s\n", yytext);}
{ENTERO} {printf("Entero %s\n", yytext);}
{PUNTO} {printf("Punto %s\n", yytext);}
{DIGITO} {printf("Digito %s\n", yytext);}
{OPERADOR} {printf("Operador %s\n", yytext);}
{CARACTER_PUNTUACION} {printf("Caracter de puntación %s\n", yytext);}


\0 {printf("Whitespace\n"); }
\n {return 0; }

%%

yywrap() {}

int main()
{
    printf("Enter a string: ");
    yylex();
}