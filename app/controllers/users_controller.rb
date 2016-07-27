class UsersController < ApplicationController

  # def index
  #   @users = User.all
  # end

  def show
    @user = User.find_by(id: params[:id])
    if @user == nil
      redirect_to root_url
      flash[:danger] = "That user doesn't exist!"
    end
  end

  def new
    @user = User.new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You've successfully created a PartyQuest account. Gear up and make a quest!"
      redirect_back_or(root_url)
    else
      @errors = @user.errors.full_messages
      flash.now[:danger] = "Oops! We couldn't create your account!"
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if !current_user?(@user)
      flash[:danger] = "You do not have access to this profile."
      redirect_to root_url
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user?(@user)
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated!"
        redirect_to @user
      else
        @errors = @user.errors.full_messages
        flash.now[:danger] = "Uh oh! Something went wrong!"
        render 'users/edit'
      end
    else
      flash[:danger] = "You do not have access to this profile."
      redirect_to root_url
    end
  end

  def destroy
    @current_user.destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "Account deleted :("
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio, :city, :state, :avatar, :first_name, :last_name)
    end

end
