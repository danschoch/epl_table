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

  def initialize (name, stadium, location, wins, draws, losses, table_points, ranking, prev_opponent, next_opponent)
    @name = name
    @stadium = stadium
    @location = location
    @wins = wins
    @draws = draws
    @losses = losses
    @table_points = table_points
    @ranking = ranking
    @prev_opponent = prev_opponent
    @next_opponent = next_opponent
  end

  #Class Methods

  def self.find_team_by_rank(ranking)
    Team.all.find do |team|
      ranking == team.ranking
    end
  end

  #Instance Methods


end





#should matches (prev and next) be separate objects?
