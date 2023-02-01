class UserAccountsController < ApplicationController

    before_action :require_signin, except: [:new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]

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
            session[:user_id] = @userAcc.id
            redirect_to @userAcc, notice: "Successfully created!"
        else
            render :new
        end
    end


    def edit
    #   @userAcc = UserAccount.find(params[:id])
    end


    def update
    #   @userAcc = UserAccount.find(params[:id])
      if @userAcc = UserAccount.update(user_account_params)
            redirect_to user_account_path, notice: "Successfully updated!"
        else
            render :new
        end
    end


    def destroy
    #   @userAcc = UserAccount.find(params[:id])
      @userAcc.destroy
      session[:user_id] = nil
      redirect_to user_accounts_url, notice: "Account has been deleted!"
    end

    private

    def require_correct_user
        @userAcc = UserAccount.find(params[:id])
        redirect_to user_accounts_url unless current_user?(@userAcc)
    end

    def user_account_params
        params.require(:user_account).
                permit(:name, :email, :password, :password_confirmation)
    end

end
