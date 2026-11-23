<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.LoteProducaoDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    EXCLUIR LOTE: recebe o id pela URL, remove e volta para a lista.
--%>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    LoteProducaoDAO dao = new LoteProducaoDAO(application.getRealPath("/dados/lotes-producao.json"));
    dao.excluir(id);

    response.sendRedirect("lotes.jsp");
%>
