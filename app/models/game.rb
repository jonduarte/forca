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
    ('A'..'Z').to_a - guessed
  end

  def guessed
    normalize(letters)
  end

  def splitted_word
    normalize(word)
  end

  def lose?
    stage >= CHANCES
  end

  def win?
    unique(word) == unique(letters)
  end

  private
  def unique(str)
    normalize(str).uniq.sort
  end

  def normalize(str)
    str.upcase.split("")
  end
end
