module ApplicationHelper
  def top_links
    if session[:user_id]
      "<a class=\"menu-item btn btn-primary\" href=\"#\"> Hello! #{current_user.first_name} </a>
            <a class=\"menu-item\" href=\"/users\"> <b> View all users</b> </a>
            <a class=\"menu-item\" href=\"/events\"> <b>See all events</b> </a>
             <a class=\"menu-item\" href=\"/logout\">Logout  </a>".html_safe
    else
      "<a class=\"menu-item\" href=\"login\"> Login </a>
            <a class=\"menu-item\" href=\"/sign_up\">Create account  </a>".html_safe
    end
  end

  def add_event_btn
    '<a class="add_event" href="/events/new"> ADD EVENT</a>'.html_safe unless current_page?(new_event_path)
  end
end
