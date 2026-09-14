#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    double capacidadeMaxima;
    double cargaAtual = 0.0;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidadeMaxima;

    int opcao;

    do {
        cout << endl;
        cout << "=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1) {
            cout << fixed << setprecision(2);
            cout << "Carga Atual: " << cargaAtual << " kg / " << capacidadeMaxima << " kg" << endl;
            cout << "Espaco Disponivel: " << (capacidadeMaxima - cargaAtual) << " kg" << endl;
        } else if (opcao == 2) {
            double pesoPacote;

            cout << "Digite o peso do pacote a ser carregado (kg): ";
            cin >> pesoPacote;

            if (cargaAtual + pesoPacote > capacidadeMaxima) {
                cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
            } else {
                cargaAtual += pesoPacote;
                cout << "Pacote adicionado com sucesso!" << endl;
            }
        } else if (opcao == 3) {
            double pesoPacote;

            cout << "Digite o peso do pacote a ser descarregado (kg): ";
            cin >> pesoPacote;

            if (pesoPacote <= cargaAtual) {
                cargaAtual -= pesoPacote;
            }
        } else if (opcao == 4) {
            cout << "Encerrando sistema de telemetria..." << endl;
        }
    } while (opcao != 4);

    return 0;
}
