class EplTable::Team

  attr_accessor :name, :website, :wins, :draws, :losses, :table_points,
  :ranking, :team_url, :poss_next_opp, :poss_next_opp_2,
  :poss_prev_opp, :poss_prev_opp_2, :prev_result, :prev_score

  @@all = []


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
    info_hash.each do |k, v|
      if k.to_s.include?("poss_next_opp") && v == self.name
        info_hash.delete(k)
      end

      if k.to_s.include?("poss_prev_opp") && v == self.name
        info_hash.delete(k)
      end
    end
    info_hash.each {|k,v| send("#{k}=", v)}
  end

  def table_view
    if self.ranking.to_i.between?(1,9)
    puts "#{self.ranking}.  #{self.name} - #{self.wins} Won, #{self.draws} Drawn, #{self.losses} Lost - #{self.table_points} Points"
    else
    puts "#{self.ranking}. #{self.name} - #{self.wins} Won, #{self.draws} Drawn, #{self.losses} Lost - #{self.table_points} Points"
    end
  end

  def details_view
    puts <<-DOC.gsub(/^\s*/, "")
      #{self.name} - #{self.website}
      No. #{self.ranking} in English Premier League
      #{self.wins} Won, #{self.draws} Drawn, #{self.losses} Lost - #{self.table_points} Points
      Previous Fixture:  #{self.prev_score} #{self.prev_result} v. #{self.poss_prev_opp || self.poss_prev_opp_2}
      Next Fixture: #{self.poss_next_opp || self.poss_next_opp_2}
    DOC
  end

end
