# frozen_string_literal: true

class Human # rubocop:disable Style/Documentation
  def initialize(game)
    @game = game
  end

  def create_code
    puts ''
    print '...Please create the secret code for game: '
    gets.chomp
  end

  def guess_code
    gets.chomp
  end

  def to_s
    'Human'
  end
end
