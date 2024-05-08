class CastlesController < ApplicationController
  def index
    @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = current_user.castles.new(castle_params)
    if @castle.save
      redirect_to castles_path
    else
      puts @castle.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:title, :description, :price, :location, :avatar)
  end
end
