class EplTable::Scraper
  def scrape_teams
    doc = Nokogirl::HTML(open("https://www.premierleague.com/tables"))
    binding.pry
  end
end
