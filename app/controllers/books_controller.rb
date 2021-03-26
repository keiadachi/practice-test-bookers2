class BooksController < ApplicationController
  
  def new 
    @book = Book.new
    @user_image = User_image.new
  end
  
  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @user = @books.user
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def edit
  end
  
private
  
  def book_params
    params.require(:book).permit(:title, :body)
    #編集は1か所ずつだからbook単数形>
  end

  
end

