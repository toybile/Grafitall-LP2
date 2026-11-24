<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="grafitall.LoteProducao" %>
<%@ page import="grafitall.LoteProducaoDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    LISTAGEM DE LOTES DE PRODUÇÃO
    Tabela com os lotes + Editar/Excluir em cada linha + "Novo lote".
--%>
<%
    String titulo = "Lotes de produção";

    LoteProducaoDAO dao = new LoteProducaoDAO(application.getRealPath("/dados/lotes-producao.json"));
    ArrayList<LoteProducao> lotes = dao.listar();
%>
<%@ include file="cabecalho.jsp" %>

<div class="barra-titulo">
    <h1>Lotes de produção</h1>
    <a class="botao" href="lote-form.jsp">+ Novo lote</a>
</div>

<table>
    <tr>
        <th>Id</th>
        <th>Graduação</th>
        <th>Quantidade (unidades)</th>
        <th>Data de fabricação</th>
        <th>Status</th>
        <th>Ações</th>
    </tr>
    <%
        for (LoteProducao l : lotes) {
            // Classe CSS diferente para cada status, só para mudar a cor.
            String classeStatus = l.getStatus().equals("Finalizado") ? "status-ok" : "status-andamento";
    %>
    <tr>
        <td><%= l.getId() %></td>
        <td><strong><%= l.getGraduacao() %></strong></td>
        <td><%= l.getQuantidadeProduzidaUnidades() %></td>
        <td><%= l.getDataFabricacao() %></td>
        <td><span class="<%= classeStatus %>"><%= l.getStatus() %></span></td>
        <td class="acoes">
            <a href="lote-form.jsp?id=<%= l.getId() %>">Editar</a>
            <a class="excluir" href="lote-excluir.jsp?id=<%= l.getId() %>"
               onclick="return confirm('Excluir este lote?')">Excluir</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<% if (lotes.isEmpty()) { %>
    <p class="vazio">Nenhum lote cadastrado ainda.</p>
<% } %>

<%@ include file="rodape.jsp" %>
