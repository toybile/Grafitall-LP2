<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>
<%--
    PÁGINA DE ERRO

    isErrorPage="true" libera o objeto implícito "exception" nesta página.
    As páginas que gravam dados têm  errorPage="erro.jsp" : se acontecer
    uma exceção nelas (ex.: alguém digita "abc" no lugar de um número),
    o Tomcat abre esta página em vez de mostrar o erro técnico na tela.
--%>
<%
    String titulo = "Erro";
%>
<%@ include file="cabecalho.jsp" %>

<div class="aviso-erro">
    <h1>Ops! Não foi possível concluir a operação.</h1>
    <p>Confira se todos os campos foram preenchidos corretamente
       (os campos numéricos aceitam apenas números) e tente de novo.</p>

    <%-- Detalhe do erro, para quem estiver desenvolvendo. --%>
    <p class="detalhe">Detalhe: <%= exception.getMessage() %></p>

    <p><a class="botao" href="javascript:history.back()">Voltar</a>
       <a class="botao secundario" href="index.jsp">Ir para o início</a></p>
</div>

<%@ include file="rodape.jsp" %>
