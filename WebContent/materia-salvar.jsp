<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.MateriaPrima" %>
<%@ page import="grafitall.MateriaPrimaDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    SALVAR MATÉRIA-PRIMA: id 0 = incluir, outro id = alterar.
    Depois volta para a listagem.
--%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String fornecedor = request.getParameter("fornecedor");

    // getParameter sempre devolve TEXTO. Para virar número usamos
    // Double.parseDouble. Se o texto não for número, acontece uma
    // NumberFormatException e o Tomcat abre a erro.jsp (errorPage acima).
    Double quantidadeEstoqueKg = Double.parseDouble(request.getParameter("quantidadeEstoqueKg"));
    Double precoPorKg = Double.parseDouble(request.getParameter("precoPorKg"));

    MateriaPrima materia = new MateriaPrima(id, nome, quantidadeEstoqueKg, fornecedor, precoPorKg);

    MateriaPrimaDAO dao = new MateriaPrimaDAO(application.getRealPath("/dados/materias-primas.json"));
    if (id == 0) {
        dao.incluir(materia);
    } else {
        dao.alterar(materia);
    }

    response.sendRedirect("materias.jsp");
%>
