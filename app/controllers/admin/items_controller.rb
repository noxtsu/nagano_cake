class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
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
    @item = Item.find(params[:id])

  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :genre_id)
  end


end
