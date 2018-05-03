require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:testuser)
  end
  
test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information followed by logout" do
    #login test
    get login_path #login_pathにGETをおくる
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
                                          #login_pathにPOSTをおくる
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0 #login_pathがないことを確認
    assert_select "a[href=?]", logout_path #loout_pathがあることを確認
    assert_select "a[href=?]", user_path(@user) #user_path/idがあることを確認
  
    #logout test
    delete logout_path #logout_pathにDELETEをおくる
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
  
end
