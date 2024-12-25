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
    code = @game.create_code
    puts "The secret code is: #{code}"
    TURNS.times do |turn|
      print "turn: #{turn}, your guess: "
      guess = @game.guess_code
      puts "feedback: #{@game.feedback(code, guess)}"
    end
  end
end

mastermind = Mastermind.new
mastermind.start_game
