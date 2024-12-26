# frozen_string_literal: true

class Computer # rubocop:disable Style/Documentation
  COLORS = %w[Blue Orange Yellow Green Purple Red].freeze

  attr_accessor :guess_patterns

  def initialize(game)
    # A total of 4 holes and 6 colors (6^4 = 1296 permutations)
    @game = game
    @patterns = COLORS.repeated_permutation(4).to_a
    @guess_patterns = @patterns.map do |pattern|
      pattern.map { |color| color[0] }.join
    end
  end

  def create_code
    # Create code by choosing 1 pattern from 1296 permutations
    @patterns.sample.map { |elem| elem[0] }.join
  end

  def guess_code
    return 'BBOO' if @game.turn.zero?

    guess_patterns.select! do |guess_pattern|
      @game.feedback(@game.code, @game.guess) ==
        @game.feedback(@game.guess, guess_pattern)
    end
    guess_patterns[0]
  end

  def to_s
    'Computer'
  end
end
