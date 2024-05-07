class CastlesController < ApplicationController
  def index
    @castle.all
  end

  def new
    @castle = Castle.new
  end

  def create
  end
end
