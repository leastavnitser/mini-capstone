class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render :show
  end

  def create
    @supplier = Supplier.create(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
    )
    if @supplier.valid?
      render :show
    else
      render json: { erros: @supplier.errors.full_messages },
             status: :unproccessable_entity
    end
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.update(
      name: params[:name] || @supplier.name,
      email: params[:email] || @supplier.price,
      phone_number: params[:phone_number] || @supplier.image_url,
    )
    if @supplier.valid? # happy path
      render :show
    else #sad path
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end
end
