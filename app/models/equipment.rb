class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :daily_price, presence: true
  validates :sport_category, presence: true, inclusion: { in: ApplicationController::SPORT_CATEGORIES }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
