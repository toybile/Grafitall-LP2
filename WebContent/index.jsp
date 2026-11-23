<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
    PÁGINA INICIAL (menu do sistema)
    Só mostra um link para a listagem de cada cadastro.
--%>
<%
    // Título usado pelo cabecalho.jsp (ele aparece na aba do navegador).
    String titulo = "Início";
%>
<%@ include file="cabecalho.jsp" %>

<h1>Bem-vindo à Grafitall</h1>
<p>Escolha o cadastro que você quer usar:</p>

<div class="cartoes">
    <a class="cartao" href="materias.jsp">
        <strong>Matérias-primas</strong>
        <span>Grafite em pó, argila, cera e o estoque de cada uma.</span>
    </a>
    <a class="cartao" href="lotes.jsp">
        <strong>Lotes de produção</strong>
        <span>Lotes de minas produzidos, com graduação e status.</span>
    </a>
    <a class="cartao" href="clientes.jsp">
        <strong>Clientes</strong>
        <span>Clientes atacadistas que compram as minas.</span>
    </a>
</div>

<%@ include file="rodape.jsp" %>
