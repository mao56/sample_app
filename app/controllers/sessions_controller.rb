class SessionsController < ApplicationController
  
  #controlerで、Sessions_helperを使用できるようにする viewならばいらない
  include SessionsHelper
  
  #GET /login
  def new
  end
  
  #POST /login
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user[:password_digest] && user.authenticate(params[:session][:password])
      #password_digestがなかった場合もlogin拒否にする
      log_in user
      redirect_to
      #true
    else
      flash.now[:danger] = "email or password error!"
      render "new"
    end
  end
  
end
