require_relative 'game'
require_relative 'human'
require_relative 'computer'

class Mastermind
  TURNS = 12

  def initialize
    @game = Game.new
  end

  def start_game
    show_prompt
    play_game
  end

  def show_prompt
    puts '=> A game of Mastermind between two players: Human and Computer!'
    puts ''
    puts "=> You can guess the opponent's secret code within twelve turns."
    puts '   At each turn you get a feedback (or clues) that tells you how'
    puts '   good the guess was - whether it was exactly correct (red peg)'
    puts '   or just the exact color but in the wrong position (white peg).'
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
