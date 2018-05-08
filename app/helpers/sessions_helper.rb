module SessionsHelper
  
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # 現在ログインしているユーザの情報を確認する
  def current_user
    #if @current_user == nil
      #@current_user
    #else
      #@current_user = User.find_by(id: session[:user_id])
    #end
    
    #うえと同じ
    #@current_user = @current_user || User.find_by(id: session[:user_id])
    
    #うえと同じ
    @current_user ||= User.find_by(id: session[:user_id])
    
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  # 渡されたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end
  
end
