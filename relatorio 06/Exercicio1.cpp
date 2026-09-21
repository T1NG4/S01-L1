#include <iostream>
#include <string>

using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    Banda(string nome, int integrantes, float potenciaSom, int energia) {
        this->nome = nome;
        this->integrantes = integrantes;
        this->potenciaSom = potenciaSom;
        this->energia = energia;
    }

    void duelar(Banda &rival) {
        cout << nome << " esta se apresentando no duelo!" << endl;
        rival.energia -= potenciaSom;
    }

    void mostrarStatus() {
        cout << "Banda: " << nome
             << " | Integrantes: " << integrantes
             << " | Potencia de Som: " << potenciaSom
             << " | Energia: " << energia << endl;
    }
};

int main() {
    Banda banda1("Rockers", 5, 15.5, 100);
    Banda banda2("Metalheads", 4, 20.0, 90);

    cout << "=== ANTES DO DUELO ===" << endl;
    banda1.mostrarStatus();
    banda2.mostrarStatus();

    banda1.duelar(banda2);

    cout << endl;
    cout << "=== DEPOIS DO DUELO ===" << endl;
    banda1.mostrarStatus();
    banda2.mostrarStatus();

    return 0;
}
