class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

  def index
    @orders = Order.all
    render :index
  end

  def create(
    user_id: params["user_id"],
    product_id: params["product_id"],
    quantity: params["quantity"],
    subtotal: params["subtotal"],
    tax: params["tax"],
    total: params["total"]
  )
    render :show
  end

  def update
    @orders = Order.find_by(id: params[:id])
    @product.update(
      user_id: params["user_id"] || @order.name,
      product_id: params["product_id"] || @order.product_id,
      quantity: params["quantity"] || @order.quantity,
      subtotal: params["subtotal"] || @order.subtotal,
      tax: params["tax"] || @order.tax,
      total: params["total"] || @order.total,
    )
    render :show
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    @order.destroy
    render json: { message: "Data successfully destroyed!" }
  end
end
