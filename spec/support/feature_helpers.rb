module FeatureHelpers

  def login(user = nil)
    user ||= create :admin
    visit '/'
    click_link 'Login'
    fill_in 'Name', with: "#{user.name}"
    fill_in 'Password', with: "#{user.password}"
    click_button 'Log in'
  end
end
