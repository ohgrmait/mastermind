# frozen_string_literal: true

require_relative 'game'
require_relative 'human'
require_relative 'computer'

class Mastermind # rubocop:disable Style/Documentation,Metrics/ClassLength
  TURNS = 12

  def initialize
    @game = Game.new
    @game_status = nil
  end

  def start_game
    show_prompt
    user_input
    play_game
    end_game
  end

  def show_prompt
    puts '...A game of Mastermind between two players: Human and Computer!'
    puts ''
    puts "...You can guess the opponent's secret code within twelve turns;"
    puts '   at each turn you get a feedback (or clues) that tells you how'
    puts '   good the guess was, whether it is exactly correct (black peg)'
    puts '   or it was the exact color but in the wrong space (white peg).'
    puts ''
    puts '...Color options - Blue, Orange, Yellow, Green, Purple, and Red!'
    puts "...Example code - 'GGGG', 'BGOY', 'GRPY', 'RRRR', 'PPOB', 'RRRR'"
    puts ''
  end

  def user_input
    print '...Do you wanna (c)reate or (g)uess the code? '
    choice = gets.chomp
    @game.assign(choice)
  end

  def print_guess(guess) # rubocop:disable Metrics/CyclomaticComplexity,Metrics/MethodLength
    print '     '
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
    print ' '
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

  def print_result(guess, feedback)
    puts ''
    print_guess(guess)
    print_feedback(feedback)
    puts "\t\t\t#{feedback[0]} black, #{feedback[1]} white"
  end

  def end_game
    puts ''
    if @game_status[0] == 4
      puts "...Congratulations #{@game.code_breaker}, you have won the game."
      puts "...You have successfully guessed the code: #{@game.code}."
    else
      puts "...#{@game.code_breaker}, you have exhausted all possible turns!"
      puts '...Game over! You were unable to figure the code.'
    end
  end

  def human_guess(turn)
    puts ''
    print "...#{turn + 1} Please enter your guess for the code: "
    @game.guess_code
  end

  def computer_guess(turn)
    puts ''
    guess = @game.guess_code
    print "...#{turn + 1} Computer has tried to make the guess #{guess}."
    puts ''
    guess
  end

  def play_game # rubocop:disable Metrics/MethodLength
    code = @game.create_code
    TURNS.times do |turn|
      @game.turn = turn
      if @game.code_breaker.instance_of? Human
        guess = human_guess(turn)
      elsif @game.code_breaker.instance_of? Computer
        guess = computer_guess(turn)
      end
      @game_status = @game.feedback(code, guess)
      print_result(guess, @game_status)
      break if @game_status[0] == 4
    end
  end
end
