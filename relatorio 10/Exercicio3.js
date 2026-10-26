/*
 * =====================================================================================
 * EXERCÍCIO 3 - GRAVITY FALLS: COMPOSIÇÃO E AGREGAÇÃO
 * =====================================================================================
 * 
 * 6. EXPLICAÇÃO SOBRE COMPOSIÇÃO E AGREGAÇÃO NESTE PROGRAMA:
 * 
 * - COMPOSIÇÃO (FichaDeCriatura em DiarioMisterioso):
 *   Trata-se de uma relação de posse e dependência forte de ciclo de vida ("todo-parte").
 *   A classe FichaDeCriatura não é criada externamente para depois ser passada ao diário;
 *   em vez disso, o próprio Diário cria e instancia a Ficha dentro do método anotar().
 *   As fichas pertencem exclusivamente àquele diário e não existem de forma autônoma fora dele.
 * 
 * - AGREGAÇÃO (Funcionario em CabanaDoMisterio):
 *   Trata-se de uma relação associativa mais flexível e independente ("tem-um").
 *   Os objetos Funcionario (moradores de Gravity Falls como Wendy e Soos) são instanciados
 *   de forma independente fora da Cabana e continuam existindo mesmo antes de serem
 *   contratados ou caso a Cabana do Mistério feche as portas. A Cabana apenas agrega referências
 *   a esses funcionários já existentes através do método contratar().
 * =====================================================================================
 */

// 1. Classe FichaDeCriatura
class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    // Retorna string com criatura e nível de perigo
    descrever() {
        return `Criatura: ${this.criatura} | Nível de Perigo: ${this.nivelDePerigo}`;
    }
}

// 2. Classe DiarioMisterioso (Composição)
class DiarioMisterioso {
    // Atributo privado para armazenar as fichas
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    // Composição: cria uma nova FichaDeCriatura DENTRO do método e a guarda no array privado
    anotar(criatura, nivelDePerigo) {
        const novaFicha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(novaFicha);
    }

    // Exibe o número do diário e cada ficha com forEach
    exibirFichas() {
        console.log(`=== Diário Misterioso Nº ${this.numero} ===`);
        this.#fichas.forEach(ficha => {
            console.log(`- ${ficha.descrever()}`);
        });
    }
}

// 3. Classe Funcionario
class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

// 4. Classe CabanaDoMisterio (Agregação)
class CabanaDoMisterio {
    // Atributo privado para armazenar os funcionários
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    // Agregação: adiciona um funcionário já criado externamente
    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    // Imprime dono e nome/cargo de cada funcionário com forEach
    abrirAsPortas() {
        console.log(`=== Cabana do Mistério (Dono: ${this.dono}) ===`);
        console.log("Funcionários em serviço:");
        this.#funcionarios.forEach(func => {
            console.log(`- ${func.nome} | Cargo: ${func.cargo}`);
        });
    }
}

// 5. Função principal (main)
function main() {
    // --- Teste de Composição (Diário Misterioso) ---
    const diario3 = new DiarioMisterioso(3);
    diario3.anotar("Gnomos", "Médio");
    diario3.anotar("Multurso", "Alto");
    diario3.anotar("Zumbis", "Extremo");

    diario3.exibirFichas();
    console.log();

    // --- Teste de Agregação (Cabana do Mistério) ---
    // Criando os funcionários ANTES da Cabana
    const soos = new Funcionario("Soos Ramirez", "Faz-Tudo");
    const wendy = new Funcionario("Wendy Corduroy", "Balconista");

    // Criando a Cabana do Mistério com seu dono
    const cabana = new CabanaDoMisterio("Stan Pines (Tivor Stan)");

    // Contratando os funcionários criados previamente
    cabana.contratar(soos);
    cabana.contratar(wendy);

    // Abrindo as portas da Cabana
    cabana.abrirAsPortas();
}

main();
