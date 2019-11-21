class UserPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? || user.stylist?
  end

  def destroy?
    false
  end
end
