#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Hobbit {
public:
    string nome;

    virtual void fazerAtividade() {
        cout << "O hobbit " << nome << " esta aproveitando um dia tranquilo na Comarca." << endl;
    }

    virtual ~Hobbit() {}
};

class Jardineiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O jardineiro " << nome << " esta cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

class Cozinheiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O cozinheiro " << nome << " esta preparando o segundo cafe da manha para os convidados!" << endl;
    }
};

class Fazendeiro : public Hobbit {
public:
    void fazerAtividade() override {
        cout << "O fazendeiro " << nome << " esta colhendo vegetais e hortalias em suas terras!" << endl;
    }
};

int main() {
    vector<Hobbit*> hobbits;

    Jardineiro jardineiro;
    jardineiro.nome = "Samwise Gamgee";
    hobbits.push_back(&jardineiro);

    Cozinheiro cozinheiro;
    cozinheiro.nome = "Peregrin Took";
    hobbits.push_back(&cozinheiro);

    Fazendeiro fazendeiro;
    fazendeiro.nome = "Meriadoc Brandybuck";
    hobbits.push_back(&fazendeiro);

    for (Hobbit* hobbit : hobbits) {
        hobbit->fazerAtividade();
    }

    return 0;
}
