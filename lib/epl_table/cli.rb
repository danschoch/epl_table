#CLI controller

class EplTable::CLI
BASE_PATH = "https://www.premierleague.com/"

  def call
    make_teams
    puts "This is the current EPL table:"
    puts ""
    display_table
    further_info
    goodbye
  end

  def make_teams
    team_array = EplTable::Scraper.new.scrape_table
    EplTable::Team.create_from_collection(team_array)
  end

  end

  def display_table
    EplTable::Team.all.each do |team|
      team.table_view
    end
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
    team = EplTable::Team.find_team_by_rank(ranking)
    team.details_view
  end

  def goodbye
    puts ""
    puts "Check back soon for updated rankings!"
  end

end
