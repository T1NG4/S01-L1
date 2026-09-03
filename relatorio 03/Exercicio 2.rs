use std::io::{self, Write};

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    (palpite - numero_secreto).abs() <= 5
}

fn main() {
    let numero_secreto: i32 = 42;

    loop {
        print!("Digite seu palpite: ");
        io::stdout().flush().expect("Erro ao escrever no terminal");

        let mut palpite = String::new();
        io::stdin()
            .read_line(&mut palpite)
            .expect("Erro ao ler o palpite");

        let palpite: i32 = palpite.trim().parse().expect("Digite um número inteiro");

        if acertou_o_alvo(palpite, numero_secreto) {
            let distancia = (palpite - numero_secreto).abs();
            println!("Parabéns, você acertou o alvo!");
            println!(
                "Você ficou a apenas {} unidade(s) do número secreto ({}).",
                distancia, numero_secreto
            );
            break;
        } else {
            println!("Você passou longe! Tente novamente.");
        }
    }
}
