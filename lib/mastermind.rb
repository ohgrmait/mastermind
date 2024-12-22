require_relative 'game'
require_relative 'human'
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
    secret_code = @game.create_code
    puts "The secret code is: #{secret_code}"
    TURNS.times do |turn|
      print "turn: #{turn}, your guess: "
      @game.guess_code
    end
  end
end

mastermind = Mastermind.new
mastermind.start_game
