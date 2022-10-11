# pruebas-flex
# Sintaxis-Grupo-1Objetivo: Aplicar los conocimientos teóricos en el diseño de un compilador básico de Lenguaje de Programacion Para ello, cada equipo, definirá un lenguaje básico, compuesto minimamente:

Uno o dos tipo de dato
Identificadores con longitud máxima de 16 caracteres.
Los identificadores deberán tener una convención predefinida
Minimo 2 sentencias, debiendo contar con convención de fin de sentencia , y de apertura y cierre.
Cuatro ( 4) palabras reservadas
Alfabeto a elección del equipo.
Primer Entrega: Gramatica Lexica a) Diseñar las categorías léxicas correspondiente al lenguaje elegido b) Formalizar cada lenguaje regular con Automatas Finitos y Expresiones regulares

tipos de dato: numero

---Token/Categoria Lexica-- identificador = identificador mayuscula

mayuscula: uno de _ A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z

constante = digito constante constante coma digito

digito: uno de 0 1 2 3 4 5 6 7 8 9 coma: uno de ,

operador = uno de + - / * ^

caracterpuntuacion = uno de , . : ( ) #

palabrasReservadas: uno de repetir, numero, devolver, raiz, pi, e

--- Expresion Regulares ---

constante B = 1,3#.

CUBO(numero A): repetir(3): A = A * A# devolver A#.

Mayuscula = _+A+B+C+D+E+F+G+H+I+J+K+L+M+N+Ñ+O+P+Q+R+S+T+U+V+W+X+Y+Z identificador = Mayuscula (Mayuscula)*

digito = 0+1+2+3+4+5+6+7+8+9 Coma = , constante = Digito (Digito)* Coma Digito (Digito)*

operador = (+) + - + / + * + ^

palabrasReservadas = repetir + numero + devolver + raiz + pi + e
