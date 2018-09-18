#CLI controller

class EplTable::CLI

  def call
    puts "This is the current EPL table:"
    display_table
    further_info
  end

  def display_table
    puts <<-DOC.gsub(/^\s*/, "")
      1. Chelsea - 5 Wins, 3 Draws, 2 Losses - 18 pts
      2. Spurs - 4 Wins, 2 Draws, 3 Losses - 14 pts
    DOC
  end

  def further_info
    puts "Enter a team's table ranking for more detailed information"
    input = gets.strip
    team_details(input)
  end

  def find_team_by_rank(ranking)
    Team.all.find do |team|
      ranking == team.ranking
    end
  end

  def team_details(ranking)
    EplTable::Team.test
    #team = find_team_by_rank(ranking)

  end

end
