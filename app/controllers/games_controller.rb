class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  def machine
    @game = Game.machine!
    redirect_to @game, notice: 'Jogo criado'
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Jogo criado'
    else
      render action: 'new'
    end
  end

  def update
    letter = params[:letter].to_s

    if @game.ended?
      flash[:notice] = 'Fim de jogo'
    elsif @game.guessed? letter
      flash[:notice] = 'Você já tentou essa letra'
    else
      flash[:letter] = letter
      @game.guess(letter)
    end

    respond_to do |format|
      format.html { redirect_to @game }
      format.js   { render layout: false }
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
