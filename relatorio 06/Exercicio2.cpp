#include <iostream>
#include <string>

using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:
    void setNome(string nome) {
        this->nome = nome;
    }

    void setArcana(string arcana) {
        this->arcana = arcana;
    }

    void setRank(int rank) {
        this->rank = rank;
    }

    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void subirRank() {
        rank++;
    }
};

int main() {
    LinkSocial link;

    link.setNome("Ann Takamaki");
    link.setArcana("Panther");
    link.setRank(1);

    link.subirRank();

    cout << "=== DADOS DO LINK SOCIAL ===" << endl;
    cout << "Nome: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    return 0;
}
