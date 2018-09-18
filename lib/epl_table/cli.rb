#CLI controller

class EplTable::CLI

  def call
    puts "This is the current EPL table:"
    display_table
    further_info
    team_details
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
    Team.all.find do |team|
      input == team.ranking
    end
  end

end
