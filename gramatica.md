### Especificações

Não foram encontradas restrições referentes aos intervalos de valores permitidos para cada tipo (char, int e float). Desta forma, podemos considerar que os intervalos máximos permitidos levam em consideração a arquitetura onde os analisadores léxico e sintático serão executados.

---

### Gramática

```
G = (V, T, P, S)

V = {
  EXPRESSOES, EXPRESSAO,
  TIPO, DECLARACOES, DECLARACAO,
  IDENTIFICADOR, IDENTS, IDENT_INI, IDENT_FIM,
  FLUTUANTE, INTEIRO, DIGITOS, DIGITO, DIGITO_SEM_ZERO,
  LETRA, IF, WHILE, CONDICAO, BLOCO_COMANDOS, COMANDOS, COMANDO,
  OPERACAO, ARGUMENTO, OPER_MATEMATICO, OPER_ATRIBUICAO, OPER_RELACIONAL
}

T = {
  char, int, float,
  if, else, while,
  +, -, *, /,
  =, +=, -=, *=, /=,
  ==, !=, <=, >=, <, >,
  _, ., ,, ;, {, }, (, ), [, ],
  a, b, c, d, e, f, g, h, i, j, k, l, m,
  n, o, p, q, r, s, t, u, v, w, x, y, z,
  A, B, C, D, E, F, G, H, I, J, K, L, M,
  N, O, P, Q, R, S, T, U, V, W, X, Y, Z,
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9
}

S = EXPRESSOES

P = {
  EXPRESSOES → EXPRESSOES EXPRESSAO | EXPRESSAO
  EXPRESSAO → TIPO DECLARACOES ; | IF | WHILE

  TIPO → char | int | float
  DECLARACOES → DECLARACAO | DECLARACOES , DECLARACAO
  DECLARACAO → IDENTIFICADOR | IDENTIFICADOR [ INTEIRO ]

  IDENTIFICADOR → IDENT_INI | IDENT_INI IDENTS
  IDENTS → IDENTS IDENT_FIM | IDENT_FIM
  IDENT_INI → _ | LETRA
  IDENT_FIM → IDENT_INI | DIGITO

  FLUTUANTE → INTEIRO . INTEIRO
  INTEIRO → 0 | DIGITO_SEM_ZERO DIGITOS
  DIGITOS → DIGITOS DIGITO | DIGITO
  DIGITO → 0 | DIGITO_SEM_ZERO
  DIGITO_SEM_ZERO → 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

  LETRA → a | b | c | d | e | f | g | h | i | j | k | l | m |
          n | o | p | q | r | s | t | u | v | w | x | y | z |
          A | B | C | D | E | F | G | H | I | J | K | L | M |
          N | O | P | Q | R | S | T | U | V | W | X | Y | Z

  IF → if CONDICAO BLOCO_COMANDOS |
       if CONDICAO BLOCO_COMANDOS else BLOCO_COMANDOS

  WHILE → while CONDICAO BLOCO_COMANDOS

  CONDICAO → ( ARGUMENTO OPER_RELACIONAL ARGUMENTO )

  BLOCO_COMANDOS → { COMANDOS }
  COMANDOS → COMANDOS COMANDO | COMANDO
  COMANDO → IDENTIFICADOR OPER_ATRIBUICAO OPERACAO ;

  OPERACAO → ARGUMENTO | ARGUMENTO OPER_MATEMATICO ARGUMENTO
  ARGUMENTO → IDENTIFICADOR | FLUTUANTE | INTEIRO

  OPER_MATEMATICO → + | - | * | /
  OPER_ATRIBUICAO → = | += | -= | *= | /=
  OPER_RELACIONAL → == | != | <= | >= | < | >
}
```
