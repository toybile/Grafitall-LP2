package grafitall;

/*
 * CLASSE DE MODELO: MateriaPrima
 *
 * Representa UMA matéria-prima da fábrica (ex.: grafite em pó, argila, cera).
 * Cada objeto desta classe vira um registro { ... } dentro do arquivo
 * WebContent/dados/materias-primas.json.
 *
 * Regras de classe vistas nos slides:
 *  - nome da classe com letra maiúscula e qualificador public;
 *  - atributos com letra minúscula e qualificador private (encapsulamento);
 *  - acesso aos atributos somente pelos métodos get e set.
 */
public class MateriaPrima {

    // ---------- ATRIBUTOS (private = só a própria classe enxerga) ----------
    private int id;                       // número único, criado pelo sistema
    private String nome;                  // ex.: "Argila"
    private Double quantidadeEstoqueKg;   // quantos kg há no estoque
    private String fornecedor;            // quem vende essa matéria-prima
    private Double precoPorKg;            // preço de 1 kg, em reais

    // ---------- CONSTRUTORES ----------

    // Construtor sem argumentos: a biblioteca Gson precisa dele para
    // conseguir criar o objeto quando lê o arquivo JSON.
    public MateriaPrima() {
    }

    // Construtor com argumentos: inicia os atributos com os valores recebidos.
    public MateriaPrima(int id, String nome, Double quantidadeEstoqueKg,
                        String fornecedor, Double precoPorKg) {
        this.id = id;
        this.nome = nome;
        this.quantidadeEstoqueKg = quantidadeEstoqueKg;
        this.fornecedor = fornecedor;
        this.precoPorKg = precoPorKg;
    }

    // ---------- MÉTODOS DE ACESSO (GET e SET) ----------

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getQuantidadeEstoqueKg() {
        return quantidadeEstoqueKg;
    }

    public void setQuantidadeEstoqueKg(Double quantidadeEstoqueKg) {
        this.quantidadeEstoqueKg = quantidadeEstoqueKg;
    }

    public String getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(String fornecedor) {
        this.fornecedor = fornecedor;
    }

    public Double getPrecoPorKg() {
        return precoPorKg;
    }

    public void setPrecoPorKg(Double precoPorKg) {
        this.precoPorKg = precoPorKg;
    }

    // ---------- SOBRESCRITA DO toString (vem da classe Object) ----------
    // Mantém exatamente a assinatura: public, retorna String, sem argumentos.
    @Override
    public String toString() {
        return "MateriaPrima [id=" + id + ", nome=" + nome + "]";
    }
}
