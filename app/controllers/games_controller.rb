class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Jogo criado.'
    else
      render action: 'new'
    end
  end

  def update
    return redirect_to @game, notice: 'Fim de jogo' if @game.lose? || @game.win?
    letter = params[:letter]
    if @game.guessed? letter
      redirect_to @game, notice: 'Você já tentou essa letra'
    else
      @game.guess(letter)
      redirect_to @game
    end
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:word)
  end
end
