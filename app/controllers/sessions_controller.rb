class SessionsController < ApplicationController


    def new

    end


    def create
        userAcc = UserAccount.find_by(email: params[:email])
        if userAcc && userAcc.authenticate(params[:password])
            session[:user_id] = userAcc.id
            redirect_to (session[:intended_url] || userAcc), notice: "Welcome back #{userAcc.name}"
            session[:intended_url] = nil
        else
            flash.now[:alert] = "Invalid Email/Password!"
            render :new
        end
    end


    def destroy
        session[:user_id] = nil
       redirect_to user_accounts_url, notice: "You signed out!"
    end

    private

    

end
