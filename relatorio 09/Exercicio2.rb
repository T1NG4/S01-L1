# Classe base Instrumentista
class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Método interpretar deve ser implementado pela classe filha"
  end
end

# Classe filha Solista
class Solista < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) lidera a melodia principal em '#{peca}'"
  end
end

# Classe filha Acompanhador
class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) acompanha o ritmo do solista em '#{peca}'"
  end
end

# Classe Regente
class Regente
  attr_reader :nome

  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "=== Concerto conduzido por #{@nome} ==="
    puts "Peça: #{peca}"
    puts
    @orquestra.each do |instrumentista|
      instrumentista.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map do |instrumentista|
      "#{instrumentista.class}: #{instrumentista.nome}"
    end
  end
end

# Programa principal
puts "=== Sinfonia ==="
puts

# Criar Solista, Acompanhador e Regente
solista = Solista.new("Kousei Arima", "Piano")
acompanhador = Acompanhador.new("Kaori Miyazono", "Violino")
regente = Regente.new("Hiroko Seto")

# Convocar os dois instrumentistas
regente.convocar(solista)
regente.convocar(acompanhador)

# Chamar reger com uma peça
regente.reger("Chopin Ballade No. 1 in G Minor")

puts
puts "=== Escalação da Orquestra ==="
puts

# Imprimir cada texto do array retornado por escalacao
regente.escalacao.each do |texto|
  puts texto
end

puts
puts "=== Teste de Abstração ==="
puts

# Criar Instrumentista diretamente e chamar interpretar (vai gerar erro)
# instrumentista = Instrumentista.new("Teste", "Flauta")
# instrumentista.interpretar("Teste Piece")
