class Api::V1::AddressesController < ApplicationController
  def index
    addresses = Address.all
    render json: addresses
  end

  def show
    address = Address.find(params[:id])
    render json: address
  end

  def create
    address = Address.new(address_params)
    if address.save
      render json: address, status: :created
    else
      render json: address.errors, status: :unprocessable_entity
    end
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      render json: address
    else
      render json: address.errors, status: :unprocessable_entity
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    head :no_content
  end

  private

  def address_params
    params.require(:address).permit(:user_id, :street, :city, :state, :zip, :country)
  end
end
