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
      "<input type='text' class='form-control' placeholder='What service do you need today, #{current_user.first_name}?'>".html_safe
    end
  end

  def navbar_search_button
    if logged_in?
      "<button type='submit' class='btn btn-default'><i class='glyphicon glyphicon-search'></i></button>".html_safe
    end
  end
end
