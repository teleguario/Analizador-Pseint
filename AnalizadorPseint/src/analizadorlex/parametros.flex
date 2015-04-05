package analizadorlex;
import static analizadorlex.Token.*;
%%
%class Lexer
%type Token
L = [a|b|x]
D = [0-9]
WHITE=[ \t\r\n]
%{
public String lexeme;
%}
%%
{WHITE} {/*Ignore*/}
"//".* {/*Ignore*/}
":=" {return ASSIGN;}
"+" {return SUMA;}
"*" {return MULT;}
"-" {return RESTA;}
"/" {return DIV;}
";" {return FINL;}
"^" {return EXPO;}
{L}({L}" "*|{D})*" "* {lexeme=yytext(); return VARIABLE;}
("nuevo"" "*|"NUEVO"" "*)";"" "* {lexeme=yytext(); return PRNUEVO;}
({L}|{D})+" "*":="" "*"-"?{D}+" "*";" {lexeme=yytext(); return ASIGN_VARIABLE;}
(("-"?{D}+" "*|"-"?{L}" "*)+" "*("^"|"*"|"/"|"-"|"+")+" "*("-"?{D}+" "*|"-"?{L}+" "*)+(("^"|"*"|"/"|"-"|"+")+" "*("-"?{D}+" "*|"-"?{L}+" "*)+)*)+" "*(":="" "*"-"?" "*{D}+" "*";"" "*){1} {lexeme=yytext(); return ECUACION;}
 "-"?{D}+" "* {lexeme=yytext(); return INT;}
. {return ERROR;}