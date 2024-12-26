# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
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
end
