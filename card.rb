class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def points
    ranks = %i[k q j]
    if ranks.include?(rank)
      10
    elsif rank == :a
      [1, 11]
    else
      rank.to_i
    end
  end

  def to_s
    symbols = { diamonds: "\u2666",
                hearts: "\u2665",
                clubs: "\u2663",
                spades: "\u2660" }
    "|#{rank.to_s.capitalize}#{symbols[suit]}|"
  end
end
