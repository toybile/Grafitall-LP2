#!/bin/bash
# Roda o Grafitall no Linux (ex.: Debian do laboratório) sem precisar do Eclipse.
# Uso, dentro da pasta do projeto:   bash rodar-linux.sh
# Depois abra no navegador:          http://localhost:8080/Grafitall/
# Para desligar:                     ~/apache-tomcat-9.0.98/bin/shutdown.sh
#
# Precisa só do Java (versão 11 ou mais nova): confira com  java -version

set -e                                   # para no primeiro erro
cd "$(dirname "$0")"                     # vai para a pasta do projeto

TOMCAT="$HOME/apache-tomcat-9.0.98"
URL="https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz"

# 1. Baixa o Tomcat 9 (só na primeira vez)
if [ ! -d "$TOMCAT" ]; then
    echo "Baixando o Tomcat 9..."
    if command -v wget > /dev/null; then
        wget -q -O /tmp/tomcat.tar.gz "$URL"
    else
        curl -sL -o /tmp/tomcat.tar.gz "$URL"
    fi
    tar xzf /tmp/tomcat.tar.gz -C "$HOME"
    chmod +x "$TOMCAT"/bin/*.sh
fi

# 2. Compila as classes Java (com a Gson no classpath)
echo "Compilando..."
javac -encoding UTF-8 -cp WebContent/WEB-INF/lib/gson-2.11.0.jar \
      -d WebContent/WEB-INF/classes src/grafitall/*.java

# 3. Copia o site para o Tomcat (apaga a cópia antiga, se houver)
rm -rf "$TOMCAT/webapps/Grafitall"
cp -r WebContent "$TOMCAT/webapps/Grafitall"

# 4. Liga o servidor
"$TOMCAT/bin/startup.sh" > /dev/null
echo
echo "Pronto! Abra no navegador: http://localhost:8080/Grafitall/"
echo "Para desligar: $TOMCAT/bin/shutdown.sh"
