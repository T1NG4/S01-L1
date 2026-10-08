using System;
using System.Collections.Generic;

class EntidadeCosmica
{
    public string Nome { get; protected set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        Nome = nome;
    }

    public virtual void Manifestar()
    {
        Console.WriteLine(Nome + " se manifesta nas sombras...");
        if (Origem != "Desconhecida")
            Console.WriteLine("Origem: " + Origem);
    }
}

class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome) { }

    public override void Manifestar()
    {
        Console.WriteLine(Nome + " emerge das profundezas do oceano!");
    }
}

class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome) { }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine(Nome + " desce dos confins de Yuggoth com organos de fungoides!");
    }
}

class Pesquisador
{
    public string Nome { get; private set; }

    private List<EntidadeCosmica> catalogo = new List<EntidadeCosmica>();

    public Pesquisador(string nome)
    {
        Nome = nome;
    }

    public void Catalogar(EntidadeCosmica e)
    {
        catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine("Catalogo de " + Nome + " — Biblioteca Miskatonic:");
        foreach (EntidadeCosmica entidade in catalogo)
        {
            entidade.Manifestar();
            Console.WriteLine();
        }
    }
}

class Program
{
    static void Main()
    {
        Profundo dagon = new Profundo("Dagon");
        dagon.Origem = "Reino submarino de Y'ha-nthlei";

        MiGo emissario = new MiGo("Emissario de Yuggoth");
        emissario.Origem = "Planeta Yuggoth";

        Pesquisador armitage = new Pesquisador("Dr. Henry Armitage");

        armitage.Catalogar(dagon);
        armitage.Catalogar(emissario);

        armitage.LerCatalogo();
    }
}
