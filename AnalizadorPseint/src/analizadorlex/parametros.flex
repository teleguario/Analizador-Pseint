package analizadorlex;
import static analizadorlex.Token.*;
%%
%class Lexer
%line
%column 
%type Token
L = [a-zA-Z:]
D = [0-9]
WHITE=[ \t\r]
COMA = [,]
SALTO = [\n]
SIMASIG = [=|<-|:=]
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
"//".* {/*Ignore*/}
{SALTO} {/*Ignore*/}
"+" {return SUMA;}
"*" {return MULT;}
"/" {return DIV;}
";" {return FINL;}
"^" {return EXPO;}
"DEFINIR" {return DEFINIR;}
{D}{D}* {lexeme=yytext(); return IDENTIFICADOR;}
{D}{D}* {lexeme=yytext(); return ENTERO;}
("ESCRIBIR"|"Escribir"){WHITE}+({WHITE}*("'")({WHITE}*{L}*)*("'")({WHITE}*{COMA}?{L}?)*)+ {lexeme=yytext(); return ESCRIBIR;}
("LEER"|"Leer"){WHITE}+(({WHITE}*{L}*)?({WHITE}*{COMA}?{L}?)*)+ {lexeme=yytext(); return LEER;}
{L}{L}*{WHITE}*("<-"|{SIMASIG}){WHITE}*{L}{L}*|("'")({WHITE}*{L}*)*("'") {lexeme=yytext(); return ASIGNACION;}
. {return ERROR;}