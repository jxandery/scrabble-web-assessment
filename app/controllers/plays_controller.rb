class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.create(play_params)
    if @play.save
      redirect_to plays_path
    else
      flash.now[:errors] = @play.errors.full_messages
      render :new
    end
  end

  def destroy
    Play.find_by(params[:id]).destroy
    require "pry"; binding.pry
    redirect_to plays_path
  end

  private

  def play_params
    params.require(:play).permit(:word)
  end
end
