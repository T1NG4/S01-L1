import java.util.ArrayList;

// Classe base para itens do cardápio
class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

// Subclasse para combos com desconto
class ComboLeblanc extends ItemDoCardapio {
    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

// Classe para gerenciar o cardápio
class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        cardapio = new ArrayList<ItemDoCardapio>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        for (ItemDoCardapio item : cardapio) {
            System.out.println(item.getNome() + " - R$ " + item.precoFinal());
        }
    }
}

public class Exercicio2 {
    public static void main(String[] args) {
        // Criar dois ItemDoCardapio e um ComboLeblanc
        ItemDoCardapio cafe = new ItemDoCardapio("Café Blend", 15.0);
        ItemDoCardapio curry = new ItemDoCardapio("Curry Especial", 25.0);
        ComboLeblanc combo = new ComboLeblanc("Combo Café + Curry", 35.0);

        // Criar um CafeLeblanc
        CafeLeblanc cafeLeblanc = new CafeLeblanc();

        // Adicionar os três itens ao cardápio
        cafeLeblanc.adicionar(cafe);
        cafeLeblanc.adicionar(curry);
        cafeLeblanc.adicionar(combo);

        // Mostrar o cardápio
        cafeLeblanc.mostrarCardapio();
    }
}
