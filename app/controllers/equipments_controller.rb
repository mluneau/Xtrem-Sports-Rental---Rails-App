class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_equipment, only: [:edit, :show, :update, :destroy]

  def index
    if params[:category]
      @equipments = policy_scope(Equipment.where(sport_category: params[:category]))
      @category = params[:category]
    else
      @category = "all"
      @equipments = policy_scope(Equipment)
    end
    @markers = @equipments.geocoded.map do |equipment|
      {
        lat: equipment.latitude,
        lng: equipment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { equipment: equipment }),
        image_url: helpers.asset_url('logo.png')
      }
    end
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    authorize @equipment
    @equipment.user = current_user
    if @equipment.save
      redirect_to equipments_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    authorize @equipment
  end

  def update
  end

  def destroy
    @equipment.destroy
    redirect_to equipments_path
  end

  private

  def find_equipment
    @equipment = Equipment.find(params[:id])
    authorize @equipment
  end

  def equipment_params
    params.require(:equipment)
          .permit([:title, :description, :address, :daily_price, :sport_category, :photo])
  end
end
