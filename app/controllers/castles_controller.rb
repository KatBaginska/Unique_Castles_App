class CastlesController < ApplicationController
  def index
    @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
      @markers = [{
        lat: @castle.latitude,
        lng: @castle.longitude
      }]
  end

  def my_castles
    @castles = current_user.castles
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = Castle.new(castle_params)
    @castle.user = current_user
    if @castle.save
      redirect_to castle_path(@castle)
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
    if @castle.update(castle_params)
      redirect_to @castle, notice: 'Updated Succesfully!'
    else
      render :edit
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:title, :description, :price, :location, :photo)
  end
end
