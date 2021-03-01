require './player'

class Game_Master

  attr_accessor :player_1, :player_2

  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
  end
  
  def toggle_player
    @current_player.name == "Player 1" ? @current_player = @player_2 : @current_player = @player_1
  end

  def start_game
    while @player_1.player_score > 0 && @player_2.player_score > 0 do
      num_1 = rand(1..20)
      num_2 = rand(1..20)
      answer = num_1 + num_2
      puts "#{@current_player.name}: What does #{num_1} plus #{num_2} equal?"
      response = gets.chomp.to_i

      if response == answer
        puts "YES! You are correct!"
        puts "P1 #{@player_1.player_score}/3 vs. P2 #{@player_2.player_score}/3"
      else
        puts "WRONG!"
        @current_player.player_score -= 1
        puts "P1 #{@player_1.player_score}/3 vs. P2 #{@player_2.player_score}/3"
      end

      puts "--- NEW TURN ---"
      toggle_player
    end
    puts "#{@current_player.name} wins with a score of #{@current_player.player_score}"
    puts "--- GAME OVER ---"
    puts "Good bye!"
  end
end
