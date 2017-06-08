module ApplicationHelper
  def login_button
    if logged_in?
      link_to 'Logout', logout_path, method: :delete
    else
      link_to 'Log In', login_path
    end
  end

  def sign_up_button
    if !logged_in?
      link_to 'Sign Up', choose_account_path
    end
  end

  def navbar_service_search
    if logged_in?
      "<input type='text' class='form-control search-form' placeholder='What service do you need today, #{current_user.first_name}?'>".html_safe
    end
  end

  def user_dashboard_button
    if logged_in?
      link_to 'User Dashboard', dashboard_path
    end
  end
  def pro_dashboard_button
    if logged_in? && current_user.type == "Pro"
      link_to 'Pro Dashboard', pro_dashboard_path
    end
  end

  def navbar_search_button
    if logged_in?
      "<div class='btn btn-default'><i class='glyphicon glyphicon-search'></i></div>".html_safe
    end
  end
end
