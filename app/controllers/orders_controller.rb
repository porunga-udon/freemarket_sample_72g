class OrdersController < ApplicationController

  require 'payjp'
  before_action :authenticate_user!
  before_action :set_good
  before_action :set_address
  before_action :set_card
  before_action :check_current_user
  before_action :check_buyer_id, except: :done

  def index
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @good.buyer_id = current_user.id
    if @good.save
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      :amount => @good.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
      )
      flash[:notice] = "購入が完了しました。"
      redirect_to done_orders_path(@good.id)
    else
      flash[:alert] = '購入できませんでした。'
      redirect_to orders_path(@good.id)
    end
  end
  
  def done
    if @good.buyer_id.blank?
      redirect_to root_path
      flash[:alert] = '不正なアクセスです'
    end
  end

  private

  def set_good
    @good = Good.find(params[:format])
    @image = GoodImage.find_by(good_id:@good.id)
  end

  def set_address
    @address = (current_user.prefecture + current_user.city + current_user.block)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def check_current_user
    if current_user.id == @good.seller_id
      redirect_to root_path
      flash[:alert] = '自分の商品は購入できません'
    end
  end

  def check_buyer_id
    if @good.buyer_id.present?
      redirect_to root_path
      flash[:alert] = '不正なアクセスです'
    end
  end

  def authenticate_user!
    redirect_to root_path
    flash[:alert] = 'ログインしてください'
  end

end
