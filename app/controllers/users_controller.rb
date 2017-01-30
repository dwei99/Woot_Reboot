class UsersController < ApplicationController
  def index
  end

  def create
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
