<%@ page pageEncoding="UTF-8" %>
<%--
    CABEÇALHO (reaproveitado em todas as páginas)

    A linha pageEncoding acima avisa que este arquivo está em UTF-8;
    sem ela os acentos daqui (ex.: "Início") aparecem trocados.

    Cada página chama este arquivo com a diretiva:
        <%@ include file="cabecalho.jsp" %>
    A diretiva include COPIA este texto para dentro da página antes de
    compilar. Por isso este arquivo consegue usar a variável "titulo",
    que cada página cria logo antes do include.
--%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Grafitall - <%= titulo %></title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <header class="topo">
        <a class="marca" href="index.jsp">Grafitall</a>
        <span class="subtitulo">Fábrica de minas de grafite</span>
        <%-- Menu igual em todas as páginas --%>
        <nav class="menu">
            <a href="index.jsp">Início</a>
            <a href="materias.jsp">Matérias-primas</a>
            <a href="lotes.jsp">Lotes de produção</a>
            <a href="clientes.jsp">Clientes</a>
        </nav>
    </header>
    <main class="conteudo">
