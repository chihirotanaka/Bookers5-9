class BooksController < ApplicationController
# 共有bookstop
  def index
     @book =Book.new
     @books =Book.all
     @user = current_user
  end
# 投稿本の詳細
  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
  end
# 本の感想新規作成
  def create
     @book = Book.new(book_params)
     @books =Book.all
     # 子ユーザーの情報を親と関連づける
     @book.user_id = current_user.id
  if @book.save
     flash[:notice]= 'Book was successfully created.'
     redirect_to book_path(@book.id)
  else
     render action: :index
  end
  end
# 本の感想編集
  def edit
     @book =Book.find(params[:id])
  end
  def update
    if book = Book.find(params[:id])
       book.update(book_params)
       flash[:notice]= 'Book was successfully update.'
    else
       redirect_to book_path
    end
  end
# 本の感想削除
  def destroy
    if book = Book.find(params[:id])
       book.destroy
       flash[:notice]= 'Book was successfully destroyed.'
     else
       redirect_to user_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
