class UsersController < ApplicationController



  def show
    @user = User.find(params[:id])
    @books =@user.books
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to user_path(current_user.id)
      end
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice]= "You have updetetd book successfully"
        redirect_to user_path(current_user.id)
      else
        render:edit
      end
  end
  
  def index
    @users = User.all
    @user = current_user
    @books = Book.new
  end
# 投稿データのストロングパラメータ
 
private
 def user_params
   params.require(:user).permit(:name,:introduction,:profile_image)
 end

end

