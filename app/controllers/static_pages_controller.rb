class StaticPagesController < ApplicationController
  def home
    # app/views/リソース名/アクション名.html.erb
    @micropost = current_user.microposts.build if logged_in?
  end

  def help
  end
  
  def about 
  end
  
  def contact 
  end
  
end
