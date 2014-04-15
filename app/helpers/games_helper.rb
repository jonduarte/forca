module GamesHelper
  def disabled?(game, letter)
    game.win? || game.guessed?(letter)
  end

  def button_letter(game, letter)
    button_to letter,
      game_path(game, letter: letter),
      method: :patch,
      disabled: disabled?(game, letter),
      form: { id: "form_#{letter}" },
      class: "button #{wrong_word_class(game, letter)}",
      remote: true
  end

  def wrong_word_class(game, letter)
    "wrong" unless game.unique(game.word).include? letter
  end
end
