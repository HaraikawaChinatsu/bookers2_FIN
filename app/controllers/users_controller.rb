class UsersController < ApplicationController
before_action :authenticate_user!
  def show
     @user = User.find(params[:id])
    #  @user = User.find(params[:id])
     @books = @user.books
     @book = Book.new
    #  @user = current_user

    #  @post = Post.new(
    #  content: params[:content],
    #  user_id: @current_user.id

    #  @book = @user.book.page(params[:page]).reverse_order
    # Userが投稿した本はbooks
    #  @users = User.all
    # @post_images = @user.post_images.page(params[:page]).reverse_order

  end

  def index
     @users = User.all
     @books = Book.all
     @book = Book.new
     @user = current_user
     @images = ProfileImage.all
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
        redirect_to user_path(current_user)
        # flash.now[:danger] = "error"
    end
  end

  def update
    @user = User.find(params[:id])

   if  @user.update(user_params)
   flash[:notice] ="successfully"
   redirect_to user_path(@user.id)

   else
   flash.now[:danger] = "error"
   render :edit

   end

    # @user.image = "no_image.jpg"
    # if @user.save
    #     flash[:success] = "successfully"
    #     redirect_to user_path(@user.id)
    # else
    #   flash.now[:danger] = "error"
    #   render :show
    # end


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

   def user_params
      params.require(:user).permit(:name, :introduction)
   end

end
