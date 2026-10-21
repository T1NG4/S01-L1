# Módulo Depoente (contrato)
module Depoente
  def depor
    raise NotImplementedError, "Método depor deve ser implementado pela classe"
  end
end

# Módulo Detetive (implementação pronta)
module Detetive
  def ser_detido
    puts "#{@nome} foi levado pela Scotland Yard!"
  end
end

# Classe base Envolvido
class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

# Classe TestemunhaOcular
class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "Testemunha #{@nome}: 'Eu vi um homem correndo para o norte por volta das 22h.'"
  end
end

# Classe SuspeitoDoCrime
class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detetive

  def depor
    puts "Suspeito #{@nome}: 'Eu estava em casa todo o dia, tenho álibi!'"
  end
end

# Classe Investigacao
class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "=== Investigação: #{@caso} ==="
    puts
    puts "Depoimentos:"
    @envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  def acionar_scotland_yard
    puts
    puts "=== Ação da Scotland Yard ==="
    puts

    detidos = @envolvidos.select { |envolvido| envolvido.respond_to?(:ser_detido) }
    detidos.each { |detido| detido.ser_detido }
  end
end

# Programa principal
puts "=== Caso: O Mistério de Baker Street ==="
puts

# Criar uma TestemunhaOcular e dois SuspeitoDoCrime
testemunha = TestemunhaOcular.new("Mrs. Hudson")
suspeito1 = SuspeitoDoCrime.new("James Moriarty")
suspeito2 = SuspeitoDoCrime.new("Sebastian Moran")

# Criar Investigacao com um caso escolhido
investigacao = Investigacao.new("Assassinato no Museu Britânico")

# Registrar as três instâncias criadas
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

# Chamar ouvir_todos
investigacao.ouvir_todos

# Chamar acionar_scotland_yard
investigacao.acionar_scotland_yard
