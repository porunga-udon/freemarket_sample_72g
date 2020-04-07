class GoodsController < ApplicationController
  def index
    @goods_all = Good.all
    @goods = Good.where(buyer_id: nil).limit(3).order(id: "DESC")

    @goods_women_new  = Good.where(buyer_id: nil, category_id: '1').limit(3).order(id: "DESC")
    @goods_mens_new = Good.where(buyer_id: nil, category_id: '2').limit(3).order(id: "DESC")

    @good_images = GoodImage.where(id: @goods_all.ids)
  end

  def new
    @good = Good.new
    @good.good_images.new
  end

  def create
    @good = Good.new(good_params)

    if @good.save
      redirect_to root_path
    else
      render :new
    end
  
  end

  def show
  end
end

private
def good_params
  params.require(:good).permit(:name, :expanation, :price, :state, :shipping_date, :region, :delivery_method, :frading_conditions, good_images_attributes: [:image]).merge( saler_id: current_user.id,postage:"test",category_id: 1,size_id: 1)
end

