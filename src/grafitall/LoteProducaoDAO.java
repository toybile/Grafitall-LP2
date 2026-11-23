package grafitall;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

import com.google.gson.reflect.TypeToken;

/*
 * DAO = Data Access Object ("objeto de acesso aos dados").
 *
 * O LoteProducaoDAO cuida das quatro operações do cadastro de lotes de produção:
 *   incluir, alterar, excluir e listar (+ buscarPorId, usado no "Editar").
 * As páginas JSP NÃO mexem no arquivo: elas só chamam estes métodos.
 *
 * Todas as operações seguem a mesma ideia simples:
 *   1. ler a lista inteira do arquivo;
 *   2. mudar a lista na memória (adicionar, trocar ou remover um item);
 *   3. gravar a lista inteira de volta no arquivo.
 */
public class LoteProducaoDAO {

    // Endereço do arquivo lotes-producao.json (a página JSP informa no construtor).
    private String caminho;

    // "Lista de LoteProducao" escrita de um jeito que a Gson entende.
    private Type tipoLista = new TypeToken<ArrayList<LoteProducao>>() {}.getType();

    public LoteProducaoDAO(String caminho) {
        this.caminho = caminho;
    }

    // LISTAR: devolve todos os lotes do arquivo.
    public ArrayList<LoteProducao> listar() throws IOException {
        return ArquivoJson.ler(caminho, tipoLista);
    }

    // BUSCAR: procura o lote com este id. Devolve null se não achar.
    public LoteProducao buscarPorId(int id) throws IOException {
        for (LoteProducao c : listar()) {
            if (c.getId() == id) {
                return c;
            }
        }
        return null;
    }

    // INCLUIR: dá um id novo ao lote e grava no fim da lista.
    public void incluir(LoteProducao novo) throws IOException {
        ArrayList<LoteProducao> lista = listar();

        // Novo id = maior id que já existe + 1 (o primeiro registro fica com 1).
        int maiorId = 0;
        for (LoteProducao c : lista) {
            if (c.getId() > maiorId) {
                maiorId = c.getId();
            }
        }
        novo.setId(maiorId + 1);

        lista.add(novo);
        ArquivoJson.gravar(caminho, lista);
    }

    // ALTERAR: troca o lote que tem o mesmo id pelo lote recebido.
    public void alterar(LoteProducao alterado) throws IOException {
        ArrayList<LoteProducao> lista = listar();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == alterado.getId()) {
                lista.set(i, alterado);   // set(posição, novoObjeto)
            }
        }
        ArquivoJson.gravar(caminho, lista);
    }

    // EXCLUIR: remove da lista o lote com este id e regrava o arquivo.
    public void excluir(int id) throws IOException {
        ArrayList<LoteProducao> lista = listar();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == id) {
                lista.remove(i);
                break;   // já achou: pode parar o laço
            }
        }
        ArquivoJson.gravar(caminho, lista);
    }
}
