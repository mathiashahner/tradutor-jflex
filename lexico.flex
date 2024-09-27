import java_cup.runtime.*;

%%

%class lexico

%cup

%line
%column

%{
  private Symbol simbolo(int tipo) {
    return new Symbol(tipo, yyline, yycolumn);
  }

  private Symbol simbolo(int tipo, Object valor) {
    return new Symbol(tipo, yyline, yycolumn, valor);
  }
%}

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

"char"          { return simbolo(sym.CHAR); }
"int"           { return simbolo(sym.INT); }
"float"         { return simbolo(sym.FLOAT); }

{IDENTIFICADOR} { return simbolo(sym.IDENTIFICADOR, yytext()); }
{INTEIRO}       { return simbolo(sym.INTEIRO, Integer.valueOf(yytext())); }
{FLUTUANTE}     { return simbolo(sym.FLUTUANTE, Float.valueOf(yytext())); }

","             { return simbolo(sym.VIRGULA); }
"["             { return simbolo(sym.COLCHETE_ESQ); }
"]"             { return simbolo(sym.COLCHETE_DIR); }
";"             { return simbolo(sym.PONTO_VIRGULA); }

{ESPACO_BRANCO} { /* Não faça nada */ }

[^]             { throw new Error("Caracter inválido <" + yytext() + ">"); }