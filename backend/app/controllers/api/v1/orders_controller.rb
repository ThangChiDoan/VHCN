class Api::V1::OrdersController < ApplicationController
  def index
    @orders = Order.all
    render :index
  end

  def show
    @order = Order.find(params[:id])
    render :show
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render :show, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      render :show
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    head :no_content
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :total, :status)
  end
end
