class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    @items.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end
end
