class ItemsController < ApplicationController
  def index
    @items = Item.all
    @Deal_of_Day = Item.last
    @categories = Category.all
    render 'index'
  end

  def show
  end

  def show_item
    @item = Item.find_by_id(params[:id])
    @categories = Category.all
  end
end
