class BooksController < ApplicationController

before_action :ensure_correct_user, only:[:edit]


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
    #　↑確認
    if @book.save
      flash[:book] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index #renderはコントローラーを通さない
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:book] = "Book was successfully update."
      redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
     flash[:book] = "Book was successfully destroyed."
    redirect_to books_path
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

