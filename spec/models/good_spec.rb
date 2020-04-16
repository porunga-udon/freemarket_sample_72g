require 'rails_helper'
describe Good do
  describe '#create' do

  it "nameがない場合は登録できないこと" do
    good = build(:good, name: "")
    good.valid?
    expect(good.errors[:name])
    end

  it "stateがない場合は登録できないこと" do
    good = build(:good, state: "")
    good.valid?
    expect(good.errors[:state])
    end


  end
end
