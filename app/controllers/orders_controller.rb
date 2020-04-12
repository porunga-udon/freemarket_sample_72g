class OrdersController < ApplicationController

  require 'payjp'
  before_action :set_good
  before_action :set_user
  def index
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
   
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @good.price,
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    redirect_to done_orders_path(@good.id)
  end
  
  def done
    @good.buyer_id = @user.id
    @good.save
  end


  private
  
  def set_good
    @good = Good.find(params[:format])
    @image = GoodImage.where(good_id:@good.id).first
  end

  def set_user
    @user = current_user
    @address = (@user.prefecture + @user.city + @user.block)
  end

end
