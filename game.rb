require_relative 'player'
require_relative 'card'
require_relative 'deck'
require_relative 'check'
require_relative 'cli'

class Game
  include Check
  include Cli

  attr_accessor :user, :dealer, :deck, :bank

  def initialize(user, dealer = Dealer.new)
    @user = user
    @dealer = dealer
    @bank = 0
  end

  def new_round
    print_info(user, :money)
    @deck = Deck.new
    @deck.shuffle!
    [user, dealer].each do |player|
      player.cards = []
      player.to_bet
      2.times { take_card(player) }
    end
    @bank = 20
  end

  def play_round
    new_round
    until round_end?
      user_turn
      dealer_turn
    end
    open_cards
  end

  def user_turn
    show_cards(dealer, false)
    show_cards(user)
    user_select
  end

  def dealer_turn
    if dealer.take_card?
      take_card(dealer)
    else
      skip_turn(dealer)
    end
  end

  def take_card(player)
    player.cards << deck.pull_out
  end
  
  def skip_turn(player)
    puts "#{player.name} pass the turn!"
  end

  def open_cards
    [self.user, self.dealer].each {|p| show_cards(p, true)}
    winner = check_winner
    take_bank(winner)
    print_round_end(winner)
    start_new_round
  end

  def take_bank(winner)
    if winner == "Draw!"
      user.money += @bank / 2
      dealer.money += @bank / 2
    else
      winner.money += @bank
    end
  end
end
