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
    puts ''
    user_input
    puts ''
    # store_code
    play_game
    # end_game
  end

  def show_prompt
    puts '=> A game of Mastermind between two players: Human and Computer!'
    puts ''
    puts "=> You can guess the opponent's secret code within twelve turns;"
    puts '   at each turn you get a feedback (or clues) that tells you how'
    puts '   good the guess was, whether it is exactly correct (black peg)'
    puts '   or it was the exact color but in the wrong space (white peg).'
    puts ''
    puts '=> [Availability - Blue, Orange, Yellow, Green, Purple, and Red]'
  end

  def user_input
    print '=> Will you (c)reate or (g)uess the code? '
    choice = gets.chomp
    @game.assign(choice)
  end

  # def store_code
  #   @code = @game.create_code
  #   puts "=> The #{@game.code_maker} has created the secret code."
  #   puts "   [use]: 'GGGG' means all the green colors."
  #   puts ''
  # end

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

  def print_stats(guess, feedback)
    puts ''
    print_guess(guess)
    print_feedback(feedback)
    puts "\t   #{feedback[0]} black | #{feedback[1]} white"
    puts ''
  end

  # def end_game
  #   if @game.feedback[0] != 4
  #     puts "=> #{@game.code_breaker}, you have exhausted all the possible turns!"
  #     puts '=> Game over! You were unable to find out the code.'
  #   elsif @game.feedback[0] == 4
  #     puts "=> #{@game.code_breaker}, you have guessed the secret code - #{@game.code}."
  #     puts "=> Game over! Congratulations, you've won the game."
  #   end
  # end

  def play_game
    code = @game.create_code
    puts "=> The #{@game.code_maker} has created the secret code."
    puts "   [use]: 'GGGG' means all the green colors."
    puts ''
    feedback = 0
    TURNS.times do |turn|
      @game.turn = turn + 1
      if @game.code_breaker.instance_of? Human
        print "=> [#{turn + 1}]: #{@game.code_breaker}, please give your guess? "
        guess = @game.guess_code
      elsif @game.code_breaker.instance_of? Computer
        guess = @game.guess_code
        print "=> [#{turn + 1}]: #{@game.code_breaker}, please give your guess? #{guess}"
        puts ''
      end
      feedback = @game.feedback(code, guess)
      print_stats(guess, feedback)
      break if feedback[0] == 4
    end
    if feedback[0] != 4
      puts "=> #{@game.code_breaker}, you have exhausted all the possible turns!"
      puts '=> Game over! You were unable to find out the code.'
    elsif feedback[0] == 4
      puts "=> #{@game.code_breaker}, you have guessed the secret code - #{@game.code}."
      puts "=> Game over! Congratulations, you've won the game."
    end
  end
end

mastermind = Mastermind.new
mastermind.start_game
