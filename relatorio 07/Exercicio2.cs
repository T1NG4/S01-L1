using System;
using System.Collections.Generic;

class Pokemon
{
    public string Especie { get; private set; }
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        Especie = especie;
        Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine(Especie + " (Nv. " + Nivel + ") usa um ataque comum!");
    }
}

class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel) { }

    public override void Atacar()
    {
        Console.WriteLine(Especie + " (Nv. " + Nivel + ") usa Folha Navalha!");
    }
}

class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel) { }

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine(Especie + " (Nv. " + Nivel + ") libera uma descarga eletrica!");
    }
}

class Program
{
    static void Main()
    {
        List<Pokemon> time = new List<Pokemon>
        {
            new Pokemon("Snorlax", 28),
            new TipoPlanta("Bulbasaur", 22),
            new TipoEletrico("Pikachu", 25)
        };

        foreach (Pokemon pokemon in time)
            pokemon.Atacar();
    }
}
