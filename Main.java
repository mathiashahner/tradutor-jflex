import java.io.*;

public class Main {
  public static void main(String[] args) {
    try {
      parser p = new parser(new lexico(new FileReader(args[0])));
      Object result = p.parse().value;
      System.out.println("---------------------------------------------------");
      System.out.println("Análises léxica e sintática concluídas com sucesso!");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}