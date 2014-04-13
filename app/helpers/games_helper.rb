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
      remote: true
  end
end
