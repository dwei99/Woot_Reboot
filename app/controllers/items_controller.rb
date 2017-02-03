class ItemsController < ApplicationController
  def index
    @items = Item.all
    @Deal_of_Day = Item.offset(rand(Item.count)).first
    @categories = Category.all
    @cart = Cart.find_by_id(session[:cart_id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    render 'index'
  end

  def add_item
    @categories = Category.all

  end

  def create_item
    category = Category.find(params[:category])
    item = Item.create(name:params[:name], description: params[:description],img_url: params[:img_url], price: params[:price],quantity: params[:quantity],category:category)
    if !item.errors.blank?
      flash[:errors] = item.errors.messages
      return redirect_to "/items/add_item"
    end
    if item
      flash[:notice] = "Item Successful Created"
      return redirect_to "/add_item"
    end
  end

  def show_item
    @item = Item.find_by_id(params[:id])
    @reviews = Review.find_by_item_id(@item)
    puts "Reviews", @reviews
    @categories = Category.all
    @discussion = Discussion.find_by_item_id (@item.id)
    @cart_item = CartItem.where(cart: @cart, item: @item).first
    @cart = Cart.find_by_id(session[:cart_id])
    @price = session[:total_price]
    puts @price
    if @cart.nil?
      @cart = Cart.create(id: session[:cart_id])
      session[:cart_id] = @cart.id
      puts '****'
      puts @cart.id
      puts '****'
    end
    render 'show_item'
  end

  def show_category
    @item = Item.find_by_id(params[:id])
    @category = Category.find(params[:id])
    @categories = Category.all
    @cart = Cart.find_by_id(session[:cart_id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def create_review
    if !session[:user_id].present?
      flash[:notice] = "If you want to post a review, please log in."
      return redirect_to "/items/show_item/#{params[:item_id]}"
    end
    user = User.find(session[:user_id])
    item = Item.find(params[:item_id])
    item_review = Review.create(content:params[:review],rating:params[:rating],item:item,user:user)
    if !item_review.errors.blank?
      flash[:errors] = item_review.errors.messages
      return redirect_to "/items/show_item/#{item.id}"
    end
    return redirect_to "/items/show_item/#{item.id}"
  end

  def show_discussion
    @item = Item.find_by_id(params[:id])
    @discussions = Item.find(@item).discussions
    @categories = Category.all
    render 'show_discussion'
  end

  def create_post
    if !session[:user_id].present?
      flash[:notice] = "If you want to post a comment, please log in."
      return redirect_to "/items/discussion/#{params[:item_id]}"
    end
    user = User.find_by_id(session[:user_id])
    item = Item.find_by_id(params[:item_id])
    disscussion_post = Discussion.create(content:params[:content],item:item,user:user)
    if !disscussion_post.errors.blank?
      flash[:errors] = disscussion_post.errors.messages
      return redirect_to "/items/discussion/#{item.id}"
    end
    return redirect_to "/items/discussion/#{item.id}"
  end

  def checkout
    @sum = 0
    @item = Item.find_by_id(params[:id])
    @cart = Cart.find_by_id(session[:cart_id])
    @cart_items = CartItem.where(cart: @cart)
    @cart_items.each do |c|
      total = (c.item.price * c.quantity)
      @sum += total
    end
    return @sum
    render 'checkout'
  end

  def add_to_cart
    cart = Cart.find(session[:cart_id])
    item = Item.find(params[:id])
    cart_item = CartItem.where(cart: cart, item: item).first
    if cart_item
      cart_item.quantity += 1
      cart_item.save
    else
      CartItem.create(cart: cart, item: item, quantity: 1)
    end
    redirect_to "/items/show_item/#{item.id}"
  end
end
