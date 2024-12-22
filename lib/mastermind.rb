require_relative 'game'
require_relative 'computer'

class Mastermind
  def initialize
    @game = Game.new
  end

  def start_game
    play_game
  end

  def play_game
    puts "secret code: #{@game.create_code}"
  end
end

mastermind = Mastermind.new
mastermind.start_game
