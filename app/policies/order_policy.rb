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

  def accept?
    return true
  end

  def refuse?
    return true
  end

  def cancel?
    return true
  end

  def pay?
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
