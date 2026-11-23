<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.Cliente" %>
<%@ page import="grafitall.ClienteDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    FORMULÁRIO DE CLIENTE (o MESMO formulário serve para incluir e para alterar)

    - cliente-form.jsp          -> sem id: campos em branco (INCLUIR)
    - cliente-form.jsp?id=3     -> com id: campos já preenchidos (ALTERAR)
--%>
<%
    // Lê o parâmetro "id" da URL. Se não veio, fica null.
    String idTexto = request.getParameter("id");

    // Começa com um cliente "vazio" (id 0 = ainda não existe no arquivo).
    Cliente cliente = new Cliente(0, "", "", "", "");

    if (idTexto != null) {
        // Veio um id: buscamos o cliente para preencher os campos.
        ClienteDAO dao = new ClienteDAO(application.getRealPath("/dados/clientes.json"));
        cliente = dao.buscarPorId(Integer.parseInt(idTexto));
    }

    // O título muda conforme o caso.
    String titulo = (cliente.getId() == 0) ? "Novo cliente" : "Editar cliente: " + cliente.getDescricao();
    // getDescricao() vem da superclasse Cadastro (cada subclasse escreve a sua).
%>
<%@ include file="cabecalho.jsp" %>

<h1><%= titulo %></h1>

<%-- method="post": os dados vão "escondidos" para a página cliente-salvar.jsp --%>
<form class="formulario" action="cliente-salvar.jsp" method="post">

    <%-- Campo escondido: leva o id junto (0 = incluir, outro número = alterar). --%>
    <input type="hidden" name="id" value="<%= cliente.getId() %>">

    <label>Razão social
        <input type="text" name="razaoSocial" value="<%= cliente.getRazaoSocial() %>" required>
    </label>

    <label>CNPJ
        <input type="text" name="cnpj" value="<%= cliente.getCnpj() %>"
               placeholder="00.000.000/0000-00" required>
    </label>

    <label>Telefone
        <input type="text" name="telefone" value="<%= cliente.getTelefone() %>"
               placeholder="(11) 90000-0000" required>
    </label>

    <label>Cidade/UF
        <input type="text" name="cidadeUf" value="<%= cliente.getCidadeUf() %>"
               placeholder="São Paulo/SP" required>
    </label>

    <div class="botoes">
        <button type="submit" class="botao">Salvar</button>
        <a class="botao secundario" href="clientes.jsp">Cancelar</a>
    </div>
</form>

<%@ include file="rodape.jsp" %>
