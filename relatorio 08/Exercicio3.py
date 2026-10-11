# Composicao: a Persona e criada dentro do Lider — nasce e existe junto com ele.
# Agregacao: os Aliados existem antes do Lider e sao apenas adicionados a _equipe.


class Persona:
    def __init__(self, nome, arcano):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona {self.nome} ({self.arcano}) invocada!")


class Aliado:
    def __init__(self, nome, codinome):
        self.nome = nome
        self.codinome = codinome


class Lider:
    def __init__(self, codinome):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe: list[Aliado] = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)

    def infiltrar(self, palacio):
        print(f"Invadindo o palacio de {palacio}...")
        self.persona.invocar()
        print("Phantom Thieves presentes:")
        for aliado in self._equipe:
            print(f"  {aliado.codinome} ({aliado.nome})")


if __name__ == "__main__":
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("")
