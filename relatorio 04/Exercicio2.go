package main

import "fmt"

func main() {
	var t1, t2, t3 int

	fmt.Print("Digite as vendas do 1º trimestre: ")
	fmt.Scan(&t1)

	fmt.Print("Digite as vendas do 2º trimestre: ")
	fmt.Scan(&t2)

	fmt.Print("Digite as vendas do 3º trimestre: ")
	fmt.Scan(&t3)

	soma := t1 + t2 + t3
	fmt.Printf("Total de vendas: %d unidades\n", soma)

	if soma < 100 {
		fmt.Println("Meta mínima anual não atingida!")
		return
	}

	var classificacao string

	switch {
	case soma >= 250:
		classificacao = "Categoria Top Seller"
	case soma >= 180 && soma <= 249:
		classificacao = "Categoria Sênior"
	case soma >= 100 && soma <= 179:
		classificacao = "Categoria Pleno"
	}

	fmt.Println("Classificação:", classificacao)
}
