class OrderPolicy < ApplicationPolicy
  # [...]

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def update_status?
    return true
  end

  class Scope < Scope
    def resolve
      scope1 = scope.all.where(user: user)
      scope2 = scope.joins(:rum).where(rums: {user_id: user})
      scope = scope1 + scope2
    end
  end
  #
end
