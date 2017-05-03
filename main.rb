require_relative 'game'
require_relative 'player'
require_relative 'dealer'
require_relative 'user'
require_relative 'card'
require_relative 'deck'
require_relative 'check'
require_relative 'cli'

puts 'Input username:'
username = gets.chomp
user = User.new(username)
dealer = Dealer.new
game = Game.new(user, dealer)

game.play_round
