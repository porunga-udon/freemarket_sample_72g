class UsersController < ApplicationController
    before_action :set_hash
  
  def show
    @goods = Good.where(seller_id: current_user.id)
  end

  def destroy
  end

  def goods_sale
    @goods = Good.where(seller_id: current_user.id).order(id: "DESC").page(params[:page])
  end

  def goods_list
    @goods = Good.where(seller_id: current_user.id).order(id: "DESC").page(params[:page]).per(5)
  end

  def goods_buy
    @goods = Good.where(buyer_id: current_user.id).order(id: "DESC").page(params[:page])
  end

  def goods_buy_fin_user
    @goods = Good.where(buyer_id: current_user.id).order(id: "DESC").page(params[:page])
  end


  private
  def set_hash
    @contents = ["マイページ","お知らせ","やることリスト","いいね！一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品-売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @options = ["プロフィール","発送元・お届先住所変更","支払い方法","メール/パスワード","本人情報","電話番号の確認","ログアウト"]
    @todos = ["【重要】2020/04/04(土) AM03:00 ~ AM03:45 システムメンテナンスのお知らせ","《春得出品祭》当選者へのご連絡・山分けポイント付与対象者へのポイント付与を完了しました"]
    @goods = ["スニーカー","プレイステーション4","iPhone11","MacBookPro"]
  end
end
