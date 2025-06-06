class Api::V1::OrderItemsController < ApplicationController
  def index
    order_items = OrderItem.all
    render json: order_items
  end

  def show
    order_item = OrderItem.find(params[:id])
    render json: order_item
  end

  def create
    order_item = OrderItem.new(order_item_params)
    if order_item.save
      render json: order_item, status: :created
    else
      render json: order_item.errors, status: :unprocessable_entity
    end
  end

  def update
    order_item = OrderItem.find(params[:id])
    if order_item.update(order_item_params)
      render json: order_item
    else
      render json: order_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy
    head :no_content
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :quantity, :price)
  end
end
