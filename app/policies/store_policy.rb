class StorePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(id: @user.roles.select(:store_id))
      end
    end
  end
end
