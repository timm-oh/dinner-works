class AdminPolicy < Struct.new(:user, :admin)
  def root?
    user.admin? || user.roles.exists?
  end
end