#CLI controller

class EplTable::CLI

  def call
    puts "This is the current EPL table:"
    display_table
  end

  def display_table
    puts <<-DOC
      1. Chelsea - 5 Wins, 3 Draws, 2 Losses - 18 pts
      2. Spurs - 4 Wins, 2 Draws, 3 Losses - 14 pts
    DOC
  end

end
