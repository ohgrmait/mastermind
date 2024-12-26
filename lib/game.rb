class Game
  attr_reader :code_maker, :code_breaker, :guess, :code
  attr_accessor :turn

  def initialize
    @turn = 0
    @code = nil
    @guess = nil
    @matches = nil
    @code_maker = nil
    @code_breaker = nil
  end

  def guess_code
    @guess = @code_breaker.guess_code
  end

  def create_code
    @code = @code_maker.create_code
  end

  def feedback(code, guess)
    @matches = Array.new(4)
    black_pegs = black_pegs_count(code, guess)
    white_pegs = white_pegs_count(code, guess)
    [black_pegs, white_pegs]
  end

  def assign(user_input)
    if user_input == 'c'
      @code_maker = Human.new
      @code_breaker = Computer.new(self)
    elsif user_input == 'g'
      @code_maker = Computer.new(self)
      @code_breaker = Human.new
    end
  end

  def black_pegs_count(code, guess)
    black_pegs = 0
    guess.chars.each_with_index do |char, index|
      if char == code[index]
        black_pegs += 1
        @matches[index] = 'M'
      end
    end
    black_pegs
  end

  def white_pegs_count(code, guess)
    white_pegs = 0
    guess.chars.each_with_index do |guess_char, guess_index|
      code.chars.each_with_index do |code_char, code_index|
        next if guess[guess_index] == code[guess_index]
        next unless guess_char == code_char &&
                    guess_index != code_index &&
                    @matches[code_index] != 'M'

        white_pegs += 1
        @matches[code_index] = 'M'
        break
      end
    end
    white_pegs
  end
end
