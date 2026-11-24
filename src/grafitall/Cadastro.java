package grafitall;

/*
 * SUPERCLASSE ABSTRATA: Cadastro
 *
 * Tudo o que os três cadastros têm em comum fica aqui: o id, que é o
 * número único que o sistema dá a cada registro.
 *
 * MateriaPrima, LoteProducao e Cliente HERDAM desta classe (extends Cadastro).
 * A relação "é um" é verdadeira: uma matéria-prima É UM cadastro do sistema,
 * um lote É UM cadastro, um cliente É UM cadastro.
 *
 * abstract = não se cria um objeto "Cadastro" sozinho (new Cadastro() não
 * compila). Ela só existe para ser herdada.
 *
 * protected = o atributo fica escondido de fora (como private), mas as
 * subclasses conseguem enxergá-lo.
 */
public abstract class Cadastro {

    protected int id;

    // Construtor sem argumentos: usado pela Gson ao ler o JSON.
    public Cadastro() {
    }

    // Construtor com o id. As subclasses chamam com super(id).
    public Cadastro(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Método abstrato: cada subclasse É OBRIGADA a escrever o seu.
    // Devolve um texto curto que identifica o registro. É usado no título
    // dos formulários de edição (ex.: "Editar cliente: Papelaria Central").
    public abstract String getDescricao();
}
