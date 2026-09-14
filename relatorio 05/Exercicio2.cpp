#include <iostream>
#include <iomanip>

using namespace std;

float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float confiabilidade = 1.0;

    for (int i = 0; i < tamanho; i++) {
        confiabilidade *= probabilidades[i];
    }

    return confiabilidade;
}

int main() {
    int n;

    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;

    float probabilidades[n];

    for (int i = 0; i < n; i++) {
        cout << "Digite a probabilidade do componente " << (i + 1) << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }

    float confiabilidade = calcular_confiabilidade_sistema(probabilidades, n);

    cout << fixed << setprecision(4);
    cout << "Confiabilidade total do sistema: " << confiabilidade << " (";
    cout << setprecision(2) << (confiabilidade * 100) << "%)" << endl;

    return 0;
}
