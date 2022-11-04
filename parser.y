%{
#include <stdio.h>
#include "scanner.h"
#include "symbol.h"
#include "semantic.h"
#include "parser.h"		


int yylex();
int yywrap(){
    return(1);
}

FILE* yyin;
FILE* yyout;

void yyerror (char* message) {  
    printf("se encontro un error")                                  
}
}%
//declaraciones bison (tokens)
%token IDENTIFICADOR ENTERO 
%token REPETIR
%token DEVOLVER
%token e
%token PI
%token CIERRE_FUNCION
%token '#'
%token '('
%token ')'
%token ':'

%left '+' '-'
%left '*' '/'
%left '^'

%%

programa:   programa FUNCION
            | FUNCION
;
FUNCION:    IDENTIFICADOR '('IDENTIFICADOR')'':'sentencia devolucion   {printf("Funcion \n");}
;
sentencia:  sentencia                       {printf("Sentencia \n");}
            | expresionAditiva '#'
            | asignacion '#'
            | repeticion '#'
;
devolucion:     DEVOLVER '(' IDENTIFICADOR ')' CIERRE_FUNCION {printf("Devolucion \n");}
;
repeticion:     REPETIR '(' ENTERO ')' ':' sentencia {printf("Repeticion \n");}
;
asignacion:     IDENTIFICADOR '=' expresionAditiva {printf("Asignacion \n");} 
;
expresionAditiva:   expresionMultiplicativa
                    | expresionAditiva '+' expresionMultiplicativa                    
                    | expresionAditiva '-' expresionMultiplicativa                  
;

expresionMultiplicativa: expresionUnaria    
                        | expresionMultiplicativa '*' expresionUnaria              
                        | expresionMultiplicativa '/' expresionUnaria   
;
expresionUnaria: expresionUnaria '^' ENTERO
                | ENTERO
                | e
                | PI
;

%%
//epilogo (codigo c adicional)

int main ()
{
    yyin = fopen("entrada.txt", "r");
    yyout = fopen("salida.txt", "w");

    yyparse();

    fclose(yyin);
    fclose(yyout);
           
}                   
