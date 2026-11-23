<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.MateriaPrima" %>
<%@ page import="grafitall.MateriaPrimaDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    FORMULÁRIO DE MATÉRIA-PRIMA (incluir e alterar no mesmo formulário)
      materia-form.jsp       -> em branco (incluir)
      materia-form.jsp?id=2  -> preenchido (alterar)
--%>
<%
    String idTexto = request.getParameter("id");

    // Matéria-prima "vazia" para a inclusão. Os números começam em 0.0.
    MateriaPrima materia = new MateriaPrima(0, "", 0.0, "", 0.0);

    if (idTexto != null) {
        MateriaPrimaDAO dao = new MateriaPrimaDAO(application.getRealPath("/dados/materias-primas.json"));
        materia = dao.buscarPorId(Integer.parseInt(idTexto));
    }

    String titulo = (materia.getId() == 0) ? "Nova matéria-prima" : "Editar matéria-prima";
%>
<%@ include file="cabecalho.jsp" %>

<h1><%= titulo %></h1>

<form class="formulario" action="materia-salvar.jsp" method="post">
    <input type="hidden" name="id" value="<%= materia.getId() %>">

    <label>Nome
        <input type="text" name="nome" value="<%= materia.getNome() %>"
               placeholder="Grafite em pó natural" required>
    </label>

    <%-- type="number": o navegador só deixa digitar números.
         step="0.01" permite casas decimais; min="0" impede negativos. --%>
    <label>Quantidade em estoque (kg)
        <input type="number" name="quantidadeEstoqueKg" step="0.01" min="0"
               value="<%= materia.getQuantidadeEstoqueKg() %>" required>
    </label>

    <label>Fornecedor
        <input type="text" name="fornecedor" value="<%= materia.getFornecedor() %>" required>
    </label>

    <label>Preço por kg (R$)
        <input type="number" name="precoPorKg" step="0.01" min="0"
               value="<%= materia.getPrecoPorKg() %>" required>
    </label>

    <div class="botoes">
        <button type="submit" class="botao">Salvar</button>
        <a class="botao secundario" href="materias.jsp">Cancelar</a>
    </div>
</form>

<%@ include file="rodape.jsp" %>
