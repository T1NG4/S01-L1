# Classe PhoneWave
class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail enviada: '#{mensagem}' para o passado!"
  end
end

# Classe MembroDoLab
class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

# Classe LaboratorioDeGadgets
class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Membro ##{membro.numero} #{membro.nome} admitido no laboratório!"
  end

  def experimento(mensagem)
    puts "=== Iniciando Experimento ==="
    puts
    puts "Membros presentes:"
    @membros.each do |membro|
      puts "  - Lab Mem ##{membro.numero}: #{membro.nome}"
    end
    puts
    @phonewave.enviar_dmail(mensagem)
  end
end

# Programa principal
puts "=== Future Gadget Laboratory ==="
puts

# Criar dois membros antes de criar o laboratório
okabe = MembroDoLab.new(1, "Okabe Rintaro")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

# Criar o laboratório
laboratorio = LaboratorioDeGadgets.new

# Admitir ambos os membros ao laboratório
laboratorio.admitir(okabe)
laboratorio.admitir(mayuri)

puts

# Chamar experimento com uma mensagem
laboratorio.experimento("O mundo das linhas do mundo que não possuo")

puts
puts "=== Fim do Experimento ==="

# Comentário explicando composição e agregação:
# COMPOSIÇÃO: PhoneWave é composta por LaboratorioDeGadgets. Se o laboratório for destruído,
# a PhoneWave também deixará de existir, pois ela foi criada dentro do laboratório e não existe fora dele.
#
# AGREGAÇÃO: MembroDoLab é agregada por LaboratorioDeGadgets. Os membros existem antes de entrar
# no laboratório e continuam existindo mesmo se o laboratório for destruído. Eles têm vida independente
# do laboratório (podem existir fora dele).
