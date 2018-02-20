class RumPolicy < ApplicationPolicy
  # [...]

  def show?
    return true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def new?
    return true
  end

  def create?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
  #
end
