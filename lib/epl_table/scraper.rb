require 'nokogiri'
require 'open-uri'

class EplTable::Scraper
  def scrape_table
    doc = Nokogiri::HTML(open("https://www.premierleague.com/tables"))
  end
end
