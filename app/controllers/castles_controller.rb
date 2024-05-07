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
    @castle = Castle.new(castle_params)
    if @castle.save
      redirect_to castles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @castle = Castle.find(params[:id])
    if @castle.user == current_user
      @castle.destroy
      redirect_to castles_path, notice: 'Castle was successfully destroyed.'
    else
      redirect_to castles_path, alert: 'You are not authorized to delete this castle.'
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:title, :description, :price, :location)
  end
end
