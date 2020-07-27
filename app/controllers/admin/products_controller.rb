module Admin
  class ProductsController < StoreController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = policy_scope(@store.products).ordered_by_position
      authorize @products
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
      redirect_to admin_store_products_path(@store), notice: 'Product was successfully destroyed.'
    end

    def reorder
      ids = products_params.fetch(:ids)
      @products = policy_scope(@store.products).where(id: ids)
      authorize @products

      @products.find_each do |product|
        position = ids.index(product.id)
        product.update_columns(position: position, updated_at: Time.current)
      end

      redirect_to admin_store_products_path(@store), notice: 'Successfully updated product positions'
    end

    private

    def set_product
      @product = policy_scope(@store.products).find(params[:id])
      authorize @product
    end

    def product_params
      params.require(:product).permit(:name, :description, :cost)
    end

    def products_params
      params.require(:products).permit(ids: [])
    end
  end
end
