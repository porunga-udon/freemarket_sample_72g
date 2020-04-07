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
    # @good_images = GoodImage.where(id: @goods_all.ids)
  end


  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :state, :region, :postage, :expanation, :shipping_date, :delivery_method, :frading_conditions, :price, :category_id, :buyer, good_images_attributes: [:image])
  end

end
