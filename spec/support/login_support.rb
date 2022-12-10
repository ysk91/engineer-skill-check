require 'rails_helper'

module LoginSupport
  module System
    def login(user)
      visit login_path
      fill_in 'account', with: user.account
      fill_in 'password', with: user.password
      click_button 'commit'
    end
  end
  module Request
    def login(user)
      visit login_path
      fill_in 'account', with: user.account
      fill_in 'password', with: user.password
      click_button 'commit'
      # session[:user_id] = user.id
      # post login_path, params: { session: { account: user.account,
      #                                       password: user.password } }
    end
    def logged_in?
      !session[:user_id].nil?
    end
  end
end
  
RSpec.configure do |config|
  config.include LoginSupport
  config.include LoginSupport::System, type: :system
  config.include LoginSupport::Request, type: :request
end