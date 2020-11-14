class UsersController < ApplicationController
  before_action :already_logged_in?, only: %i[show edit update destroy]

  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'Acount creation was successfull' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: unprocessable_entity }
      end
    end
  end

  def show
    @this_user = User.find(params[:id])
    @events = @this_user.events
    @attended_events = @this_user.attended_events
    @upcoming_events = @this_user.events.upcoming
    @past_events = @this_user.events.past
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email)
  end
end
