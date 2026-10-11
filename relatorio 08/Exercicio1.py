class MortoVivo:
    def __init__(self, nome, almas, estus):
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        try:
            valor = int(quantidade)
        except (TypeError, ValueError):
            print("Quantidade de Estus inválida!")
            return

        if 0 <= valor <= 10:
            self.__estus = valor
        else:
            print("Quantidade de Estus inválida!")

    def mostrar_status(self):
        return (
            f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"
        )


class Clerigo(MortoVivo):
    def __init__(self, nome, almas, estus, milagre):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        return super().mostrar_status() + f" | Milagre: {self.milagre}"


if __name__ == "__main__":
    petrus = Clerigo("Petrus", 2000, 5, "Force")

    print(petrus.mostrar_status())

    petrus.set_estus("15")
    petrus.set_estus("10")

    print(petrus.mostrar_status())

    # print(petrus.__estus)  # AttributeError: 'Clerigo' object has no attribute '__estus'
