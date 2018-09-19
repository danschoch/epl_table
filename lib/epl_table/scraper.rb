require 'nokogiri'
require 'open-uri'

class EplTable::Scraper
  def scrape_table
    doc = Nokogiri::HTML(open("https://www.premierleague.com/tables"))
    table_row = doc.css('table').css('tbody.tableBodyContainer').css('tr[data-compseason="210"]')
    table_row.map do |row|
      team_name = table_row.css('td.team').css('.long').first.text
      team_wins = table_row.css('td')[4].text
      team_draws = table_row.css('td')[5].text
      team_losses = table_row.css('td')[6].text
      team_points = table_row.css('td')[10].text
      team_url = table_row.css('td.team').css("a[href]").first['href']
      team_hash =
      team_hash
    end

    team_url
  end
end
