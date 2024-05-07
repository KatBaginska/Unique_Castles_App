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
end
