class User::Users::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @users =User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
   @user = Utem.new(user_params)
   @use.save
   redirect_to admin_user_path(@user.id)
  end

  def update
    @useer = User.find(params[:id])
     if @user.update(user_params)
    redirect_to admin_user_path(@user.id)
     else
    render :edit
     end
  end

  protected
  def user_params
    params.require(:user).permit(:name,:introduction,:user_id,:is_active,)
  end
end
