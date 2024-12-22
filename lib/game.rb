class Game
  def initialize
    @code_maker = Computer.new
  end

  def create_code
    @code_maker.create_code
  end
end
