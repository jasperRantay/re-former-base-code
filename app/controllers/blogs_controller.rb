class BlogsController < ApplicationController

    before_action :require_signin, except: [:new, :create, :index]
    before_action :require_correct_user, only: [:new, :create]
    

    def index
        
        @blogs = Blog.all
        
    end
end
