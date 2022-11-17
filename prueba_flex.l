%{
    #include <stdlib.h>
    #include "parser.tab.h"
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
PALABRA_RESERVADA [REPETIR|DEVOLVER|e|PI]

%%

"#"         {return '#';}
"#."        {return CIERRE_FUNCION;}  
"("         {return '(';}   
")"         {return ')';} 
":"         {return ':';}    
"="         {return '=';}

"REPETIR"   {return REPETIR;}
"DEVOLVER"  {return DEVOLVER;}
"e"         {return e;}
"PI"        {return PI;}
 
"+"     {return '+';}
"-"     {return '-';}
"^"     {return '^';}
"*"     {return '*';}
"/"     {return '/';}

{IDENTIFICADOR}  {return IDENTIFICADOR;}
{ENTERO} {printf("Entero %s\n", yytext);} {return ENTERO;}

\0 {printf("Whitespace\n"); }



%%
