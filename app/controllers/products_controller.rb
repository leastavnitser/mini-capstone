class ProductsController < ApplicationController
  def shop
    products = Products.all
    render json: {
             id: product.id,
             name: product.name,
             price: product.price,
             image_url: product.image_url,
             description: product.description,
           }
  end

  def one_product
    @product = Product.find_by(id: params[id])
    render :show
  end

  def all_products
    @product = Product.all
    render :index
  end
end
