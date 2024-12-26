class Human
  def create_code
    print '=> Hey! Please enter your secret code: '
    gets.chomp
  end

  def guess_code
    gets.chomp
  end

  def to_s
    'Human'
  end
end
