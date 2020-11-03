class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @new_user = User.new(user_params)

        respond_to do |format|
            if @new_user.save
                session[:user_id] = @user_id
                format.html { redirect_to @new_user, notice: 'Acount creation was successfull'}
                format.json { render :show, status: :created, location: @user }
            else 
                format.html { render :new}
                format.json { render json: @new_user.errors, status: unprocessable_entity }
            end
        end
    end

    def show
        @all_user = User.all
    end

    private  

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email)
    end

end
