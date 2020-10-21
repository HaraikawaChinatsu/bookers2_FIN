class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
    #  @user = User.find(params[:id])
     @book = Book.new
     @books = Book.where(user_id: @user.id)
    #  @users = User.all
    # @post_images = @user.post_images.page(params[:page]).reverse_order

  end

  def index
     @users = User.all
     @books = Book.all
     @book = Book.new
     @images = ProfileImage.all
  end

  def edit
    @users = User.find(params[:id])
    @users = User.all

   if @user.save
   flash[:notice] ="successfully"
   redirect_to user_path(@user.id)

   else
   flash.now[:danger] = "error"
   render :show

   end

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

   #デフォルトで画像を設定しておく。ユーザーのimageカラムにデータを代入
   @user.image = "no_image.jpg"
    if @user.save
        flash[:success] = "successfully"
        redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "error"
      render :show
    end

  end

  private
  # ストロングパラメータ
  # def
  #   # params.require(:book).permit(:title, :opinion)image
  # end

end
