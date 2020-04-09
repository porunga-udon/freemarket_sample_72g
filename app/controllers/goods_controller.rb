class GoodsController < ApplicationController
  def index
    @goods_all = Good.all
    @goods = Good.where(buyer_id: nil).limit(3).order(id: "DESC")

    @goods_mens_new  = Good.where(buyer_id: nil, category_id: '1').limit(3).order(id: "DESC")
    @goods_women_new = Good.where(buyer_id: nil, category_id: '2').limit(3).order(id: "DESC")
    @good_images = GoodImage.where(id: @goods_all.ids).limit(1)
  end

  def new
    @good = Good.new
  end

  def show
    @good_detail = Good.find(params[:id])
  end
end
