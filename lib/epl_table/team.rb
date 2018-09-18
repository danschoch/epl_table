class EplTable::Team

  attr_accessor :name, :stadium, :location, :wins, :draws, :losses, :table_points,
  :ranking, :prev_opponent, :next_opponent

  def self.test
    puts <<-DOC.gsub(/^\s*/, "")
      Chelsea - Stamford Bridge, London
      No. 1 in English Premier League
      5 Wins, 3 Draws, 2 Losses - 18 pts
      Previous Fixture : 2-3 Loss v. Manchester City
      Next Fixture: Burnley (2-1-4)
    DOC
  end


end





#should matches (prev and next) be separate objects?
