class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :categories]
  
  def home
  end

  def dashboard
    @equipments = policy_scope(Booking.where(user_id: current_user))
    @equipments = policy_scope(Equipment.where(user_id: current_user))
  end

  def categories
    @categories = ApplicationController::SPORT_CATEGORIES
  end
end
