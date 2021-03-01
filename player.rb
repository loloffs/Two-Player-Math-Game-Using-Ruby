class Player
  attr_accessor :name, :player_score
  def initialize(name)
    @name = name
    @player_score = 3
  end

  def update_score
    @player_score -= 1
    puts "P1 #{@player_score}/3 vs P2 #{@player_score}/3"
    if @player_score == 0
      puts "#{self.name} wins with a score of #{player_score}!"
    end
  end

end