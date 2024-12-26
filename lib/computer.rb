# frozen_string_literal: true

class Computer < Player # rubocop:disable Style/Documentation
  COLORS = %w[Blue Orange Yellow Green Purple Red].freeze

  attr_accessor :guess_patterns

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
