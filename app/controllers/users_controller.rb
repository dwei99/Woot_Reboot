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
  end

  def log_user
     @user = User.find_by_email(params[:email])
     if !@user.errors.blank?
       flash[:log_errors] = @user.errors.messages
       puts flash[:log_errors]
       return redirect_to '/login'
     end
     if @user && @user.authenticate(params[:password])
       session[:id] = @user.id
       redirect_to "/"
     else
       flash[:log_error] = 'Invalid email/password combination'
       return redirect_to '/login'
     end
   end

  def edit
  end
end
