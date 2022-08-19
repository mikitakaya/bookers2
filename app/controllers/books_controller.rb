class BooksController < ApplicationController

  def index
   @book = Book.new
   @books =Book.all
   @user = current_user
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id

   if @book.save
    redirect_to book_path(@book.user_id)
   else
    render :index
   end
  end

  def show
   @user = current_user
   @book = Book.new
  end

  def edit
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

  def require_no_authentication
  end

  private

  def book_params
   params.require(:book).permit(:title, :body)
  end
end
