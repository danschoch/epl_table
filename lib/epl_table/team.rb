#should matches (prev and next) be separate objects?
#make sure to reference team instances for prev_opponent and next_opponent

class EplTable::Team

  attr_accessor :name, :stadium, :wins, :draws, :losses, :table_points,
  :ranking, :prev_opponent, :next_opponent, :team_url

  @@all = []

  #def initialize (name, stadium, wins, draws, losses, table_points, ranking, prev_opponent, next_opponent)
    #@name = name
    #@stadium = stadium
    #@wins = wins
    #@draws = draws
    #@losses = losses
    #@table_points = table_points
    #@ranking = ranking
    #@prev_opponent = prev_opponent
    #@next_opponent = next_opponent
    #@@all << self
  #end

  def initialize (team_hash)
    team_hash.each {|k,v| send("#{k}=", v)}
    @@all << self
  end

  #Class Methods

  def self.all
    @@all
  end

  def self.find_team_by_rank(ranking)
    EplTable::Team.all.detect do |team|
      team.ranking == ranking
    end
  end

  def self.create_from_collection(collection)
    collection.each do |team|
      self.new(team)
    end
  end

  #Instance Methods
  def add_team_info(info_hash)
    info_hash.each {|k,v| send("#{k}=", v)}
  end

  def table_view
    puts "#{self.ranking}. #{self.name} - #{self.wins} Wins, #{self.draws} Draws, #{self.losses} Losses - #{self.table_points} points"
  end

  def details_view
    puts <<-DOC.gsub(/^\s*/, "")
      #{self.name} - #{self.stadium}
      No. #{self.ranking} in English Premier League
      #{self.wins} Wins, #{self.draws} Draws, #{self.losses} Losses - #{self.table_points} Points
      Previous Fixture: 2-3 Loss v. #{self.prev_opponent}
      Next Fixture: #{self.next_opponent} (2-1-4)
    DOC
  end

end
