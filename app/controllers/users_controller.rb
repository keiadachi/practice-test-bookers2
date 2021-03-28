class UsersController < ApplicationController
 
 before_action :ensure_correct_user, only:[:edit]

  
  def new
   @user = User.new
   @book = Book.new
   @user_image = User_image.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    
    @user_image = User_image.new(post_image_params)
    @user_image.user_id = current_user.id
    @user_image.save
    redirect_to edit_user_path
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
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:user] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render action: :edit
    #current_userで個人へ遷移
    end
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

