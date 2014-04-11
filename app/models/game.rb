class Game < ActiveRecord::Base
  CHANCES = 7

  def stage
    (unique(letters) - unique(word)).size
  end

  def guess(letter)
    self.letters = self.letters + letter
    self.save
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

  def loose?
    stage >= CHANCES
  end

  def win?
    unique(word) == unique(letters)
  end

  def unique(str)
    str.upcase.split("").uniq.sort
  end
end
