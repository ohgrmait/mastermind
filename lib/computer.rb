require 'debug'

class Computer
  COLORS = %w[Blue Orange Yellow Green Purple Red].freeze

  attr_accessor :patterns

  def initialize(game)
    # A total of 4 holes and 6 colors (6^4 = 1296 permutations)
    @count = 0
    @game = game
    @patterns = COLORS.repeated_permutation(4).to_a
  end

  def create_code
    # Create code by choosing 1 pattern from 1296 permutations
    @patterns.sample.map { |elem| elem[0] }.join
  end

  def guess_code
    if @count.zero?
      guess = 'BBOO'
      @count += 1
    else
      # binding.break
      # p patterns.size
      patterns.select! do |pattern|
        @game.feedback(@game.code, @game.guess) ==
          @game.feedback(@game.guess, pattern.map { |elem| elem[0] }.join)
      end
      guess = patterns[0].map { |elem| elem[0] }.join
    end
    guess
  end

  def to_s
    'Computer'
  end
end
