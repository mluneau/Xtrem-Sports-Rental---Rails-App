class BookingsController < ApplicationController
  before_action :find_equipment, only: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.equipment = @equipment
    if @booking.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def show
    authorize @booking
  end

  private

  def find_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
