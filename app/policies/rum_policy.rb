class RumPolicy < ApplicationPolicy
  # [...]

  def index?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
