class UsersController < ApplicationController
 before_action :correct_user, only: [:edit, :update]

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
   if @user == current_user
    render :edit
   else
    redirect_to user_path(@user.id)
   end
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
   params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
   @user = User.find(params[:id])
   redirect_to user_path(current_user) unless @user == current_user
  end

end
