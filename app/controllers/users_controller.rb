class UsersController < ApplicationController
  
  def new
   @user = User.new
   @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
   @user = User.find(params[:id])
   #userinfo兼@books用
   @books = @user.books
   #@userを拾ってきてから@booksでuser.booksを作り上げる
   @book = Book.new
  end

  def edit
  end
  
private
  
  def ensure_correct_user
     @user = User.find(params[:id])
     unless @user == current_user
     redirect_to user_path(current_user)
     end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
