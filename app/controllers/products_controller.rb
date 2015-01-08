class ProductsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]


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

    @reviews = @product.reviews.order('updated_at ASC')

    # @user = @reviews.email
  end

  private
  def product_param
    params.require(:product).permit(:product_name, :brand, :price, :found_at, :description)
  end

end
