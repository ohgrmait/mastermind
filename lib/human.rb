# frozen_string_literal: true

class Human < Player # rubocop:disable Style/Documentation
  COLORS = %w[Blue Orange Yellow Green Purple Red].freeze

  attr_accessor :guess_patterns

  def create_code
    puts ''
    print '...Please create the secret code for game: '
    code = gets.chomp
    raise StandardError unless code.length == 4 &&
                               @guess_patterns.include?(code)
  rescue StandardError
    puts ''
    puts '...Excuse me, please choose a valid color!'
      .colorize(color: :light_red, mode: :bold, background: :light_yellow)
    retry
  else
    code
  end

  def guess_code
    gets.chomp
  end

  def to_s
    'Human'
  end
end
