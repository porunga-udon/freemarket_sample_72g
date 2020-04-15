class GoodsController < ApplicationController
  def index
    @goods_all = Good.all
    @goods = Good.where(buyer_id: nil).limit(3).order(id: "DESC")

    @goods_women_new  = Good.where(buyer_id: nil, category_id: [20..85]).limit(3).order(id: "DESC")
    @goods_mens_new = Good.where(buyer_id: nil, category_id: [86..144]).limit(3).order(id: "DESC")

    @good_images = GoodImage.where(id: @goods_all.ids)
  end

  def new
    @good = Good.new
    @good.good_images.new
  end

  def show
    @good_detail = Good.find(params[:id])
  end

  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])
    if @good.update(good_update_params)
      flash[:notice] = "商品の編集が完了しました"
    elsif upload_file.present?
      flash[:alert] = "商品の編集に失敗しました"
      redirect_to edit_good_path(@good.id)
    end
  end

  def destroy
    good = Good.find(params[:id])
    if good.destroy
      flash[:notice] = "商品の削除が完了しました"
    else
      flash[:alert] = "商品の削除に失敗しました"
      redirect_to good_path(@good_detail)
    end
  end

  def create
    @good = Good.new(good_params)
    @good_image = GoodImage.new
    if @good.save 
      flash[:notice] = "出品が完了しました"
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      render :new
    end
  end
  

  private

  def good_params
    params.require(:good).permit(:name, :state, :size_id, :region, :postage, :category_id, :expanation, :shipping_date, :delivery_method_id, :price, good_images_attributes: [:image]).merge( seller_id: current_user.id)
  end

  def good_update_params
    params.require(:good).permit(:name, :state, :size_id, :region, :postage, :category_id, :expanation, :shipping_date, :delivery_method_id, :price, good_images_attributes: [:image, :_destroy, :id]).merge( seller_id: current_user.id)
  end
end
