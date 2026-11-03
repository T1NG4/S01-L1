import java.util.HashMap;

// Interface para seres sobrenaturais
interface Sobrenatural {
    void manifestar();
}

// Implementação da interface para alienígenas
class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O alienígena " + nome + " emerge do espaço e começa a abduzir vacas!");
    }
}

// Implementação da interface para espíritos youkai
class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println("O espírito " + nome + " aparece das sombras e começa a assustar as pessoas!");
    }
}

// Classe para gerenciar avistamentos
class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        avistamentos = new HashMap<String, Sobrenatural>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println("O local " + local + " está tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}

public class Exercicio3 {
    public static void main(String[] args) {
        // Criar um Alienigena e um EspiritoYoukai
        Alienigena alien = new Alienigena("Zorg");
        EspiritoYoukai espirito = new EspiritoYoukai("Kitsune");

        // Criar o mapa de avistamentos
        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        // Registrar cada um em um local
        mapa.registrar("Floresta Misteriosa", alien);
        mapa.registrar("Templo Antigo", espirito);

        // Investigar os dois locais registrados e um terceiro não registrado
        mapa.investigar("Floresta Misteriosa");
        mapa.investigar("Templo Antigo");
        mapa.investigar("Praia do Sol");
    }
}
