import java.util.ArrayList;

// Classe abstrata para monstros
abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

// Subclasse concreta para slimes
class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Fritar em alta temperatura até ficar crocante";
    }
}

// Subclasse concreta para mandragoras
class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cortar em pedaços e refogar com ervas aromáticas";
    }
}

// Classe para representar uma panela
class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

// Classe para representar um cozinheiro
class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<Monstro>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro: " + nome);
        System.out.println("Panela de: " + panela.getMaterial());
        System.out.println("Ingredientes:");
        for (Monstro monstro : ingredientes) {
            System.out.println("  - " + monstro.getNome() + ": " + monstro.receita());
        }
    }
}

public class Exercicio4 {
    public static void main(String[] args) {
        // Criar um Slime e uma Mandragora
        Slime slime = new Slime("Slime Azul");
        Mandragora mandragora = new Mandragora("Mandragora Venenosa");

        // Criar o cozinheiro com nome e material da panela
        Cozinheiro cozinheiro = new Cozinheiro("Laios", "Ferro");

        // Adicionar os dois monstros como ingredientes
        cozinheiro.adicionarIngrediente(slime);
        cozinheiro.adicionarIngrediente(mandragora);

        // Servir o banquete
        cozinheiro.servirBanquete();

        // Explicação sobre composição e agregação:
        // - Composição: A Panela é parte essencial do Cozinheiro - se o Cozinheiro for destruído,
        //   a Panela também é destruída (relação forte, ciclo de vida vinculado).
        // - Agregação: Os Monstros (ingredientes) são adicionados ao Cozinheiro, mas podem existir
        //   independentemente - se o Cozinheiro for destruído, os Monstros continuam existindo
        //   (relação fraca, ciclo de vida independente).
    }
}
