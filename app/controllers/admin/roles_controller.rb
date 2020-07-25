module Admin
  class RolesController < ApplicationController
    before_action :set_store
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    def index
      @roles = policy_scope(Role).all.includes(:user)
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
      @role = @store.roles.new(role_params.merge(invited_by: current_user))
      authorize @role

      if @role.save
        redirect_to [:admin, @store, @role], notice: 'Role was successfully created.'
      else
        render :new
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

    def set_store
      @store = policy_scope(Store).find(params[:store_id])
    end

    def set_role
      @role = policy_scope(@store.roles).find(params[:id])
      authorize @role
    end

    def role_params
      params.require(:role).permit(:email)
    end
  end
end
