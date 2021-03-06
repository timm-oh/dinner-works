module Admin
  class StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update, :destroy]
    skip_after_action :verify_policy_scoped, only: [:create, :new]

    def index
      @stores = policy_scope(Store).all
      authorize @stores
    end

    def show
    end

    def new
      @store = Store.new
      authorize @store
    end

    def edit
    end

    def create
      @store = Store.new(store_params)
      authorize @store

      if @store.save
        redirect_to [:admin, @store], notice: 'Store was successfully created.'
      else
        render :new
      end
    end

    def update
      if @store.update(store_params)
        redirect_to [:admin, @store], notice: 'Store was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @store.destroy
      redirect_to admin_stores_url, notice: 'Store was successfully destroyed.'
    end

    private

    def set_store
      @store = policy_scope(Store).find(params[:id])
      authorize @store
    end

    def store_params
      params.require(:store).permit(:name, :location)
    end
  end
end
