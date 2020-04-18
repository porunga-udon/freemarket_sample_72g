require 'rails_helper'

RSpec.describe Good, type: :model do
  let(:user){create(:user)}
  let(:category){create(:category)}
  describe '#create' do
    it "nameが空の場合は登録できないという事" do
      good = build(:good, name: "")
      good.valid?
      expect(good.errors[:name]).to include("を入力してください")
    end
    it "stateが空の場合は登録できないという事" do
      good = build(:good, state: "")
      good.valid?
      expect(good.errors[:state]).to include("を入力してください")
    end
     it "regionが空の場合は登録できないという事" do
      good = build(:good, region: "")
      good.valid?
      expect(good.errors[:region]).to include("を入力してください")
    end
     it "postageが空の場合は登録できないという事" do
      good = build(:good, postage:"")
      good.valid?
      expect(good.errors[:postage]).to include("を入力してください")
    end
     it "shipping_dateが空の場合は登録できないという事" do
      good = build(:good, shipping_date:"")
      good.valid?
      expect(good.errors[:shipping_date]).to include("を入力してください")
    end
     it "expanationが空の場合は登録できないという事" do
      good = build(:good, expanation:"")
      good.valid?
      expect(good.errors[:expanation]).to include("を入力してください")
     end
     it "delivery_method_idが空の場合は登録できないという事" do
      good = build(:good, delivery_method_id:"")
      good.valid?
      expect(good.errors[:delivery_method_id]).to include("を入力してください")
     end
     it "priceが空の場合は登録できないという事" do
      good = build(:good, price:"")
      good.valid?
      expect(good.errors[:price]).to include("を入力してください")
     end
     it "priceが300以下の場合は登録できないという事 " do
      good = build(:good, price: "299")
      good.valid?
      expect(good.errors[:price]).to include("は一覧にありません")
     end


     it "priceが300以上の場合は登録可能という事 " do
      good = build(:good, id: 1, price: "301",category_id: category.id , seller_id: user.id)
      good.valid?
      expect(good).to be_valid
     end
     it "全て揃っていれば登録できるという事 " do
      good = build(:good, id: 1,category_id: category.id , seller_id: user.id)
      good.valid?
      expect(good).to be_valid
     end
  end
end
