class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:login, :new, :create]
  def new
    
  end
  
  def create
    @user = User.where("email = ?", params[:email]).first
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/giaodien/trangchu'
    else
       redirect_to '/dang-nhap'
    end
  end

  def destroy
    log_out
    redirect_to '/dang-nhap'
  end

  def login
  end

  def welcome
  end
end
