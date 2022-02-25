class Admin::HomesController < ApplicationController
  def top 
    @order_details = OrderDetail.all
    @orders = Order.where(id: params[:id])

  end
end
