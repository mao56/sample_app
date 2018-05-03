class SessionsController < ApplicationController
  #GET /login
  def new
  end
  
  #POST /login
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user[:password_digest] && user.authenticate(params[:session][:password])
      #password_digestがなかった場合もlogin拒否にする
      
      #true
    else
      flash.now[:danger] = "email or password error!"
      render "new"
    end
  end
  
end
