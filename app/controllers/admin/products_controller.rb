module Admin
  class ProductsController < ApplicationController
    before_action :set_store, only: [:index, :create, :new]
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = @store.products.all
    end

    def show
    end

    def new
      @product = @store.products.new
    end

    def edit
    end

    def create
      @product = @store.products.new(product_params)

      if @product.save
        redirect_to [:admin, @product], notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to [:admin, @product], notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_store_products_url(@product.store), notice: 'Product was successfully destroyed.'
    end

    private

    def set_store
      @store = Store.find(params[:store_id])
    end

    def set_product
      @product = @store ? @store.products.find(params[:id]) : Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :cost)
    end
  end
end
