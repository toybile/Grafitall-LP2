<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.ClienteDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    EXCLUIR CLIENTE (não mostra nada)
    Recebe o id pela URL (cliente-excluir.jsp?id=3), remove o cliente,
    regrava o arquivo JSON e volta para a listagem.
--%>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    ClienteDAO dao = new ClienteDAO(application.getRealPath("/dados/clientes.json"));
    dao.excluir(id);

    response.sendRedirect("clientes.jsp");
%>
