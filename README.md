# Tradutor com JFlex e JCup

| Arquivo | Descrição |
| --- | --- |
| gramatica.md | Define a gramática implementada pelos analisadores |
| lexico.flex | Define o analisador léxico |
| sintatico.cup | Define o analisador sintático |
| Main.java | Instancia as classes necessárias e inicia a execução dos analisadores |
| teste.c | Expressões para testar os analisadores |
| script.sh | Automação para executar a compilação e execução |

### Ferramentas

Para executar este projeto, é necessário que o JFLex e o JCup estejam instalados. No Linux, isto pode ser feito com:

```bash
sudo apt install jflex
```

Após a instalação, os analisadores já podem ser compilados e executados com o seguinte comando:

```bash
./script.sh
```
