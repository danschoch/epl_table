#should matches (prev and next) be separate objects?
#make sure to reference team instances for prev_opponent and next_opponent

class EplTable::Team

  attr_accessor :name, :stadium, :wins, :draws, :losses, :table_points,
  :ranking, :prev_opponent, :next_opponent

  @@all = []



    #puts <<-DOC.gsub(/^\s*/, "")
#
    #  1. Chelsea - 5 Wins, 3 Draws, 2 Losses - 18 pts
    #  2. Spurs - 4 Wins, 2 Draws, 3 Losses - 14 pts
  #  DOC


  def self.team_test
    team = self.new("Chelsea", "Stamford Bridge", "5", "3", "2", "18", "1", "Manchester City", "Burnley")
    puts <<-DOC.gsub(/^\s*/, "")
      #{team.name} - #{team.stadium}
      No. #{team.ranking} in English Premier League
      #{team.wins} Wins, #{team.draws} Draws, #{team.losses} Losses - #{team.table_points} Points
      Previous Fixture: 2-3 Loss v. #{team.prev_opponent}
      Next Fixture: #{team.next_opponent} (2-1-4)
    DOC
  end

  def initialize (name, stadium, wins, draws, losses, table_points, ranking, prev_opponent, next_opponent)
    @name = name
    @stadium = stadium
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
  def table_view
    puts "#{self.ranking}. #{self.name} - #{self.wins} Wins, #{self.draws} Draws, #{self.losses} Losses - #{self.table_points} points"
  end

end

EplTable::Team.new("Chelsea", "Stamford Bridge", "5", "3", "2", "18", "1", "Manchester City", "Burnley")
EplTable::Team.new("Manchester City", "Etihad Stadium", "4", "2", "3", "14", "2", "Arsenal", "Watford")
