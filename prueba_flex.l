%{
    #include <stdlib.h>
    #include
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
PALABRA_RESERVADA [REPETIR|DEVOLVER|CONSTANTE|e|PI]
%%
{IDENTIFICADOR}  {return yytext;}
{ENTERO} {printf("Entero %s\n", yytext);}
{PUNTO} {printf("Punto %s\n", yytext);}
{DIGITO} {printf("Digito %s\n", yytext);}

//Caracteres de Puntuacion
'#'         {return '#';}
"#."        {return CIERRE_FUNCION;}  
'('         {return '(';}   
')'         {return ')';} 
':'         {return ':';}    
//Palabras reservadas
"REPETIR"   {return REPETIR;}
"DEVOLVER"  {return DEVOLVER;}
"CONSTANTE" {return CONSTANTE;}
'e'         {return e;}
"PI"        {return PI;}
 
//operadores
"+"     {return '+';}
"-"     {return '-';}
"^"     {return '^';}
"*"     {return '*';}
"/"     {return '/';}

\0 {printf("Whitespace\n"); }
\n {return 0; }

%%

yywrap() {}

int main()
{
    printf("Enter a string: ");
    yylex();
}