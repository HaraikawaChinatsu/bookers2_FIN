class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = @user.id
    # @bookの値にcurrent_userの値を入れた

  if @book.save
    flash[:success] = "successfully"
    redirect_to book_path(@book.id)

  else
    @books = Book.all
    render :index
  end


  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @images = ProfileImage.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])

    unless current_user.id == @book.user.id
      redirect_to books_path
    end

    # if @book.edit(book_params)
    #   flash[:success] = "Book was successfully updated."
    #   redirect_to book_path(@book.id)
    # else
    #   flash.now[:danger] = "error"
    #   render :edit
    # end

  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:danger] = "error"
      render :edit
    end


  end

  def destroy

    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
# 投稿の内容はこっちに記載
