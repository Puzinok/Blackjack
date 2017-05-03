class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def get_points
    ranks = %i[k q j]
    if ranks.include?(rank)
      10
    elsif rank == :a
      [1, 11]
    else
      rank.to_i
    end
  end

  def ace?
    rank == :a
  end

  def to_s
    symbols = { diamonds: "\u2666",
                hearts: "\u2665",
                clubs: "\u2663",
                spades: "\u2660" }.freeze
    "|#{rank.to_s.capitalize}#{symbols[suit]}|"
  end
end
