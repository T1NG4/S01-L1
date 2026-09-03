use std::io::{self, Write};

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("--- Números no intervalo terminados em {} ---", digito);

    for numero in limite_inferior..=limite_superior {
        if numero % 10 == digito {
            println!("{}", numero);
        }
    }
}

fn main() {
    print!("Digite o dígito final desejado (0 a 9): ");
    io::stdout().flush().expect("Erro ao escrever no terminal");
    let mut entrada = String::new();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Erro ao ler o dígito");
    let digito: i32 = entrada.trim().parse().expect("Digite um número inteiro");

    print!("Digite o limite inferior: ");
    io::stdout().flush().expect("Erro ao escrever no terminal");
    entrada.clear();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Erro ao ler o limite inferior");
    let limite_inferior: i32 = entrada.trim().parse().expect("Digite um número inteiro");

    print!("Digite o limite superior: ");
    io::stdout().flush().expect("Erro ao escrever no terminal");
    entrada.clear();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Erro ao ler o limite superior");
    let limite_superior: i32 = entrada.trim().parse().expect("Digite um número inteiro");

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
