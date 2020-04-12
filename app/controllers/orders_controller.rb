class OrdersController < ApplicationController

  require 'payjp'
  before_action :set_good
  before_action :set_user
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
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @good.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
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

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end
