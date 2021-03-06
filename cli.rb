module Cli
  def user_select
    puts "Select action:"
    puts "(T)ake card, (S)kip turn, (O)pen cards"
    choise = gets.chomp.downcase
    case choise
    when 't'
      take_card(user)
    when 's'
      skip_turn(user)
    when 'o'
      open_cards
    else
      puts 'Type error!'
    end 
  end

  def show_cards(player, visible = true)
    puts "#{player.name}'s cards:"
    puts '|*|' * player.cards.size if visible == false
    puts player.cards if visible == true
    puts '-' * 10
  end

  def start_new_round
    puts 'Do you want play again? (Y, N)'
    choise = gets.chomp.downcase
    if choise == 'y'
      play_round
    else
      exit
    end
  end

  def print_info(player, attr)
    puts "#{player.name}'s #{attr.to_s.capitalize}: #{player.send(attr)}"
  end

  def print_round_end(winner)
    if winner == "Draw!"
      puts winner
    else
      puts "#{winner.name} WIN!"
    end
    [user, dealer].each {|p| print_info(p, :points)}
    [user, dealer].each {|p| print_info(p, :money)}
  end
end