class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @bookings = current_user.bookings.all
    if (@bookings.empty?)
      @message = "No actual bookings"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @castle = @booking.castle
    @booking.total_nights = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = @booking.total_nights * @castle.price
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

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      @booking.destroy
      redirect_to bookings_path, notice: 'Castle was successfully destroyed.'
    else
      redirect_to booking_path, alert: 'You are not authorized to delete this castle.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:castle_id, :start_date, :end_date)
  end
end
