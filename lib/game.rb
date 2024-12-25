class Game
  def initialize
    @matches = nil
    @code_breaker = Human.new
    @code_maker = Computer.new
  end

  def guess_code
    @code_breaker.guess_code
  end

  def create_code
    @code_maker.create_code
  end

  def red_pegs_count(code, guess)
    red_pegs = 0
    guess.chars.each_with_index do |char, index|
      if char == code[index]
        red_pegs += 1
        @matches[index] = 'M'
      end
    end
    red_pegs
  end

  def white_pegs_count(code, guess)
    white_pegs = 0
    guess.chars.each_with_index do |guess_char, guess_index|
      code.chars.each_with_index do |code_char, code_index|
        next unless guess_char == code_char &&
                    guess_index != code_index &&
                    @matches[code_index] != 'M'

        white_pegs += 1
        @matches[code_index] = 'M'
      end
    end
    white_pegs
  end

  def feedback(code, guess)
    @matches = Array.new(4)
    red_pegs = red_pegs_count(code, guess)
    white_pegs = white_pegs_count(code, guess)
    "red pegs: #{red_pegs}, white pegs: #{white_pegs}"
  end
end
