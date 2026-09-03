package main

import "fmt"

func main() {
	var quantidade int

	fmt.Print("Digite a quantidade de plantões necessários: ")
	fmt.Scan(&quantidade)

	fmt.Println("--- Escala de Plantão Técnico ---")

	dia := 1
	for i := 1; i <= quantidade; i++ {
		fmt.Printf("Plantão %d: Dia %d do mês\n", i, dia)
		dia += 4
	}
}
