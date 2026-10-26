// 1. Parte composta: Classe Pistola
class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

// 2. Classe base: AgenteProtocolo (Contrato e Composição)
class AgenteProtocolo {
    // Atributo privado para composição da Pistola
    #pistola;

    constructor(codinome, modeloDaPistola) {
        // Atributo público
        this.codinome = codinome;
        // Composição: a Pistola é instanciada dentro do constructor e armazenada em #pistola
        this.#pistola = new Pistola(modeloDaPistola);
    }

    // Método abstrato/contrato: lança erro se não for sobrescrito
    usarHabilidade() {
        throw new Error(`O método usarHabilidade() deve ser implementado pela subclasse de ${this.codinome}.`);
    }

    // Método entrarEmCombate: imprime codinome, modelo da pistola e texto de usarHabilidade()
    entrarEmCombate() {
        console.log(`[Combate] Agente: ${this.codinome} | Pistola: ${this.#pistola.modelo} | Habilidade: ${this.usarHabilidade()}`);
    }
}

// 3. Classes filhas sem constructor próprio, sobrescrevendo usarHabilidade()
class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return "Cortina de Fumaça e Nuvem Venenosa";
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return "Flecha Rastreadora de Reconhecimento";
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return "Impulso de Vento Cortante (Dash)";
    }
}

// 4. Agregação: Classe Esquadrao
class Esquadrao {
    // Atributo privado para armazenar agentes agregados
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        // Agregação: recebe array de agentes previamente existentes
        this.#agentes = agentes;
    }

    // 5. Iniciar partida: imprime nome e chama entrarEmCombate() de cada agente (polimorfismo)
    iniciarPartida() {
        console.log(`=== Iniciando Partida: Esquadrão ${this.nome} ===`);
        this.#agentes.forEach(agente => agente.entrarEmCombate());
    }

    // 6. Listar controladores: filtra agentes usando instanceof Controlador
    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}

// 7 e 8. Função principal (main)
function main() {
    // Criando dois controladores, um iniciador e um duelista
    const viper = new Controlador("Viper", "Ghost");
    const brimstone = new Controlador("Brimstone", "Classic");
    const sova = new Iniciador("Sova", "Sheriff");
    const jett = new Duelista("Jett", "Frenzy");

    // Agregação: reunindo os agentes no esquadrão
    const esquadrao = new Esquadrao("Protocolo Radiante", [viper, brimstone, sova, jett]);

    // Iniciar a partida
    esquadrao.iniciarPartida();
    console.log();

    // Listar apenas os controladores do esquadrão com forEach
    console.log("=== Controladores do Esquadrão ===");
    const controladores = esquadrao.listarControladores();
    controladores.forEach(controlador => {
        console.log(`- Agente Controlador: ${controlador.codinome}`);
    });
    console.log();

    // 8. Criar um AgenteProtocolo diretamente:
    // O objeto é instanciado com sucesso, mas chamar entrarEmCombate() dispara o erro de usarHabilidade()
    const recruta = new AgenteProtocolo("Recruta", "Classic");
    // recruta.entrarEmCombate(); // Linha comentada para o programa rodar (lança: Error: O método usarHabilidade()...)
}

main();
