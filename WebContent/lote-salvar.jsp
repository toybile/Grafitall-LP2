<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.LoteProducao" %>
<%@ page import="grafitall.LoteProducaoDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    SALVAR LOTE: id 0 = incluir, outro id = alterar. Depois volta para a lista.
--%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String graduacao = request.getParameter("graduacao");
    String dataFabricacao = request.getParameter("dataFabricacao");
    String status = request.getParameter("status");

    // Texto -> número inteiro. Se não for número, vai para a erro.jsp.
    Integer quantidade = Integer.parseInt(request.getParameter("quantidadeProduzidaUnidades"));

    LoteProducao lote = new LoteProducao(id, graduacao, quantidade, dataFabricacao, status);

    LoteProducaoDAO dao = new LoteProducaoDAO(application.getRealPath("/dados/lotes-producao.json"));
    if (id == 0) {
        dao.incluir(lote);
    } else {
        dao.alterar(lote);
    }

    response.sendRedirect("lotes.jsp");
%>
