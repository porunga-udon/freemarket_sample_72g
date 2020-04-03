class GoodsController < ApplicationController
  def index
    @goods = Good.where(buyer_id: nil).limit(3).order(id: "DESC")

    @goods_a = Good.where(buyer_id: nil, category_id: '1').limit(3).order(id: "DESC")
    @goods_b = Good.where(buyer_id: nil, category_id: '2').limit(3).order(id: "DESC")

    @good_images = GoodImage.find_by_sql("SELECT image FROM good_images WHERE good_id IN (SELECT id FROM goods)")
  end

  def new
    @good = Good.new
   # @category = Category.new
   # @size = Size.new
   # @goog_image = Good_image.new
  end


  def show

  end
end
