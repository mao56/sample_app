class ApplicationController < ActionController::Base
  
  #controlerで、Sessions_helperを使用できるようにする viewならばいらない
  include SessionsHelper
  
  protect_from_forgery with: :exception

  def hello
    render html: 'hello, world!'
  end

  private

 # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
end
