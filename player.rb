class Player
  attr_accessor :name, :money, :cards

  def initialize(name)
    @name = name
    @money = 100
    @cards = []
  end

  def take_card(deck)
    cards << deck.pull_out
  end

  def points
    points = 0
    cards.each do |card|
      points += if card.ace? && points <= 10
                  card.points.last
                elsif card.ace?
                  card.points.first
                else
                  card.points
      end
    end
  end

  def to_bet
    @money -= 10
  end
end
