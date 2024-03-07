class ProductsController < ApplicationController
  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      description: params["description"],
    )
    render :show
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
      supplier: params["supplier"] || @product.supplier,
    )
    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Data successfully destroyed!" }
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def index
    @products = Product.all
    render :index
  end
end
