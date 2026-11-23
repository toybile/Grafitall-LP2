package grafitall;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/*
 * CLASSE AUXILIAR: ArquivoJson
 *
 * É a ÚNICA classe que mexe diretamente nos arquivos .json.
 * Os três DAOs (MateriaPrimaDAO, LoteProducaoDAO e ClienteDAO) chamam estes
 * dois métodos, em vez de cada um repetir o mesmo código de ler e gravar.
 *
 * Quem transforma objeto Java <-> texto JSON é a biblioteca Gson:
 *   - gson.toJson(lista)          : lista de objetos  ->  texto JSON  (gravar)
 *   - gson.fromJson(texto, tipo)  : texto JSON        ->  lista de objetos (ler)
 * Assim o JSON nunca é montado "na mão" com Strings.
 */
public class ArquivoJson {

    // Um único objeto Gson, configurado uma vez para a classe toda (static).
    //  - setPrettyPrinting(): grava o JSON com quebras de linha, fácil de ler.
    //  - LOWER_CASE_WITH_UNDERSCORES: o atributo Java "dataFabricacao" vira
    //    "data_fabricacao" no arquivo, igual ao que foi definido na proposta.
    private static Gson gson = new GsonBuilder()
            .setPrettyPrinting()
            .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
            .create();

    /*
     * LER: abre o arquivo e devolve a lista de objetos que está nele.
     *
     * caminho = endereço completo do arquivo .json no computador
     * tipo    = "de que é a lista" (ex.: lista de Cliente). O DAO informa isso
     *           usando TypeToken, porque a Gson precisa saber qual classe criar.
     *
     * <T> quer dizer "qualquer tipo": o mesmo método serve para Cliente,
     * LoteProducao ou MateriaPrima.
     */
    public static <T> ArrayList<T> ler(String caminho, Type tipo) throws IOException {
        File arquivo = new File(caminho);

        // Se o arquivo ainda não existe, ainda não há registros: lista vazia.
        if (!arquivo.exists()) {
            return new ArrayList<T>();
        }

        // try-with-resources: o leitor é fechado sozinho no final, mesmo com erro.
        try (FileReader leitor = new FileReader(arquivo, StandardCharsets.UTF_8)) {
            ArrayList<T> lista = gson.fromJson(leitor, tipo);

            // Arquivo vazio faz a Gson devolver null; trocamos por lista vazia.
            if (lista == null) {
                lista = new ArrayList<T>();
            }
            return lista;
        }
    }

    /*
     * GRAVAR: transforma a lista inteira em JSON e reescreve o arquivo.
     * (Sempre regrava o arquivo todo: é o jeito mais simples.)
     */
    public static <T> void gravar(String caminho, ArrayList<T> lista) throws IOException {
        File arquivo = new File(caminho);

        // Cria a pasta "dados" caso ela ainda não exista.
        arquivo.getParentFile().mkdirs();

        try (FileWriter escritor = new FileWriter(arquivo, StandardCharsets.UTF_8)) {
            gson.toJson(lista, escritor);
        }
    }
}
