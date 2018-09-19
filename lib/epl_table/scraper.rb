require 'nokogiri'
require 'open-uri'

class EplTable::Scraper
  def scrape_table
    doc = Nokogiri::HTML(open("https://www.premierleague.com/tables"))
    table_row = doc.css('table').css('tbody.tableBodyContainer').css('tr[data-compseason="210"]')
    table_row.collect do |row|
      team_name = row.css('td')[2].css('.long').text
      team_ranking = row.css('td')[1].css('span.value').text
      team_wins = row.css('td')[4].text
      team_draws = row.css('td')[5].text
      team_losses = row.css('td')[6].text
      team_points = row.css('td')[10].text
      team_url = row.css('td.team').css("a[href]").first['href']
      team_hash ={name: team_name, wins: team_wins, draws: team_draws, losses: team_losses, table_points: team_points,
      ranking: team_ranking, team_url: team_url}
      team_hash
    end
  end

  def scrape_team_page(url)
    doc = Nokogiri::HTML(open(url))
    stadium_name = doc.css("div.stadiumName").css("a").css("span").text
    stadium_name
  end

end
