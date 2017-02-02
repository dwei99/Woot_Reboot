class ChargesController < ApplicationController
  def new

  end

  def create
    @amount = 500
    @item = Item.find_by_id(params[:id])
    @user = session[:user_id]

    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer => customer.id,
    :amount => @amount,
    :description => 'Rails Stripe Customer',
    :currency => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
