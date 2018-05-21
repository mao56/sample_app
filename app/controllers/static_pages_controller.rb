class StaticPagesController < ApplicationController
  def home
    # app/views/リソース名/アクション名.html.erb
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about 
  end
  
  def contact 
  end
  
end
