class HeroiOverwatch:
    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} ativa a habilidade suprema!")


class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} libera a suprema de tanque e protege a equipe!")


class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} usa a suprema de suporte para virar o jogo!")

    def curar_equipe(self):
        print(f"{self.codinome} cura toda a equipe!")


if __name__ == "__main__":
    time: list[HeroiOverwatch] = [
        HeroiOverwatch("Soldier: 76", "Dano"),
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte"),
    ]

    for heroi in time:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
