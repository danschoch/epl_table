#CLI controller

class EplTable::CLI

  def call
    puts "This is the current EPL table:"
    puts ""
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
      puts ""
      puts "Enter a team's table ranking for more detailed information or type exit:"
      input = gets.strip.downcase
      if input.to_i.between?(1,20)
        puts ""
        team_details(input)
      elsif input != "exit"
        puts ""
        puts "Please enter a valid ranking or type exit:"
      end
    end
  end


  def team_details(ranking)
    EplTable::Team.team_test
    #team = Team.find_team_by_rank(ranking)
  end

  def goodbye
    puts ""
    puts "Check back soon for updated rankings!"
  end

end
