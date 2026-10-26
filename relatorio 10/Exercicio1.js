// 1. Classe base Pokemon
class Pokemon {
    // Atributo privado
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        // Atributos públicos
        this.apelido = apelido;
        this.tipo = tipo;
        // Atributo privado inicializado com vidaInicial
        this.#vida = vidaInicial;
    }

    // Getter para vida (somente leitura de fora)
    get vida() {
        return this.#vida;
    }

    // Método sofrerDano: subtrai pontos sem deixar a vida negativa
    sofrerDano(pontos) {
        this.#vida -= pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} sofreu ${pontos} de dano! Vida restante: ${this.#vida}`);
    }

    // Método atacar: ataque genérico causando 10 de dano ao alvo
    atacar(alvo) {
        console.log(`${this.apelido} realizou um ataque básico contra ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

// 2. Classe filha Squirtle (tipo fixo 'Água')
class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    // Sobrescrita do método atacar com golpe de água e 20 de dano
    atacar(alvo) {
        console.log(`${this.apelido} usou Pistola d'Água (Water Gun) em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

// 3. Classe filha Bulbasaur (tipo fixo 'Planta')
class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    // Sobrescrita do método atacar com golpe de planta e 15 de dano
    atacar(alvo) {
        console.log(`${this.apelido} usou Chicote de Vinha (Vine Whip) em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}

// 4. Função principal (main)
function main() {
    console.log("=== Batalha Pokémon ===");

    // Criando Squirtle e Bulbasaur (Bulbasaur deve começar com 30 de vida)
    const squirtle = new Squirtle("Squirtle", 50);
    const bulbasaur = new Bulbasaur("Bulbasaur", 30);

    console.log(`Batalha iniciada entre ${squirtle.apelido} (Vida: ${squirtle.vida}) e ${bulbasaur.apelido} (Vida: ${bulbasaur.vida})!\n`);

    // Bulbasaur ataca Squirtle uma vez
    bulbasaur.atacar(squirtle);
    console.log();

    // Squirtle ataca Bulbasaur duas vezes
    squirtle.atacar(bulbasaur);
    squirtle.atacar(bulbasaur);
    console.log();

    // Imprimir a vida dos dois usando o getter
    console.log("=== Status Final ===");
    console.log(`Vida de ${squirtle.apelido}: ${squirtle.vida}`);
    console.log(`Vida de ${bulbasaur.apelido}: ${bulbasaur.vida}`);

    // 5. Teste de acesso direto ao atributo privado #vida:
    // Tentar acessar diretamente de fora resulta em erro de sintaxe e o programa nem roda:
    // SyntaxError: Private field '#vida' must be declared in an enclosing class
    // console.log(squirtle.#vida);
}

main();
