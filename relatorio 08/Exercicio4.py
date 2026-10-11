from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):
    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:
    def __init__(self, modelo):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):
    def __init__(self, nome, modelo_cyberdeck):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(
            f"Netrunner {self.nome} com Cyberdeck {self.cyberdeck.modelo} "
            f"quebrando o gelo (ICE) de um servidor!"
        )


class DroneDeVigilancia(IUnidadeDeRede):
    def __init__(self, codigo):
        self.codigo = codigo

    def executar_invasao(self):
        print(
            f"Drone {self.codigo} interceptando sinais da rede corporativa!"
        )


class CelulaHacker:
    def __init__(self, nome, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros

    def iniciar_ataque(self):
        print(f"Celula {self.nome} iniciando ataque coordenado!")
        for unidade in self.membros:
            unidade.executar_invasao()


if __name__ == "__main__":
    netrunner = OperadorNetrunner("V", "Militech Paraline")
    drone = DroneDeVigilancia("DRN-2077")

    celula = CelulaHacker("Maelstrom", [netrunner, drone])
    celula.iniciar_ataque()

    # IUnidadeDeRede()  # TypeError: Can't instantiate abstract class IUnidadeDeRede
