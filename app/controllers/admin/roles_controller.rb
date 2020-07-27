module Admin
  class RolesController < StoreController
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    def index
      @roles = policy_scope(@store.roles).all.includes(:user)
      authorize @roles
    end

    def show
    end

    def new
      @role = @store.roles.new
      authorize @role
    end

    # def edit
    # end

    def create
      authorize @store.roles
      @role = ::CreateRole.call(email: role_params[:email], invited_by: current_user, store: @store)

      if @role.errors.any?
        render :new
      else
        redirect_to [:admin, @store, @role], notice: 'Role was successfully created.'
      end
    end

    # TODO: this needs to update what the role can see, not anything else
    # def update
    #   if @role.update(role_params)
    #     redirect_to [:admin, @role], notice: 'Role was successfully updated.'
    #   else
    #     render :edit
    #   end
    # end

    def destroy
      @role.destroy
      redirect_to admin_store_roles_path(@store), notice: 'Role was successfully destroyed.'
    end

    private

    def set_role
      @role = policy_scope(@store.roles).find(params[:id])
      authorize @role
    end

    def role_params
      params.require(:role).permit(:email)
    end
  end
end
