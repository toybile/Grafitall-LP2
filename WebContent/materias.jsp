<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="grafitall.MateriaPrima" %>
<%@ page import="grafitall.MateriaPrimaDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    LISTAGEM DE MATÉRIAS-PRIMAS
    Mesma ideia da listagem de clientes: tabela + Editar/Excluir + Novo.
--%>
<%
    String titulo = "Matérias-primas";

    MateriaPrimaDAO dao = new MateriaPrimaDAO(application.getRealPath("/dados/materias-primas.json"));
    ArrayList<MateriaPrima> materias = dao.listar();
%>
<%@ include file="cabecalho.jsp" %>

<div class="barra-titulo">
    <h1>Matérias-primas</h1>
    <a class="botao" href="materia-form.jsp">+ Nova matéria-prima</a>
</div>

<table>
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Estoque (kg)</th>
        <th>Fornecedor</th>
        <th>Preço por kg (R$)</th>
        <th>Ações</th>
    </tr>
    <%
        for (MateriaPrima m : materias) {
    %>
    <tr>
        <td><%= m.getId() %></td>
        <td><%= m.getNome() %></td>
        <td><%= m.getQuantidadeEstoqueKg() %></td>
        <td><%= m.getFornecedor() %></td>
        <%-- String.format("%.2f", ...) mostra sempre 2 casas decimais. --%>
        <td><%= String.format("%.2f", m.getPrecoPorKg()) %></td>
        <td class="acoes">
            <a href="materia-form.jsp?id=<%= m.getId() %>">Editar</a>
            <a class="excluir" href="materia-excluir.jsp?id=<%= m.getId() %>"
               onclick="return confirm('Excluir esta matéria-prima?')">Excluir</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<% if (materias.isEmpty()) { %>
    <p class="vazio">Nenhuma matéria-prima cadastrada ainda.</p>
<% } %>

<%@ include file="rodape.jsp" %>
