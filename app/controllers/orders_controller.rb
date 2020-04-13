class OrdersController < ApplicationController

  require 'payjp'
  before_action :set_good
  before_action :set_address
  before_action :set_card

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
  end

  private

  def set_good
    @good = Good.find(params[:format])
    @image = GoodImage.where(good_id:@good.id).first
  end

  def set_address
    @address = (current_user.prefecture + current_user.city + current_user.block)
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end
