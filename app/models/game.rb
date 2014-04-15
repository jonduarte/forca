class Game < ActiveRecord::Base
  CHANCES = 7

  validates_presence_of :word
  validates_format_of :word, with: /\A[A-Za-z]+\z/

  before_validation :cleanup

  def stage
    (unique(letters) - unique(word)).size
  end

  def guess(letter)
    if letter.size > 1
      return if letter.size != word.size

      self.penalty = true unless unique(letter) & unique(word) == unique(word)
    end

    self.letters = self.letters + letter
    self.save
  end

  def guessed?(letter)
    letters.downcase.include? letter.downcase
  end

  def guesses
    ('A'..'Z').to_a
  end

  def guessed
    normalize(letters)
  end

  def splitted_word
    normalize(word)
  end

  def lose?
    stage >= CHANCES || penalty?
  end

  def win?
    game_not_ended = stage < CHANCES
    hit_all_letters = unique(letters) & unique(word) == unique(word)

    game_not_ended && hit_all_letters
  end

  def unique(str)
    normalize(str).uniq.sort
  end

  def normalize(str)
    str.upcase.split("")
  end

  def cleanup
    self.word = ActiveSupport::Inflector.transliterate(word)
  end
end
