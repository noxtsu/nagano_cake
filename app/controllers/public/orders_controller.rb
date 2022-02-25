class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:select_address] == "current_customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "registered_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @cart_items = CartItem.where(customer_id: current_customer)
    @order.shipping_cost = 800
    @total_product_price = @cart_items.sum{|cart_item|cart_item.subtotal}
    @order.total_payment = @order.shipping_cost + @total_product_price

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.price
      @order_detail.making_status = 0
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(customer_id: current_customer)

  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.where(id: params[:id])

  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name ,:shipping_cost, :total_payment, :status)
    end

end
