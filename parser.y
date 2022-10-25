%code top{
    #include <stdio.h>
	#include "scanner.h"
	#include "symbol.h"
	#include "semantic.h"
}%

%defines "parser.h"		

%output "parser.c"

%start programa

//declaraciones bison (tokens)
%token DIGITO PUNTO LETRA GUION IDENTIFICADOR ENTERO OPERADOR CARACTER_PUNTUACION PALABRA_RESERVADA 


%%

programa:   programa FUNCION
            | FUNCION

FUNCION:    IDENTIFICADOR (IDENTIFICADOR) ':'sentencia devolucion   {printf("Funcion \n");}

sentencia:  sentencia                       {printf("Sentencia \n");}
            | expresionAritmetica '#'
            | asignacion '#'
            | repeticion '#'

devolucion:     'DEVOLVER' '(' IDENTIFICADOR ')' '#.' {printf("Devolucion \n");}

repeticion:     'REPETIR' '(' ENTERO ')' ':' sentencia {printf("Repeticion \n");}

asignacion:     IDENTIFICADOR '=' expresionAritmetica {printf("Asignacion \n");} 

expresionAritmetica:    expresionAritmetica OPERADOR expresionAritmetica {printf("Expresion Aritmetica \n");}
                        | termino

termino:        ENTERO OPERADOR ENTERO {printf("Termino \n");}
                | ENTERO

 

%%
//epilogo (codigo c adicional)