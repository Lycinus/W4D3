class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        token = session[:session_token]
        user = User.find_by(session_token: token)
    end
end
