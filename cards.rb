require_relative "card"

CARDS_FILE = "cards.txt"
WRITE_CARD_OPTION = 1
puts "Bem vindo ao Cards System!"
continuar = ""
while continuar != "N"
  puts ""
  puts "[1] escrever\n[2] Ver um card"
  puts "[3] Encontrar"

  puts "Entre com a opção:"

  opcao = gets.to_i
  if opcao == WRITE_CARD_OPTION
    print 'Portugues: '
    portugues = gets.chomp
    print 'Ingles: '
    ingles = gets.chomp

    card = Card.new(portugues, ingles)
    File.open(CARDS_FILE, "a") do |f|
      f.puts card.to_write
    end
    puts card
  elsif opcao == 2
    cards = Card.all
    unless cards.empty?
      puts cards.sample
    else
      "Nenhum card cadastrado!"
    end
  elsif opcao == 3
    print "Texto: "
    texto_procurar = gets.chomp
    cards = Card.where(texto_procurar)
    if cards.any?
      puts "Encontrado #{cards.size} card(s)"
      cards.each { |card| puts card }
    end
  else
    puts "Opção inválida!"
  end
  puts "Deseja continuar?"
  puts "[S] Sim"
  puts "[N] Não"
  continuar = gets.chomp.upcase
end

