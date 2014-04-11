class Game < ActiveRecord::Base
  def stage
    chances
  end

  def guessed?(letter)
    letters.include? letter
  end

  def guesses
    all = ('A'..'Z').to_a
    all - guessed
  end

  def guessed
    letters.split("")
  end
end
