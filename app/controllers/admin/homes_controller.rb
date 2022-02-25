class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @order = Order.where(id: params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])


  end
end
