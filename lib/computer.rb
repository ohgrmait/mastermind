class Computer
  COLORS = %w[Blue Orange Yellow Green Pink Violet].freeze

  def initialize
    # A total of 4 holes and 6 colors (6^4 = 1296 permutations)
    @patterns = COLORS.repeated_permutation(4).to_a
  end

  def create_code
    # Create code by choosing 1 pattern from 1296 permutations
    @patterns.sample.map { |elem| elem[0] }.join
  end
end

puts Computer.new.create_code
