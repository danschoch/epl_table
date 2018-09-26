How to build a CLI gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program

- a CLI for seeing the current EPL standings and providing a bit more of info about each team

user types epl-table

see current epl rankings

  1. Chelsea - 5 Wins, 3 Draws, 2 Losses - 18 pts
  2. Spurs - 4 Wins, 2 Draws, 3 Losses - 14 pts

user can type number ranking of a team to see additional info

Chelsea - Stamford Bridge, London
5 Wins, 3 Draws, 2 Losses - 18 pts
Previous Fixture : 2-3 Loss v. Manchester City
Next Fixture: Burnley (2-1-4)



Questions for Coaching session #1:
- OO structure: matches as objects? or leave until next project (get rid of scores for previous fixture)?
- Scrape epl table as a CSV table and interpret? or use css selectors as intended?
- Environment setup: new file and copy structure of labs or leave as is?
- How to set up console and pry
- Next Steps:
  - Decide where/what to scraper
  - if necessary, set up EplTable::Match class
  - create scraper class(es)

Notes for code review:
- CLI display_more_info method has redundant elsif statement for the while loop
- 
