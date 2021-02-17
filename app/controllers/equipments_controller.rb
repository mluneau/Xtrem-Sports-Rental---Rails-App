class EquipmentsController < ApplicationController
  before_action :find_equipment, only: [:edit, :show, :update, :destroy]

  def index

    if params[:category]
      @equipments = policy_scope(Equipment.where(sport_category: params[:category]))
      @category = params[:category]
    else
      @category = "all"
      @equipments = policy_scope(Equipment)
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
          .permit([:title, :description, :address, :daily_price, :sport_category])
  end
end
