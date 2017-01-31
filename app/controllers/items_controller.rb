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
    @cart = Cart.find_by_id(session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    render 'show_item'
  end

  def checkout
    render 'checkout'
  end

  def add_to_cart
    cart = Cart.find(session[:cart_id])
    item = Item.find(params[:id])
    CartItem.create(cart: cart, item: item)
<<<<<<< HEAD
=======
    id = item.id
>>>>>>> 11861de46a727581af46a7ccf62e3e8b080b3cfe
    redirect_to "/items/show_item/#{item.id}"
  end
end
