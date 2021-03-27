class BooksController < ApplicationController

  def new
    @book = Book.new
    @user_image = User_image.new
  end

  def index
    @book = Book.new
    #投稿機能入れ先
    @books = Book.all
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @user = @books.user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
     flash[:book] = "Book was successfully destroyed."
    redirect_to books_path
  end
  
  def update
    
  end

private

  def ensure_correct_user   
    @book = Book.find(params[:id])
     unless @book.user == current_user
     redirect_to books_path
     end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

