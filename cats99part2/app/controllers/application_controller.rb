class ApplicationController < ActionController::Base
    helper_method :current_user, :login_user!, :require_logout

    def current_user
        token = session[:session_token]
        user = User.find_by(session_token: token)
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    def require_logout
        redirect_to cats_url if logged_in?
    end
end
