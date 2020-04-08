class GoodsController < ApplicationController
  def index
    @goods_all = Good.all
    @goods = Good.where(buyer_id: nil).limit(3).order(id: "DESC")

    @goods_women_new  = Good.where(buyer_id: nil, category_id: '1').limit(3).order(id: "DESC")
    @goods_mens_new = Good.where(buyer_id: nil, category_id: '2').limit(3).order(id: "DESC")

    @good_images = GoodImage.where(id: @goods_all.ids).limit(1)
  end

  def new
    @good = Good.new

    @category = Category.all.map { |category| [category.name, category.id, category.ancestry_id] }
    @category_all = Category.all
    @category_parents = Category.all.order("id ASC").limit(13)
    @category_child = Category.where(ancestry_id: @category_all.ids)

    @good.good_images.new
    # @good_images = GoodImage.where(id: @goods_all.ids)
  end


  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
      end
    end
  end
  

  private

  def good_params
    params.require(:good).permit(:name, :state, :region, :postage, :expanation, :shipping_date, :delivery_method, :price, good_images_attributes: [:image]).merge( saler_id: current_user.id, trading_conditions: "non", category_id: 1)
  end

end
