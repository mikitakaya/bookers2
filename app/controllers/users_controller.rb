class UsersController < ApplicationController
  def index
   @user = current_user
   @book = Book.new
   @users = User.all
  end

  def show
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = current_user
   if @user.update(user_params_update)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
   else
    render :edit
   end
  end

  private

  def user_params_update
   params.require(:user).permit(:name, :image, :introduction)
  end

end
