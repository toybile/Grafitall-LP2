package grafitall;

/*
 * CLASSE DE MODELO: Cliente
 *
 * Representa UM cliente atacadista da fábrica.
 * Cada objeto vira um registro dentro de WebContent/dados/clientes.json.
 */
public class Cliente {

    // ---------- ATRIBUTOS ----------
    private int id;              // número único, criado pelo sistema
    private String razaoSocial;  // nome oficial da empresa cliente
    private String cnpj;         // texto, para guardar pontos, barra e traço
    private String telefone;     // texto, para guardar parênteses e traço
    private String cidadeUf;     // ex.: "São Paulo/SP"

    // ---------- CONSTRUTORES ----------

    // Sem argumentos: usado pela Gson ao ler o JSON.
    public Cliente() {
    }

    // Com argumentos: inicia todos os atributos de uma vez.
    public Cliente(int id, String razaoSocial, String cnpj, String telefone, String cidadeUf) {
        this.id = id;
        this.razaoSocial = razaoSocial;
        this.cnpj = cnpj;
        this.telefone = telefone;
        this.cidadeUf = cidadeUf;
    }

    // ---------- GET e SET ----------

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCidadeUf() {
        return cidadeUf;
    }

    public void setCidadeUf(String cidadeUf) {
        this.cidadeUf = cidadeUf;
    }

    @Override
    public String toString() {
        return "Cliente [id=" + id + ", razaoSocial=" + razaoSocial + "]";
    }
}
