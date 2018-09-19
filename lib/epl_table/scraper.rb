require 'nokogiri'
require 'open-uri'

class EplTable::Scraper
  def scrape_table
    doc = Nokogiri::HTML(open("https://www.premierleague.com/tables"))
    table_row = doc.css('table').css('tbody.tableBodyContainer').css('tr[data-compseason="210"]')
    team_name = table_row.css('td.team').css('.long').first.text

    team_name
  end
end
