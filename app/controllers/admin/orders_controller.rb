class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = Order.where(id: params[:id])
    @customer = @order.customer
  end

  def update
  end
end
