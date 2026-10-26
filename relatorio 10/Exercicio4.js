// 1. Classe base UsuarioDeNen
class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    // Método atacar: ataque genérico de aura citando o nome dos dois
    atacar(alvo) {
        console.log(`${this.nome} disparou uma rajada genérica de aura contra ${alvo.nome}!`);
    }
}

// 2. Classes filhas sem constructor próprio, sobrescrevendo atacar(alvo)
class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`[Intensificação] ${this.nome} concentrou aura extrema no punho (Jajanken) e desferiu um soco devastador em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`[Transmutação] ${this.nome} transformou sua aura em eletricidade de alta voltagem (Narukami) e atingiu ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`[Materialização] ${this.nome} materializou correntes indestrutíveis de Nen (Chain Jail) capturando e atacando ${alvo.nome}!`);
    }
}

// 3. Classe Aranha
class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

// 4. Agregação: Classe TrupeFantasma
class TrupeFantasma {
    // Atributo privado para guardar as aranhas
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        // Agregação: recebe array de Aranhas já criadas (valor padrão [])
        this.#aranhas = aranhas;
    }

    // Imprime a cidade e o número e nome de cada aranha com forEach
    revelarAranhas() {
        console.log(`=== Trupe Fantasma avistada em: ${this.cidade} ===`);
        this.#aranhas.forEach(aranha => {
            console.log(`- Aranha #${aranha.numero}: ${aranha.nome}`);
        });
    }

    // Usa find para retornar a Aranha com o número informado
    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}

// 5 e 6. Função principal (main)
function main() {
    // 5. Criando duas Aranhas antes da Trupe
    const chrollo = new Aranha("Chrollo Lucilfer", 0);
    const uvogin = new Aranha("Uvogin", 11);

    // Criando a Trupe Fantasma com a cidade e as aranhas já existentes (Agregação)
    const trupe = new TrupeFantasma("Yorknew City", [chrollo, uvogin]);

    // Revelar membros da Trupe
    trupe.revelarAranhas();
    console.log();

    // Buscar uma das aranhas pelo número tatuado
    const numeroBuscado = 11;
    const aranhaAlvo = trupe.buscarAranha(numeroBuscado);
    console.log(`Aranha alvo encontrada: #${aranhaAlvo.numero} - ${aranhaAlvo.nome}`);
    console.log();

    // 6. Criando array com um usuário de Nen de cada tipo
    const gon = new Intensificador("Gon Freecss");
    const killua = new Transmutador("Killua Zoldyck");
    const kurapika = new Materializador("Kurapika");

    const hunters = [gon, killua, kurapika];

    // Percorrendo com forEach e executando o polimorfismo de ataque contra a aranha
    console.log(`=== Batalha: Hunters atacando ${aranhaAlvo.nome} ===`);
    hunters.forEach(hunter => {
        hunter.atacar(aranhaAlvo);
    });
}

main();
