use std::io::{self, Write};

fn validar_placa(placa: &str) -> bool {
    if placa.len() < 7 {
        return false;
    }

    let mut letras_maiusculas = 0;
    let mut numeros = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            letras_maiusculas += 1;
        }
        if c.is_numeric() {
            numeros += 1;
        }
    }

    letras_maiusculas >= 3 && numeros >= 2
}

fn main() {
    loop {
        print!("Digite a placa do veículo: ");
        io::stdout().flush().expect("Erro ao escrever no terminal");

        let mut placa = String::new();
        io::stdin()
            .read_line(&mut placa)
            .expect("Erro ao ler a placa");

        let placa = placa.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa inválida. Tente novamente!");
        }
    }
}
