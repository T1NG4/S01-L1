#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
public:
    string nome;

    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }
};

class Aluno : public MembroInatel {
public:
    string curso;

    void seApresentar() override {
        cout << "Meu nome e " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};

class Professor : public MembroInatel {
public:
    string disciplina;

    void seApresentar() override {
        cout << "Meu nome e " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main() {
    Aluno aluno;
    aluno.nome = "Pedro Henrique";
    aluno.curso = "Engenharia de Software";

    Professor professor;
    professor.nome = "Carlos Silva";
    professor.disciplina = "Programacao Orientada a Objetos";

    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}
