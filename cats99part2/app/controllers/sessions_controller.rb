class SessionsController < ApplicationController
    
    def new
        
    end

    def create
        user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        
        if user
            user.reset_session_token!
            session[:session_token] = user.session_token
            redirect_to cats_url
        else
            render json: "FAIL"
        end
    end

    def destroy
        user = current_user
        if user
            user.reset_session_token!
            session[:session_token] = nil
        end
        redirect_to cats_url
    end
end