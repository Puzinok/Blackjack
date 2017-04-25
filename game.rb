require_relative 'player'
require_relative 'card'
require_relative 'deck'

class Game
  attr_accessor :user, :dealer, :deck, :bank

  def initialize(user, dealer = Dealer.new)
    @bank = 0
    @user = user
    @dealer = dealer
    @deck = Deck.new
  end

  def new_round
    @deck.shuffle!
    [user, dealer].each do |player|
      player.cards = []
      player.to_bet
      @bank += 10
      2.times { turn(player) }
    end
  end

  def turn(player)
    player.take_card(deck)
  end
end
