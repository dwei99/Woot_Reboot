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
    @discussion = Discussion.find_by_item_id (@item.id)
    @cart = Cart.find_by_id(session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    render 'show_item'
  end

  def show_discussion
    @item = Item.find_by_id(params[:id])
    @discussions = Item.find(@item).discussions
    @categories = Category.all
    render 'show_discussion'
  end

  def create_post
    if !session[:id].present?
      flash[:notice] = "If you want to post a comment, please log in."
      return redirect_to "/items/discussion/#{item.id}"
    end
    user = User.find_by_id(session[:id])
    item = Item.find_by_id(params[:item_id])
    disscussion_post = Discussion.create(content:params[:content],item:item,user:user)
    if !disscussion_post.errors.blank?
      flash[:errors] = disscussion_post.errors.messages
      return redirect_to "/items/discussion/#{item.id}"
    end
    return redirect_to "/items/discussion/#{item.id}"
  end

  def checkout
    render 'checkout'
  end

  def add_to_cart
    cart = Cart.find(session[:cart_id])
    item = Item.find(params[:id])
    CartItem.create(cart: cart, item: item)
    id = item.id
    redirect_to "/items/show_item/#{item.id}"
  end


end
