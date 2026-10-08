using System;
using System.Collections.Generic;

/*
 * Composicao: o Grimorio e criado dentro da Maga e pertence a ela — se a maga deixar de existir,
 * o grimorio deixa de existir junto (parte integrante).
 * Agregacao: os Companheiros existem antes da Maga e sao apenas associados ao grupo;
 * continuam existindo independentemente da maga.
 */

class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine("Grimorio aberto. Feitico favorito: " + FeiticoFavorito);
    }
}

class Companheiro
{
    public string Nome { get; private set; }
    public string Funcao { get; private set; }

    public Companheiro(string nome, string funcao)
    {
        Nome = nome;
        Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine(Nome + " — " + Funcao);
    }
}

class Maga
{
    public string Nome { get; private set; }
    public Grimorio Grimorio { get; private set; }

    private List<Companheiro> companheiros = new List<Companheiro>();

    public Maga(string nome)
    {
        Nome = nome;
        Grimorio = new Grimorio();
    }

    public void Recrutar(Companheiro c)
    {
        companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine("Grupo de " + Nome + ":");
        foreach (Companheiro c in companheiros)
            c.Apresentar();
    }
}

class Program
{
    static void Main()
    {
        Companheiro fern = new Companheiro("Fern", "Aprendiz de maga");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        frieren.Grimorio.FeiticoFavorito = "Zoltraak";

        frieren.MostrarGrupo();
        Console.WriteLine();
        frieren.Grimorio.Abrir();
    }
}
