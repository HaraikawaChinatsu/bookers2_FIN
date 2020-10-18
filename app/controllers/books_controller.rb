class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

  # 以下を追加
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

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:danger] = "error"
      render :edit
    end

  end

  def destroy
    # PostImage  # => camel
    # post_image # => snake
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book
    params.require(:book).permit(:title, :opinion)
  end

end
# 投稿の内容はこっちに記載
