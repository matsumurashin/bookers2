class BooksController < ApplicationController


  def index
    @book_new = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end

    def create
      @book_val = Book.new(book_params)
      @book_val.user_id = current_user.id
      if @book_val.save
        redirect_to user_path(params[:id])
      else
        render :new
      end
    end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] ="You have updated book successfully."
       redirect_to book_path(@book)
    else
      render :show
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
