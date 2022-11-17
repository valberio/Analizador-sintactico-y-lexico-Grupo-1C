%{
#include <stdio.h>
#include "parser.tab.h"		

int yylex();
int yywrap(){
    return(1);
}

FILE* yyin;
FILE* yyout;

void yyerror (char* message) {  
    printf("se encontro un error");                                 
}
%}
//declaraciones bison (tokens)
%token IDENTIFICADOR
%token ENTERO
%token REPETIR
%token DEVOLVER
%token e
%token PI
%token CIERRE_FUNCION
%token '='
%token '#'
%token '('
%token ')'
%token ':'


%left '+' '-'
%left '*' '/'
%left '^'

%%
programa:   
            |programa funcion
;


funcion:    IDENTIFICADOR '('IDENTIFICADOR')'':'  sentencia '#' devolucion CIERRE_FUNCION {printf("Funcion \n");}
;

sentencia:   expresionAditiva sentenciaOpcional {printf("Sentencia \n");}
            | asignacion  sentenciaOpcional      {printf("Sentencia \n");}
            | repeticion  sentenciaOpcional      {printf("Sentencia \n");}
;

sentenciaOpcional: 
                    | sentencia
;

devolucion:     DEVOLVER '(' IDENTIFICADOR ')' {printf("Devolucion \n");}
;
repeticion:     REPETIR '(' ENTERO ')' ':' sentencia {printf("Repeticion \n");}
;
asignacion:     IDENTIFICADOR '=' expresionAditiva {printf("Asignacion \n");} 
;
expresionAditiva:   expresionMultiplicativa {printf("exp aditiva\n");}  
                    | expresionAditiva '+' expresionMultiplicativa     /*{printf("mas\n");}  */       
                    | expresionAditiva '-' expresionMultiplicativa                  
;

expresionMultiplicativa: expresionUnaria    
                        | expresionMultiplicativa '*' expresionUnaria  /*{printf("por\n");}*/             
                        | expresionMultiplicativa '/' expresionUnaria   
;
expresionUnaria: expresionUnaria '^' ENTERO
                | ENTERO
                | e
                | PI
;

%%
//epilogo (codigo c adicional)

int main (int argc, char *argv[])
{

    if (argc == 2)
    {
    yyin = fopen(argv[1], "r");
    yyout = fopen("salida.txt", "w");
        if ( yyin == NULL)
        {
            printf("No se pudo encontrar el archivo");
            return 1;
        }
    yyparse();

    fclose(yyin);
    fclose(yyout);
    }
    else
    {
        printf("Ingrese el nombre del programa y el nombre del archivo de entrada");    
        return 1;
    }
} 

