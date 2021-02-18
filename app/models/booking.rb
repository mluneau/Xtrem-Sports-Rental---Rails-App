class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :end_of_start_date_not_in_the_past

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end

  def end_of_start_date_not_in_the_past
    return if end_date.blank? || start_date.blank?

    errors.add(:start_date, "cannot be in the past") if start_date < Date.today
  end
end
