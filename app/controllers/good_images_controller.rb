class GoodImagesController < ApplicationController
  def index
    @good_images = GoodImage.find_by_sql("SELECT image FROM good_images WHERE good_id IN (SELECT id FROM goods)")
  end

  private
  def good_img_params
    params.require(:good_image).permit(:image, :good_id)
  end
end
