class Admin::UsersController < ApplicationController
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
   @user = User.new(user_params)
   @user.save
   redirect_to admin_user_path(@user.id)
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
    redirect_to admin_user_path(@user.id)
     else
    render :edit
     end
  end

  protected
  def user_params
    params.require(:user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:password,:introduction,:user_id,:is_deleted,)
  end
end
