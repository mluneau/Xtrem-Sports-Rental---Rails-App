class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :categories]
  def home
  end

  def categories
    @categories = ApplicationController::SPORT_CATEGORIES
  end
end
