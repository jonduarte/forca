class Game < ActiveRecord::Base
  def stage
    chances
  end

  def guessed?(letter)
    letters.downcase.include? letter.downcase
  end

  def guesses
    all = ('A'..'Z').to_a
    all - guessed
  end

  def guessed
    letters.upcase.split("")
  end

  def splitted_word
    word.upcase.split("")
  end
end
