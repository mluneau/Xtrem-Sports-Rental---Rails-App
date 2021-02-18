class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    return true
  end

  def show?
    record.user == user || record.equipment.user == user
  end
end
