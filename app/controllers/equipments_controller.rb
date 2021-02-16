class EquipmentsController < ApplicationController
  before_action :find_equipment, only: [:edit, :show, :update, :destroy]

  def index
    @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
    @user = current_user
  end

  def create
    @equipment = Equipment.new(equipment_params)
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
  end

  def equipment_params
    params.require(:equipment)
          .permit([:title, :description, :address, :daily_price, :sport_category])
  end
end
