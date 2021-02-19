class BookingsController < ApplicationController
  before_action :find_equipment, only: [:new, :create]
  before_action :find_booking, only: [:accept, :deny]
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

  def accept
    render json: { status: false } and return unless @booking.status == "pending"

    authorize @booking
    @booking.status = "accepted"
    is_booking_saved = @booking.save
    render json: { status: is_booking_saved, type: "Accepted" }
  end

  def deny
    render json: { status: false } and return unless @booking.status == "pending"

    authorize @booking
    @booking.status = "denied"
    @booking.save
    is_booking_saved = @booking.save
    render json: { status: is_booking_saved, type: "Denied" }
  end

  private

  def find_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
