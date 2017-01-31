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
    @cart_item = CartItem.where(cart: @cart, item: @item).first
    @price = session[:total_price]
    puts @price
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
    cart_item = CartItem.where(cart: cart, item: item).first
    total_price = 0
    if cart_item
      puts cart_item
      cart_item.quantity += 1
      cart_item.save
      session[:total_price] = (total_price + item.price) * cart_item.quantity
    else
      CartItem.create(cart: cart, item: item, quantity: 1)
    end
    redirect_to "/items/show_item/#{item.id}"
  end
end
