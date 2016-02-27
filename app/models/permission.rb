class Permission < Struct.new(:user)

  # there are three types of users on application level
  # admins      - are allowed to request every action
  # guests      - are only allowed to sign up and see the home page
  # and members - are allowed every action according to their role
  def allow?(controller, action)
    # admins
    return true if user && user.admin?

    # guests
    if user.nil?
      return true if controller == 'home'                && action == 'index'
      return true if controller == 'users'               && action.in?(%w[new create])
      return true if controller == 'sessions'            && action.in?(%w[new create])
      return true if controller == 'password_resets'     && action.in?(%w[new create edit update])
      return true if controller == 'releases'            && action.in?(%w[index])
    # members
    else
      return true if controller == 'home'                && action.in?(%w[index])
      return true if controller == 'users'               && action.in?(%w[new create])
      return true if controller == 'sessions'            && action.in?(%w[new create destroy])
      return true if controller == 'dashboards'          && action.in?(%w[show])
      return true if controller == 'userstories'         && action.in?(%w[index new create show edit update destroy])
      return true if controller == 'acceptance_tests'    && action.in?(%w[index new create show edit update destroy])
      return true if controller == 'tasks'               && action.in?(%w[index new create show edit update destroy])
      return true if controller == 'current_userstories' && action.in?(%w[index])
    end

    false
  end
end
