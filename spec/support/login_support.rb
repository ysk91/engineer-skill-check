require 'rails_helper'

module LoginSupport
  def login(user)
    post login_path, params: { employees: {
      account: user.account,
      password: user.password
    } }
  end
  def logged_in?
    !session[:user_id].nil?
  end
end