class UsersController < ApplicationController
  def index
   @book = Book.new
  end

  def show
   @user = User.find(params[:id])
   @books = @user.books
  end

  def edit
  end

  private

  def user_params_update
   params.require(:user).permit(:name, :image, :introduction)
  end

end
