require 'rails_helper'
describe Card do
  describe '#pay' do
    it "user_idがない場合には登録できない" do
      card = Card.new(user_id:"", customer_id: "cus_9bc89a88d8c5b1b4ed0ffb030907", card_id: "car_2f8885f7a48658bb8d0633873a69")
     card.valid?
     expect(card.errors[:user_id]).to include("を入力してください")
    end

    it "customer_idがない場合には登録できない" do
      card = Card.new(user_id:"1", customer_id: "", card_id: "car_2f8885f7a48658bb8d0633873a69")
     card.valid?
     expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idがない場合には登録できない" do
      card = Card.new(user_id:"1", customer_id: "cus_9bc89a88d8c5b1b4ed0ffb030907", card_id: "")
     card.valid?
     expect(card.errors[:card_id]).to include("を入力してください")
    end
    
  end
end