#CLI controller

class EplTable::CLI
BASE_PATH = "https://www.premierleague.com/"

  def call
    make_teams
    #add_info
    puts "This is the current EPL table:"
    puts ""
    display_table
    display_more_info
    goodbye
  end

  def make_teams
    team_array = EplTable::Scraper.new.scrape_table
    EplTable::Team.create_from_collection(team_array)
  end

  def add_info(team)
    info = EplTable::Scraper.new.scrape_team_page(BASE_PATH + team.team_url)
    team.add_team_info(info)
  end


  def display_table
    EplTable::Team.all.each do |team|
      team.table_view
    end
  end

  def display_more_info
    input = nil
    puts ""
    puts "Enter a team's table ranking for more detailed information or type exit:"

    while input != "exit"
      input = gets.strip.downcase
      if input.to_i.between?(1,20)
        puts ""
        team = EplTable::Team.all[input.to_i-1]
        add_info(team) if team.prev_result == nil
        team_details(input)
        puts ""
        puts "Enter a team's table ranking for more detailed information, type 'table' to return to the table, or type exit:"
      elsif input == "table"
        puts ""
        display_table
        puts ""
        puts "Enter a team's table ranking for more detailed information or type exit:"
      elsif input != "exit"
        puts ""
        puts "Please enter a valid ranking, or type table or exit:"
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
