class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.new(castle: @castle)
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    @castle = Castle.find(params[:castle_id])
    @booking.castle = @castle

    if @booking.save
      redirect_to castle_path(@castle)
    else
      puts @booking.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Updated Succesfully!'
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:castle_id, :start_date, :end_date)
  end
end
