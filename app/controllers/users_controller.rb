class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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

end
