class Card
  SEPARATOR = "|"
  CARDS_FILE = "cards.txt"

  attr_reader :frente, :verso

  def initialize(frente, verso)
    @frente = frente
    @verso = verso
  end

  def self.all
    raw_cards = File.readlines(CARDS_FILE)
    @all ||= raw_cards.collect do |raw_card|
      frente, verso = raw_card.split(SEPARATOR)
      Card.new(frente, verso)
    end
  end

  def include?(text)
    frente.include?(text) || verso.include?(text)
  end

  def self.where(text)
    all.select do |card|
      card.include? text
    end
  end

  def to_write
    "#{frente}| #{verso}"
  end

  def to_s
    "#{frente}, #{verso}"
  end
end
