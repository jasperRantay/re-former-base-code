class ApplicationController < ActionController::Base

    

    private

    def current_user
        UserAccount.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def current_user?(userAcc)
        current_user == userAcc 
    end
    helper_method :current_user?

    def require_signin
        unless current_user
            session[:intended_url] = request.url
            redirect_to new_session_url, alert: "Please sign in first!"
        end
    end
    
end
