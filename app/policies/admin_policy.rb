class AdminPolicy < Struct.new(:user, :admin)
  def root?
    user.admin? || user.stores.exists?
  end
end