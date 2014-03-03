module FeatureHelpers

  def login(user = nil)
    user ||= create :admin
    visit '/'
    click_link 'Login'
    fill_in 'Name',     with: "#{user.name}"
    fill_in 'Password', with: "#{user.password}"
    click_button 'Log in'
  end

  def sign_up_user(user_atts = nil)
    user_atts ||= attributes_for :user
    visit '/'
    click_on 'Signup'
    fill_in 'Name',                  with: "#{ user_atts[:name] }"
    fill_in 'Password',              with: "#{ user_atts[:password] }"
    fill_in 'Password confirmation', with: "#{ user_atts[:password_confirmation] }"
    click_on 'Sign up'
  end
end
