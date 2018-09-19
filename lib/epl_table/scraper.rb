require 'nokogiri'
require 'open-uri'

class EplTable::Scraper
  def scrape_table
    doc = Nokogiri::HTML(open("https://www.premierleague.com/tables"))
    table = doc.css('table').css('tbody.tableBodyContainer').css('tr')
    team_name = table.css('td.team').css('.long').first.text
    team_name
  end
end
