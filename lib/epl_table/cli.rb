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
    EplTable::Team.all.each do |team|
      team.table_view
    end
    #EplTable::Team.table_test
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
    #EplTable::Team.team_test
    team = EplTable::Team.find_team_by_rank(ranking)
    team.details_view
  end

  def goodbye
    puts ""
    puts "Check back soon for updated rankings!"
  end

end
