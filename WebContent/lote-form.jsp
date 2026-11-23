<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="grafitall.LoteProducao" %>
<%@ page import="grafitall.LoteProducaoDAO" %>
<%@ page errorPage="erro.jsp" %>
<%--
    FORMULÁRIO DE LOTE (incluir e alterar no mesmo formulário)
      lote-form.jsp       -> em branco (incluir)
      lote-form.jsp?id=1  -> preenchido (alterar)

    A graduação e o status são escolhidos em menus suspensos (<select>),
    montados a partir das constantes GRADUACOES e STATUS da classe LoteProducao.
--%>
<%
    String idTexto = request.getParameter("id");

    // Lote "vazio" para a inclusão: começa com HB e "Em produção".
    LoteProducao lote = new LoteProducao(0, "HB", 0, "", "Em produção");

    if (idTexto != null) {
        LoteProducaoDAO dao = new LoteProducaoDAO(application.getRealPath("/dados/lotes-producao.json"));
        lote = dao.buscarPorId(Integer.parseInt(idTexto));
    }

    String titulo = (lote.getId() == 0) ? "Novo lote" : "Editar lote";
%>
<%@ include file="cabecalho.jsp" %>

<h1><%= titulo %></h1>

<form class="formulario" action="lote-salvar.jsp" method="post">
    <input type="hidden" name="id" value="<%= lote.getId() %>">

    <label>Graduação
        <select name="graduacao">
            <%
                // Uma <option> para cada graduação (12H ... 12B).
                // A graduação atual do lote fica marcada com "selected".
                for (String g : LoteProducao.GRADUACOES) {
                    String marcado = g.equals(lote.getGraduacao()) ? "selected" : "";
            %>
                <option value="<%= g %>" <%= marcado %>><%= g %></option>
            <%
                }
            %>
        </select>
    </label>

    <label>Quantidade produzida (unidades)
        <input type="number" name="quantidadeProduzidaUnidades" min="0" step="1"
               value="<%= lote.getQuantidadeProduzidaUnidades() %>" required>
    </label>

    <%-- A data é guardada como texto, no formato dia/mês/ano.
         O "pattern" faz o navegador recusar outro formato. --%>
    <label>Data de fabricação
        <input type="text" name="dataFabricacao" value="<%= lote.getDataFabricacao() %>"
               placeholder="01/10/2026" pattern="\d{2}/\d{2}/\d{4}"
               title="Use o formato dd/mm/aaaa" required>
    </label>

    <label>Status
        <select name="status">
            <%
                for (String s : LoteProducao.STATUS) {
                    String marcado = s.equals(lote.getStatus()) ? "selected" : "";
            %>
                <option value="<%= s %>" <%= marcado %>><%= s %></option>
            <%
                }
            %>
        </select>
    </label>

    <div class="botoes">
        <button type="submit" class="botao">Salvar</button>
        <a class="botao secundario" href="lotes.jsp">Cancelar</a>
    </div>
</form>

<%@ include file="rodape.jsp" %>
