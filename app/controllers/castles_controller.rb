class CastlesController < ApplicationController
  def index
    @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
  end

  def my_castles
    @castles = current_user.castles
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

  def edit
    @castle = Castle.find(params[:id])
  end

  def update
    @castle = Castle.find(params[:id])
    if @castle.update(booking_params)
      redirect_to @castle, notice: 'Updated Succesfully!'
    else
      render :edit
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:title, :description, :price, :location, :avatar)
  end
end
