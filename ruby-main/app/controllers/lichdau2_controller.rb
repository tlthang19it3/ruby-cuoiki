class Lichdau2Controller < ApplicationController
  def index
     @doibong = Doibong.all
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
    @trandau = Trandau.all
  end

  def edit
    @trandau = Trandau.find(params[:id])
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
  def xacnhan
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
    @abc = Trandau.find(params[:id])
    @abc.update(confirm: 1)

    redirect_to "http://127.0.0.1:3000/lichdau2"
  end
  def huy1
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
    @abc = Trandau.find(params[:id])
    @abc.update(confirm: 2)

    redirect_to "http://127.0.0.1:3000/lichdau2"
  end
  def update
    @trandau = Trandau.find(params[:id]) 
    @trandau.update(lichdau_params)

    redirect_to lichdau2_path(@trandau)
  end

  private
  def lichdau_params
    params.require(:trandau).permit(:confirm)
  end
end
