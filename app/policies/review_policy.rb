class ReviewPolicy < ApplicationPolicy
  # [...]

  def create?
    record.rum.user != user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
  #
end
