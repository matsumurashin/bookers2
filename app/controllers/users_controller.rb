class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = User.new
    @users = User.all
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(params[:id])
  end

  private

  def user_patams
    params.require(:user).permit(:name, :introduction)
  end

end
