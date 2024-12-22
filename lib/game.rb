class Game
  def initialize
    @code_breaker = Human.new
    @code_maker = Computer.new
  end

  def create_code
    @code_maker.create_code
  end

  def guess_code
    @code_breaker.guess_code
  end
end
