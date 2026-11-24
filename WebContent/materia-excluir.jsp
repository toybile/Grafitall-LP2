<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.MateriaPrimaDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    EXCLUIR MATÉRIA-PRIMA: recebe o id pela URL, remove e volta para a lista.
--%>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    MateriaPrimaDAO dao = new MateriaPrimaDAO(application.getRealPath("/dados/materias-primas.json"));
    dao.excluir(id);

    response.sendRedirect("materias.jsp");
%>
