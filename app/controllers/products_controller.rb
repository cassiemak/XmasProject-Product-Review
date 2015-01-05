class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_param)

    if product.save 
      redirect_to products_path
    else
      flash[:message] = product.errors.messages
      redirect_to :back
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_param
    params.require(:product).permit(:product_name, :brand, :price, :found_at, :description)
  end

end
