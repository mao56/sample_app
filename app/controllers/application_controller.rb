class ApplicationController < ActionController::Base
  
  #controlerで、Sessions_helperを使用できるようにする viewならばいらない
  include SessionsHelper
  
  protect_from_forgery with: :exception

  def hello
    render html: 'hello, world!'
  end
  
end
