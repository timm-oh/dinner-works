class RolePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def update?
    false
  end

  def destroy?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(store: @user.roles.select(:store_id))
      end
    end
  end
end
