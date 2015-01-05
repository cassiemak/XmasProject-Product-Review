class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show
    @products = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

end
