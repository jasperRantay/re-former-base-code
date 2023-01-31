class UserAccountsController < ApplicationController

    def index
        @userAccs = UserAccount.all
    end

    def show
        @userAcc = UserAccount.find(params[:id])
    end


    def new
        @userAcc = UserAccount.new
    end

    def create
        @userAcc = UserAccount.new(user_account_params)
        if @userAcc.save
            redirect_to @userAcc, notice: "Successfully created!"
        else
            render :new
        end
    
    end

    private

    def user_account_params
        params.require(:user_account).
                permit(:name, :email, :password, :password_confirmation)
    end

end
