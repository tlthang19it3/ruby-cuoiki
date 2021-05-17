class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def index
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new param_user
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Register success"
      redirect_to '/giaodien/trangchu'
    else
      flash[:success] = "Register failed"
      render :new
    end
  end
  def login
  end

  def profile
  end

  def booking
    @booking = Booking.where("users_id = ?", session[:user_id])
    @pitch = Pitch.all
  end

  def editprofile
    user = User.find(session[:user_id])
    user.update(param_update)
    redirect_to '/profile'
  end

  def delete
    booking = Booking.find(params[:id])
    booking.delete
    redirect_to "/booking_request"
  end

  def changepw
    
  end

  def login_user
    user = User.find_by(name: params[:name])
    
    if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to giaodien_trangchu_path
    else
        flash[:alert] = "Invalid name or passs"
        render :login
  end
end
  private
  def param_user
    params.require(:user).permit(:username,:email,:password)
  end
  def param_update
    params.permit(:username,:email,:phone, :address, :birthday)
  end
end
