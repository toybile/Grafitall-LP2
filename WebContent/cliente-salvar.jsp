<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.Cliente" %>
<%@ page import="grafitall.ClienteDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    SALVAR CLIENTE (não mostra nada: só grava e volta para a lista)

    Recebe os dados do formulário e decide:
      id = 0      -> é um cliente novo  -> dao.incluir(...)
      id > 0      -> cliente existente  -> dao.alterar(...)
    Depois redireciona para a listagem (padrão Post/Redirect/Get).
--%>
<%
    // Faz os acentos (ã, ç, é...) chegarem certos. Precisa vir ANTES dos getParameter.
    request.setCharacterEncoding("UTF-8");

    // Lê cada campo do formulário pelo "name" do input.
    int id = Integer.parseInt(request.getParameter("id"));
    String razaoSocial = request.getParameter("razaoSocial");
    String cnpj = request.getParameter("cnpj");
    String telefone = request.getParameter("telefone");
    String cidadeUf = request.getParameter("cidadeUf");

    // Monta o objeto com os dados recebidos.
    Cliente cliente = new Cliente(id, razaoSocial, cnpj, telefone, cidadeUf);

    ClienteDAO dao = new ClienteDAO(application.getRealPath("/dados/clientes.json"));
    if (id == 0) {
        dao.incluir(cliente);
    } else {
        dao.alterar(cliente);
    }

    // Volta para a lista (a URL do navegador muda para clientes.jsp).
    response.sendRedirect("clientes.jsp");
%>
