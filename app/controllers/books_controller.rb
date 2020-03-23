class BooksController < ApplicationController

  def index
     @book =Book.new
     @books =Book.all
  end

  def show
     @book = Book.new
  end

  def create
     @book = Book.new(book_params)
     @books =Book.all

  if @book.save

     flash[:notice]= 'Book was successfully created.'
     redirect_to user_path(current_user)
  else
     render action: :show
  end
  end

  def edit
     @book =Book.find(params[:id])
  end
  def update
    if book = Book.find(params[:id])
       book.update(book_params)
       flash[:notice]= 'Book was successfully update.'
       redirect_to book_path
    end
  end

  def destroy
    if book = Book.find(params[:id])
       book.destroy
       flash[:notice]= 'Book was successfully destroyed.'
       redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
