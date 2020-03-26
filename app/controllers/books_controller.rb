class BooksController < ApplicationController

# 共有bookstop
  def index
     @book =Book.new
     @books =Book.all
     @users =User.all
  end
# 投稿本の詳細
  def show
     @book =Book.find(params[:id])
     @newbook =Book.new
     @user =User.find(@book.user_id)
     # @book.user
   end
# 本の感想新規作成
  def create
     @book =Book.new(book_params)
     @books =Book.all
     # 子ユーザーの情報を親と関連づける
     @book.user_id = current_user.id
  if @book.save
     flash[:notice]= 'Book was successfully created.'
     redirect_to book_path(@book.id)
  else
     render :index
  end
end

# 本の感想編集
  def edit
      @book =Book.find(params[:id])
   if current_user.id != @book.user.id
      redirect_to books_path
    end
end

  def update
       @book =Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice]= 'Book was successfully update.'
       redirect_to book_path(@book.id)
    else
       render :edit
    end
  end

# 本の感想削除
  def destroy
       book = Book.find(params[:id])
       book.destroy
       redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
