class Api::V1::OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.all
    render :index
  end

  def show
    @order_item = OrderItem.find(params[:id])
    render :show
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      render :show, status: :created
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      render :show
    else
      render json: @order_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    head :no_content
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :quantity, :price)
  end
end
