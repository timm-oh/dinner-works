class ProductPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def reorder?
    true
  end

  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(store: @user.stores)
      end
    end
  end
end
