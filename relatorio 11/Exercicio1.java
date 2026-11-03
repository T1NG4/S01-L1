// Classe abstrata base
abstract class Morador {
    protected String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public abstract void apresentar();
}

// Subclasse concreta para mago
class Mago extends Morador {
    public Mago(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Olá, eu sou " + nome + ", o mago do castelo!");
    }
}

// Subclasse concreta para demônio do fogo
class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Olá, eu sou " + nome + ", o demônio do fogo que faz o castelo andar!");
    }
}

public class Exercicio1 {
    public static void main(String[] args) {
        // Criar um Mago e um DemonioDoFogo, armazenando ambos em variáveis do tipo Morador
        Morador mago = new Mago("Gandalf");
        Morador demonio = new DemonioDoFogo("Ignis");

        // Chamar apresentar() em ambos
        mago.apresentar();
        demonio.apresentar();

        // Tentar criar um Morador diretamente (vai dar erro de compilação)
        // Morador morador = new Morador("Teste"); // Erro: Morador is abstract; cannot be instantiated
    }
}
