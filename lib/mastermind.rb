require_relative 'game'
require_relative 'computer'

class Mastermind
  TURNS = 12

  def initialize
    @game = Game.new
  end

  def start_game
    play_game
  end

  def play_game
    TURNS.times do |turn|
      puts "turn: #{turn}, secret code: #{@game.create_code}"
    end
  end
end

mastermind = Mastermind.new
mastermind.start_game
