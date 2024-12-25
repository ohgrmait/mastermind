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
    user_input
    play_game
  end

  def show_prompt
    puts '=> A game of Mastermind between two players: Human and Computer!'
    puts ''
    puts "=> You can guess the opponent's secret code within twelve turns."
    puts '   At each turn you get a feedback (or clues) that tells you how'
    puts '   good the guess was - whether it was exactly correct (red peg)'
    puts '   or just the exact color but in the wrong position (white peg).'
    puts ''
  end

  def user_input
    print '=> Do you want to (c)reate the code or (g)uess the code? '
    user_input = gets.chomp
    @game.assign_players(user_input)
    puts ''
  end

  def print_guess(guess)
    print "\t"
    guess.chars.each do |char|
      case char
      when 'B'
        print '🔵 '
      when 'O'
        print '🟠 '
      when 'Y'
        print '🟡 '
      when 'G'
        print '🟢 '
      when 'P'
        print '🟣 '
      when 'R'
        print '🔴 '
      end
    end
  end

  def print_feedback(feedback)
    print "\t"
    black = feedback[0]
    white = feedback[1]
    black.times do
      print '⚫️ '
    end
    white.times do
      print '⚪️ '
    end
    (4 - (black + white)).times { print '  ' }
  end

  def play_game
    code = @game.create_code
    puts "=> #{@game.code_maker} has created the secret code out of six colors."
    puts '=> colors - Blue, Orange, Yellow, Green, Pink, and Violet!'
    puts "=> e.g., 'GGGG' means ['Green', 'Green', 'Green', 'Green']."
    puts ''
    TURNS.times do |turn|
      print "=> [#{turn + 1}]: #{@game.code_breaker}, your guess #{code}? "
      guess = @game.guess_code
      feedback = @game.feedback(code, guess)
      puts ''
      print_guess(guess)
      print_feedback(feedback)
      puts "\tclues: #{feedback[0]} black and #{feedback[1]} white pegs"
      puts ''
    end
  end
end

mastermind = Mastermind.new
mastermind.start_game
