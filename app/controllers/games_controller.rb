class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :guess]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def guess
    return redirect_to @game, notice: 'You loose this game' if @game.loose?
    letter = params[:letter]
    if @game.guessed? letter
      redirect_to @game, notice: 'Letter already guessed'
    else
      @game.guess(letter)
      redirect_to @game
    end
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @game.destroy
    redirect_to games_url
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:chances, :word)
  end
end