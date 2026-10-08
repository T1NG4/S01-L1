using System;

class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        Nome = nome;
        Povo = povo;
        Posto = posto;
    }

    public void Equipar(string arma)
    {
        Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine("Nome: " + Nome);
        Console.WriteLine("Povo: " + Povo);
        Console.WriteLine("Posto: " + Posto);
        if (Armamento != "Desarmado")
            Console.WriteLine("Armamento: " + Armamento);
        Console.WriteLine();
    }
}

class Program
{
    static void Main()
    {
        CombatenteDeGondor boromir = new CombatenteDeGondor("Boromir", "Dúnedain de Gondor", "Capitão da Guarda Branca");
        CombatenteDeGondor faramir = new CombatenteDeGondor("Faramir", "Dúnedain de Gondor", "Capitão de Ithilien");
        CombatenteDeGondor peregrin = new CombatenteDeGondor("Peregrin Took", "Hobbits", "Guarda de Minas Tirith");

        boromir.Equipar("Espada longa");
        faramir.Equipar("Arco de Ithilien");

        boromir.ApresentarUnidade();
        faramir.ApresentarUnidade();
        peregrin.ApresentarUnidade();

        // boromir.Posto = "Seneschal"; // CS0272: a propriedade só possui set privado
    }
}
