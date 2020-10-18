class UsersController < ApplicationController
  def show
     @users = User.find(params[:id])
  end

  def index
     @users = User.all
     @books = Book.all
     @book = Book.new
  end

  def edit
    @users = User.find(params[:id])
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book)
    # ２. データをデータベースに保存するためのsaveメソッド実行
   if @book.save
    # 詳細画面へリダイレクト
    flash[:success] = "successfully"
    redirect_to book_path(@book.id)

   else
    @books = Book.all
    render :index
   end

  end

end
