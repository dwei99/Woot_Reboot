class ItemsController < ApplicationController
  def index
    render 'index'
  end

  def show
  end

  def show_item
    @cart = Cart.find_by_id(session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @item = Item.first
    render 'show_item'
  end

  def checkout
    render 'checkout'
  end

  def add_to_cart
    cart = Cart.find(session[:cart_id])
    item = Item.find(params[:id])
    CartItem.create(cart: cart, item: item)
    redirect_to '/items/show_item/#{id}'
  end
end
