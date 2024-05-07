class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find([params[:booking_id]])
  end

  def new
    @castle = Castle.find([params[:castle_id]])
    @booking = @castle.bookings.new
  end

  def create
    @booking = Booking.new(booking_params)
    @castle = Castle.find(params[:castle_id])
    @booking.castle = @castle
    if @booking.save
      redirect_to castle_path(@castle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:castle_id, :start_date, :end_date)
  end
end
