class Player

  attr_accessor :name, :money, :cards, :points
  
  def initialize(name)
    @name = name
    @money = 100
    @cards = []
    @points = 0
  end

  def take_card(deck)
    raise "Больше брать нельзя!" if cards.size == 3
    card = deck.pull_out
    cards << card

    if card.ace? && points <= 10
      points += card.points.last
    elsif card.ace?
      points += card.points.first
    else
      points += card.points
    end
  end
end