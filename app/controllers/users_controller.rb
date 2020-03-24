class UsersController < ApplicationController

# 共有　userstop
  def index
    @users = User.all
  end

# my page
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

# 自己紹介の編集
  def edit
  	@user = User.find(params[:id])
  end
# 自己紹介のアップデート
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
