#equivalent of environment file
#refactor before submission w/ proper enviroment structure?

require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative "./epl_table/version"
require_relative './epl_table/cli'
require_relative './epl_table/team'
require_relative './epl_table/scraper'


#Test team instances - DELETE after getting scrapers to work
#EplTable::Team.new("Chelsea", "Stamford Bridge", "5", "3", "2", "18", "1", "Manchester City", "Burnley")
#EplTable::Team.new("Manchester City", "Etihad Stadium", "4", "2", "3", "14", "2", "Arsenal", "Watford")
