#should matches (prev and next) be separate objects?
#make sure to reference team instances for prev_opponent and next_opponent

class EplTable::Team

  attr_accessor :name, :stadium, :location, :wins, :draws, :losses, :table_points,
  :ranking, :prev_opponent, :next_opponent

  @@all = []

  def self.test
    team = self.new("Chelsea", "Stamford Bridge", "London", "5", "3", "2", "18", "1", "Manchester City", "Burnley")
    puts <<-DOC.gsub(/^\s*/, "")
      #{team.name} - #{team.stadium} - #{team.location}
      No. #{team.ranking} in English Premier League
      #{team.wins} Wins, #{team.draws} Draws, #{team.losses} Losses - #{team.table_points} Points
      Previous Fixture: 2-3 Loss v. #{team.prev_opponent}
      Next Fixture: #{team.next_opponent} (2-1-4)
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
    @@all << self
  end

  #Class Methods

  def self.all
    @@all
  end

  def self.find_team_by_rank(ranking)
    Team.all.find do |team|
      ranking == team.ranking
    end
  end

  #Instance Methods


end
