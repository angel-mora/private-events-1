class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @new_user = User.new(user_params)

 
    end

    def show
        @all_user = User.all
    end

    private  

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email)
    end

end
