class UsersController < ApplicationController
  def index
   @user = current_user
   @book = Book.new
   @users = User.all
  end

  def show
   @user = User.find(params[:id])
   @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
  end

  private

  def user_params_update
   params.require(:user).permit(:name, :image, :introduction)
  end

end
