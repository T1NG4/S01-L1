# Classe CoquetelAfterlife
class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  # Getter manual para preco
  def preco
    @_preco
  end

  # Setter manual para preco com validação (5-200)
  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  # Método ficha que retorna string com nome e preço
  def ficha
    "Coquetel: #{@nome}, Preço: R$ #{@_preco}"
  end
end

# Classe filha DrinkDeLenda
class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  # Override do método ficha adicionando a lenda
  def ficha
    super + ", Lenda: #{@lenda}"
  end
end

# Programa principal
puts "=== Lista de Coquetéis ==="
puts

# Criar array com 1 CoquetelAfterlife e 2 DrinkDeLenda
drinks = [
  CoquetelAfterlife.new("Whiskey Sour", 45),
  DrinkDeLenda.new("Old Fashioned", 50, "O primeiro coquetel oficial da história"),
  DrinkDeLenda.new("Mojito", 35, "Hemingway tomava em Havana")
]

# Iterar e imprimir ficha de cada drink
drinks.each do |drink|
  puts drink.ficha
end

puts
puts "=== Teste de alteração de preço ==="
puts

# Testar setter com valor inválido (500) e depois válido (80)
puts "Tentando definir preço como 500:"
drinks[1].preco = 500
puts drinks[1].ficha
puts

puts "Definindo preço como 80:"
drinks[1].preco = 80
puts drinks[1].ficha
puts

# Tentar alterar o nome diretamente (vai gerar erro)
# drinks[1].nome = "Novo Nome"
