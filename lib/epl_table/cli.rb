#CLI controller

class EplTable::CLI

  def call
    puts "This is the current EPL table:"
    display_table
    further_info
    goodbye
  end

  def display_table
    puts <<-DOC.gsub(/^\s*/, "")
      1. Chelsea - 5 Wins, 3 Draws, 2 Losses - 18 pts
      2. Spurs - 4 Wins, 2 Draws, 3 Losses - 14 pts
    DOC
  end

  def further_info
    input = nil
    while input != "exit"
      puts "Enter a team's table ranking for more detailed information or type exit."
      input = gets.strip.downcase
      team_details(input)
    end
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

  def goodbye
    puts "Check back soon for updated rankings!"
  end

end
