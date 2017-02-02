class UsersController < ApplicationController
  def index
  end

  def create
    user = User.create(f_name:params[:f_name],l_name:params[:l_name],email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
    if !user.errors.blank?
      puts "********"
      puts user.errors.messages
      puts "********"
      flash[:errors] = user.errors.messages
      return redirect_to '/users/index'
    end
    if user && user.authenticate(params[:password])
      #session[:id] = user.id
      flash[:notice] = "Registration Successful"
    else
      flash.now[:errors] = 'Invalid email/password combination'
      return redirect_to '/users/index'
    end
    return redirect_to '/users/index'
  end

  def login
    render 'login'
  end

  def logout
    reset_session
    redirect_to '/'
  end

  def log_user
     @user = User.find_by_email(params[:email])
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to "/"
     else
       flash[:log_error] = 'Invalid email/password combination'
       return redirect_to '/login'
     end
   end

  def edit
    @user = User.find(session[:user_id])
  end

  def edit_acct
    @user = User.find(session[:user_id])
    user = User.update(@user,f_name:params[:f_name],l_name:params[:l_name],email:params[:email], password:params[:password], password_confirmation: params[:password_confirmation])
    if !user.errors.blank?
      puts "********"
      puts user.errors.messages
      puts "********"
      flash[:errors] = user.errors.messages
      return redirect_to "/users/edit/#{user.id}"
    end
    return redirect_to "/"
  end

  def add_address
    user = User.find(session[:user_id])
    address = Address.create(street:params[:street], unit_number:params[:unit_number], city:params[:city],state:params[:state],zipcode:params[:zipcode], user:user)
    if !address.errors.blank?
        flash[:errors] = address.errors.messages
        return redirect_to "/users/edit/#{user.id}"
    end
    return redirect_to "/"
  end

end
