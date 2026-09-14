package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func ValidarCodigoRastreio(codigo string) (bool, string) {
	if len(codigo) == 10 {
		return true, "Código de rastreio registrado no sistema!"
	}
	return false, "Erro: O código de rastreio deve ter exatamente 10 caracteres."
}

func main() {
	leitor := bufio.NewReader(os.Stdin)

	for {
		fmt.Print("Digite o código de rastreio: ")
		codigo, _ := leitor.ReadString('\n')
		codigo = strings.TrimSpace(codigo)

		valido, mensagem := ValidarCodigoRastreio(codigo)
		fmt.Println(mensagem)

		if valido {
			break
		}
	}
}
