#!/bin/bash

# Variáveis de ambiente
LOCAL_PATH=.
JAVA_CUP_JAR=/usr/share/java/java-cup-0.11b.jar
JAVA_CUP_RUNTIME_JAR=/usr/share/java/java-cup-0.11b-runtime.jar

# Gera o analisador léxico com JFlex
jflex lexico.flex

# Gera o analisador sintático com JCup
java -jar $JAVA_CUP_JAR sintatico.cup

# Compila e executa o programa
javac -cp $LOCAL_PATH:$JAVA_CUP_JAR Main.java
java -cp $LOCAL_PATH:$JAVA_CUP_RUNTIME_JAR Main teste.c