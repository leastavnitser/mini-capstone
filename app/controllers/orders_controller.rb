class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render json: @order.as_json
  end

  def index
    @orders = Order.all
    render json: @orders.as_json
  end

product = Product.find_by(id: params["product_id"])

calc_subtotal= product.price * params["quantity"].to_i
calc_tax =  calc_subtotal / 10
calc_total = calc_subtotal + calc_tax

  def create
    @order = Order.create(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total,
    )
    if @order
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
