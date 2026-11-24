package grafitall;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

import com.google.gson.reflect.TypeToken;

/*
 * DAO = Data Access Object ("objeto de acesso aos dados").
 *
 * O MateriaPrimaDAO cuida das quatro operações do cadastro de matérias-primas:
 *   incluir, alterar, excluir e listar (+ buscarPorId, usado no "Editar").
 * As páginas JSP NÃO mexem no arquivo: elas só chamam estes métodos.
 *
 * Todas as operações seguem a mesma ideia simples:
 *   1. ler a lista inteira do arquivo;
 *   2. mudar a lista na memória (adicionar, trocar ou remover um item);
 *   3. gravar a lista inteira de volta no arquivo.
 */
public class MateriaPrimaDAO {

    // Endereço do arquivo materias-primas.json (a página JSP informa no construtor).
    private String caminho;

    // "Lista de MateriaPrima" escrita de um jeito que a Gson entende.
    private Type tipoLista = new TypeToken<ArrayList<MateriaPrima>>() {}.getType();

    public MateriaPrimaDAO(String caminho) {
        this.caminho = caminho;
    }

    // LISTAR: devolve todas as matérias-primas do arquivo.
    public ArrayList<MateriaPrima> listar() throws IOException {
        return ArquivoJson.ler(caminho, tipoLista);
    }

    // BUSCAR: procura a matéria-prima com este id. Devolve null se não achar.
    public MateriaPrima buscarPorId(int id) throws IOException {
        for (MateriaPrima c : listar()) {
            if (c.getId() == id) {
                return c;
            }
        }
        return null;
    }

    // INCLUIR: dá um id novo à matéria-prima e grava no fim da lista.
    public void incluir(MateriaPrima novo) throws IOException {
        ArrayList<MateriaPrima> lista = listar();

        // Novo id = maior id que já existe + 1 (o primeiro registro fica com 1).
        int maiorId = 0;
        for (MateriaPrima c : lista) {
            if (c.getId() > maiorId) {
                maiorId = c.getId();
            }
        }
        novo.setId(maiorId + 1);

        lista.add(novo);
        ArquivoJson.gravar(caminho, lista);
    }

    // ALTERAR: troca a matéria-prima que tem o mesmo id pela matéria-prima recebida.
    public void alterar(MateriaPrima alterado) throws IOException {
        ArrayList<MateriaPrima> lista = listar();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == alterado.getId()) {
                lista.set(i, alterado);   // set(posição, novoObjeto)
            }
        }
        ArquivoJson.gravar(caminho, lista);
    }

    // EXCLUIR: remove da lista a matéria-prima com este id e regrava o arquivo.
    public void excluir(int id) throws IOException {
        ArrayList<MateriaPrima> lista = listar();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == id) {
                lista.remove(i);
                break;   // já achou: pode parar o laço
            }
        }
        ArquivoJson.gravar(caminho, lista);
    }
}
