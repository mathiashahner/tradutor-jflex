import java_cup.runtime.*;

%%

%class lexico

%cup

%line
%column

LETRA           = [a-zA-Z]
IDENT_INI       = (_ | {LETRA})
IDENTIFICADOR   = {IDENT_INI} ({IDENT_INI} | {DIGITO})*

DIGITO          = [0-9]
DIGITO_SEM_ZERO = [1-9]
INTEIRO         = 0 | {DIGITO_SEM_ZERO}{DIGITO}*
FLUTUANTE       = {INTEIRO}.{INTEIRO}

QUEBRA_LINHA    = \r|\n|\r\n
ESPACO_BRANCO   = {QUEBRA_LINHA} | [ \t\f]

%%

"char"          { return new Symbol(sym.CHAR, yyline, yycolumn); }
"int"           { return new Symbol(sym.INT, yyline, yycolumn); }
"float"         { return new Symbol(sym.FLOAT, yyline, yycolumn); }

{IDENTIFICADOR} { return new Symbol(sym.IDENTIFICADOR, yyline, yycolumn, yytext()); }
{INTEIRO}       { return new Symbol(sym.INTEIRO, yyline, yycolumn, Integer.valueOf(yytext())); }
{FLUTUANTE}     { return new Symbol(sym.FLUTUANTE, yyline, yycolumn, Float.valueOf(yytext())); }

","             { return new Symbol(sym.VIRGULA); }
"["             { return new Symbol(sym.COLCHETE_ESQ); }
"]"             { return new Symbol(sym.COLCHETE_DIR); }
";"             { return new Symbol(sym.PONTO_VIRGULA); }

{ESPACO_BRANCO} { /* Não faça nada */ }

[^]             { throw new Error("Caracter inválido <" + yytext() + ">"); }