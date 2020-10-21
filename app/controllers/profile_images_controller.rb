class ProfileImagesController < ApplicationController

  def new
    @profile_image = ProfileImage.new
  end

  def create
    @profile_image = PostImage.new(profile_image_params)
    @profile_image.user_id = current_user.id
    @profile_image.save
    redirect_to profile_images_path
  end

  def index
    @profile_images = ProfileImage.all
  end

  def show
  end
# 投稿データのストロングパラメータ
  # private
  # def profile_image_params
  #   params.require(:profile_image).permit(:shop_name, :image, :caption)
  # end


end
