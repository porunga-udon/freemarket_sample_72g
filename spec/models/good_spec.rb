require 'rails_helper'
describe  Good do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
     good = Good.new(name:"", state:"未使用",size_id:"2" region:"東京", postage:"着払い(購入者負担)", category_id:"20", expanation:"aiueo", shipping_date:"1~2日で発送", delivery_method_id:"3", price:"89000", )
     good.valid?
     expect(good.errors[:name]).to include("can't be blank")
    end
  end
end