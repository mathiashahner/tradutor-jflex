import java.io.*;
import java_cup.runtime.Symbol;

public class Main {
  public static void main(String[] args) {
    try {
      System.out.println("Análise léxica do arquivo \"" + args[0] + "\"");
      lexico l = new lexico(new FileReader(args[0]));

      Symbol s;
      do {
        s = l.debug_next_token();
      } while (s.sym != sym.EOF);

      System.out.println("Análise sintática do arquivo \"" + args[0] + "\"");
      parser p = new parser(new lexico(new FileReader(args[0])));
      Object result = p.parse().value;

      System.out.println("---------------------------------------------------");
      System.out.println("Análises léxica e sintática concluídas com sucesso!");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}