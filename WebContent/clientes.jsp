<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="grafitall.Cliente" %>
<%@ page import="grafitall.ClienteDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    LISTAGEM DE CLIENTES
    Mostra uma tabela com todos os clientes do arquivo clientes.json,
    com os links "Editar" e "Excluir" em cada linha e o link "Novo cliente".
--%>
<%
    String titulo = "Clientes";

    // application.getRealPath(...) devolve o endereço real do arquivo
    // dentro da pasta do projeto no servidor (WebContent/dados/clientes.json).
    ClienteDAO dao = new ClienteDAO(application.getRealPath("/dados/clientes.json"));
    ArrayList<Cliente> clientes = dao.listar();
%>
<%@ include file="cabecalho.jsp" %>

<div class="barra-titulo">
    <h1>Clientes</h1>
    <%-- Sem id na URL = formulário em branco (inclusão). --%>
    <a class="botao" href="cliente-form.jsp">+ Novo cliente</a>
</div>

<table>
    <tr>
        <th>Id</th>
        <th>Razão social</th>
        <th>CNPJ</th>
        <th>Telefone</th>
        <th>Cidade/UF</th>
        <th>Ações</th>
    </tr>
    <%
        // Uma linha <tr> da tabela para cada cliente da lista.
        for (Cliente c : clientes) {
    %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getRazaoSocial() %></td>
        <td><%= c.getCnpj() %></td>
        <td><%= c.getTelefone() %></td>
        <td><%= c.getCidadeUf() %></td>
        <td class="acoes">
            <%-- O id vai na URL para a página saber qual registro usar. --%>
            <a href="cliente-form.jsp?id=<%= c.getId() %>">Editar</a>
            <a class="excluir" href="cliente-excluir.jsp?id=<%= c.getId() %>"
               onclick="return confirm('Excluir este cliente?')">Excluir</a>
        </td>
    </tr>
    <%
        }
    %>
</table>

<% if (clientes.isEmpty()) { %>
    <p class="vazio">Nenhum cliente cadastrado ainda.</p>
<% } %>

<%@ include file="rodape.jsp" %>
