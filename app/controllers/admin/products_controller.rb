module Admin
  class ProductsController < ApplicationController
    before_action :set_store
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = @store.products.all
    end

    def show
    end

    def new
      @product = @store.products.new
      authorize @product
    end

    def edit
    end

    def create
      @product = @store.products.new(product_params)
      authorize @product

      if @product.save
        redirect_to [:admin, @store, @product], notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to [:admin, @store, @product], notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_store_products_url(@store), notice: 'Product was successfully destroyed.'
    end

    private

    def set_store
      @store = policy_scope(Store).find(params[:store_id])
    end

    def set_product
      @product = policy_scope(@store.products).find(params[:id])
      authorize @product
    end

    def product_params
      params.require(:product).permit(:name, :description, :cost)
    end
  end
end
