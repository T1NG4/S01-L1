use std::io::{self, Write};

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let npt = (prova1 + prova2) / 2.0;
    let pf = npt * 0.6 + redacao * 0.4;

    if pf >= 60.0 {
        println!("Parabéns! Candidato aprovado no processo seletivo.");
    } else {
        println!("Infelizmente o candidato não atingiu a pontuação mínima de aprovação.");
    }

    pf
}

fn main() {
    print!("Digite a nota da Prova Teórica 1: ");
    io::stdout().flush().expect("Erro ao escrever no terminal");
    let mut entrada = String::new();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Erro ao ler a nota");
    let prova1: f64 = entrada.trim().parse().expect("Digite um número válido");

    print!("Digite a nota da Prova Teórica 2: ");
    io::stdout().flush().expect("Erro ao escrever no terminal");
    entrada.clear();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Erro ao ler a nota");
    let prova2: f64 = entrada.trim().parse().expect("Digite um número válido");

    print!("Digite a nota da Redação: ");
    io::stdout().flush().expect("Erro ao escrever no terminal");
    entrada.clear();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Erro ao ler a nota");
    let redacao: f64 = entrada.trim().parse().expect("Digite um número válido");

    let pontuacao_final = calcular_pontuacao(prova1, prova2, redacao);
    println!("Pontuação Final: {:.2}", pontuacao_final);
}
