package grafitall;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

import com.google.gson.reflect.TypeToken;

/*
 * DAO = Data Access Object ("objeto de acesso aos dados").
 *
 * O ClienteDAO cuida das quatro operações do cadastro de clientes:
 *   incluir, alterar, excluir e listar (+ buscarPorId, usado no "Editar").
 * As páginas JSP NÃO mexem no arquivo: elas só chamam estes métodos.
 *
 * Todas as operações seguem a mesma ideia simples:
 *   1. ler a lista inteira do arquivo;
 *   2. mudar a lista na memória (adicionar, trocar ou remover um item);
 *   3. gravar a lista inteira de volta no arquivo.
 */
public class ClienteDAO {

    // Endereço do arquivo clientes.json (a página JSP informa no construtor).
    private String caminho;

    // "Lista de Cliente" escrita de um jeito que a Gson entende.
    private Type tipoLista = new TypeToken<ArrayList<Cliente>>() {}.getType();

    public ClienteDAO(String caminho) {
        this.caminho = caminho;
    }

    // LISTAR: devolve todos os clientes do arquivo.
    public ArrayList<Cliente> listar() throws IOException {
        return ArquivoJson.ler(caminho, tipoLista);
    }

    // BUSCAR: procura o cliente com este id. Devolve null se não achar.
    public Cliente buscarPorId(int id) throws IOException {
        for (Cliente c : listar()) {
            if (c.getId() == id) {
                return c;
            }
        }
        return null;
    }

    // INCLUIR: dá um id novo ao cliente e grava no fim da lista.
    public void incluir(Cliente novo) throws IOException {
        ArrayList<Cliente> lista = listar();

        // Novo id = maior id que já existe + 1 (o primeiro registro fica com 1).
        int maiorId = 0;
        for (Cliente c : lista) {
            if (c.getId() > maiorId) {
                maiorId = c.getId();
            }
        }
        novo.setId(maiorId + 1);

        lista.add(novo);
        ArquivoJson.gravar(caminho, lista);
    }

    // ALTERAR: troca o cliente que tem o mesmo id pelo cliente recebido.
    public void alterar(Cliente alterado) throws IOException {
        ArrayList<Cliente> lista = listar();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == alterado.getId()) {
                lista.set(i, alterado);   // set(posição, novoObjeto)
            }
        }
        ArquivoJson.gravar(caminho, lista);
    }

    // EXCLUIR: remove da lista o cliente com este id e regrava o arquivo.
    public void excluir(int id) throws IOException {
        ArrayList<Cliente> lista = listar();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == id) {
                lista.remove(i);
                break;   // já achou: pode parar o laço
            }
        }
        ArquivoJson.gravar(caminho, lista);
    }
}
