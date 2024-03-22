class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def subtotal
    Product.find_by(id: params[:price]) * quantity
  end

  def
end
