class GoodsController < ApplicationController
  before_action :find_good, only: [:edit, :update, :destroy]

  def index
    @goods_all = Good.all
    @goods = Good.where(buyer_id: nil).limit(3).order(id: "DESC")

    @goods_women_new  = Good.where(buyer_id: nil, category_id: [20..85]).limit(3).order(id: "DESC")
    @goods_mens_new = Good.where(buyer_id: nil, category_id: [86..144]).limit(3).order(id: "DESC")

    @good_images = GoodImage.where(id: @goods_all.ids)
  end

  def new
    if user_signed_in?
      @good = Good.new
      @good.good_images.new
    else
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  def show
    @good_detail = Good.find(params[:id])

    @good_user = User.find(@good_detail.seller_id)
    @good_size = Size.find(@good_detail.size_id) 

    @category_grand_children = Category.find(@good_detail.category_id)
    @category_children = @category_grand_children.parent
    @category_parent = @category_children.parent

  end

  def edit
    if current_user.id == @good.seller_id
      @category_grandchild = Category.find(@good.category_id)
      @category_child = @category_grandchild.parent
      @category_parent = @category_child.parent
    else
      flash[:alert] = "不正な操作です"
      redirect_to root_path
    end
  end

  def update
    if @good.update(good_update_params) && current_user.id == @good.seller_id
      flash[:notice] = "商品の編集が完了しました"
    else
      flash[:alert] = "商品の編集に失敗しました"
      redirect_to edit_good_path(@good.id)
    end
  end

  def destroy
    if @good.destroy && current_user.id == @good.seller_id
      flash[:notice] = "商品の削除が完了しました"
    else
      flash[:alert] = "商品の削除に失敗しました"
      redirect_to good_path(@good_detail)
    end
  end

  def create
    @good_image = GoodImage.new
    @good = Good.new(good_params)
    if @good.save 
      flash[:notice] = "出品が完了しました"
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      redirect_to new_good_path
    end
  end
  

  private

  def good_params
    params.require(:good).permit(:name, :state, :size_id, :region, :postage, :category_id, :expanation, :shipping_date, :delivery_method_id, :trading_conditions_id, :price, good_images_attributes: [:image]).merge( seller_id: current_user.id)
  end

  def good_update_params
    params.require(:good).permit(:name, :state, :size_id, :region, :postage, :category_id, :expanation, :shipping_date, :delivery_method_id, :trading_conditions_id, :price, good_images_attributes: [:image, :_destroy, :id]).merge( seller_id: current_user.id)
  end

  def find_good
    @good = Good.find(params[:id])
  end
end
