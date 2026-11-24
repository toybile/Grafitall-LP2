package grafitall;

/*
 * CLASSE DE MODELO: LoteProducao
 *
 * Representa UM lote de minas de grafite que a fábrica produziu.
 * Cada objeto vira um registro dentro de WebContent/dados/lotes-producao.json.
 */
public class LoteProducao extends Cadastro {

    // ---------- ATRIBUTOS ----------
    // O id NÃO está aqui: ele é herdado da classe Cadastro.
    private String graduacao;                    // dureza da mina: de "12H" até "12B"
    private Integer quantidadeProduzidaUnidades; // quantas minas o lote tem
    private String dataFabricacao;               // guardada como texto: "01/10/2026"
    private String status;                       // "Em produção" ou "Finalizado"

    // ---------- CONSTANTES ----------
    // "static final" = um valor fixo que pertence à classe, e não a cada objeto.
    // A lista abaixo monta o menu suspenso do formulário, para que a graduação
    // seja sempre escrita do mesmo jeito (12H ... 2H, H, F, HB, B, 2B ... 12B).
    public static final String[] GRADUACOES = {
        "12H", "11H", "10H", "9H", "8H", "7H", "6H", "5H", "4H", "3H", "2H",
        "H", "F", "HB", "B",
        "2B", "3B", "4B", "5B", "6B", "7B", "8B", "9B", "10B", "11B", "12B"
    };

    // Os dois status possíveis de um lote.
    public static final String[] STATUS = { "Em produção", "Finalizado" };

    // ---------- CONSTRUTORES ----------

    // Sem argumentos: usado pela Gson ao ler o JSON.
    public LoteProducao() {
    }

    // Com argumentos: inicia todos os atributos de uma vez.
    public LoteProducao(int id, String graduacao, Integer quantidadeProduzidaUnidades,
                        String dataFabricacao, String status) {
        super(id);   // chama o construtor de Cadastro (precisa ser a 1ª linha)
        this.graduacao = graduacao;
        this.quantidadeProduzidaUnidades = quantidadeProduzidaUnidades;
        this.dataFabricacao = dataFabricacao;
        this.status = status;
    }

    // ---------- GET e SET ----------

    public String getGraduacao() {
        return graduacao;
    }

    public void setGraduacao(String graduacao) {
        this.graduacao = graduacao;
    }

    public Integer getQuantidadeProduzidaUnidades() {
        return quantidadeProduzidaUnidades;
    }

    public void setQuantidadeProduzidaUnidades(Integer quantidadeProduzidaUnidades) {
        this.quantidadeProduzidaUnidades = quantidadeProduzidaUnidades;
    }

    public String getDataFabricacao() {
        return dataFabricacao;
    }

    public void setDataFabricacao(String dataFabricacao) {
        this.dataFabricacao = dataFabricacao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Implementa o método abstrato de Cadastro (é obrigatório).
    @Override
    public String getDescricao() {
        return "Lote " + graduacao + " de " + dataFabricacao;
    }

    @Override
    public String toString() {
        return "LoteProducao [id=" + id + ", graduacao=" + graduacao + "]";
    }
}
