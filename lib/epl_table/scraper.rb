

class EplTable::Scraper
  def scrape_table
    puts "*************Scraping Teams********"
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
    team_info_hash = {}
      puts "*************Scraping Team********"
    doc = Nokogiri::HTML(open(url))

    next_fixture = doc.css("#mainContent > div.wrapper.hasFixedSidebar > nav > div:nth-child(3) > a:nth-child(3)")
    team_one_fix = next_fixture.css(".teamName")[0].css('abbr').first['title']
    team_two_fix = next_fixture.css(".teamName")[1].css('abbr').first['title']

    prev_result = doc.css("#mainContent > div.wrapper.hasFixedSidebar > nav > div:nth-child(4) > a:nth-child(3)")
    team_one_res = prev_result.css(".teamName")[0].css('abbr').first['title']
    team_two_res = prev_result.css(".teamName")[1].css('abbr').first['title']
    result = prev_result.css(".teamForm").text.upcase
    score = prev_result.css(".score").inner_html.gsub("<span>","").gsub("</span>","")

    team_website = doc.css("#mainContent > header > div.wrapper > div > div > div.clubDetails > div.website > a").text

    team_info_hash = {poss_next_opp: team_one_fix, poss_next_opp_2: team_two_fix, poss_prev_opp: team_one_res, poss_prev_opp_2: team_two_res,
    prev_result: result, prev_score: score, website: team_website}
    team_info_hash
  end

end
