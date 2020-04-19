require 'rails_helper'
describe User do
  describe '#create' do

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end


    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "birth_yearがない場合は登録できないこと" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "birth_monthがない場合は登録できないこと" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

    it "postcodeがない場合は登録できないこと" do
      user = build(:user, postcode: "")
      user.valid?
      expect(user.errors[:postcode]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      user = build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "blockがない場合は登録できないこと" do
      user = build(:user, block: "")
      user.valid?
      expect(user.errors[:block]).to include("を入力してください")
    end

    it "nicknameが10文字以下なら登録できること" do
      user = build(:user, nickname: "aaaaaaaaaa") # 10文字
      expect(user).to be_valid
    end

    it "nicknameが10文字以上なら登録できないこと" do
      user = build(:user, nickname: "aaaaaaaaaaa") # 11文字
      user.valid?
      expect(user.errors[:nickname]).to include("は10文字以内で入力してください")
    end

    it 'emailのフォーマットが不適切だと登録できないこと' do
      user = build(:user, email: 'aaa12345678')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが7文字以下だと登録できないこと" do
      user = build(:user, password: "a23456", password_confirmation: "a23456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "passwordが7文字以上だと登録できること" do
      user = build(:user, password: "a234567", password_confirmation: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが30文字以下だと登録できること" do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345",
      password_confirmation: "aaaaa12345aaaaa12345aaaaa12345") # 30文字
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが31文字以上だと登録できないこと" do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345a",
      password_confirmation: "aaaaa12345aaaaa12345aaaaa12345a") # 31文字
      user.valid?
      expect(user.errors[:password]).to include("は30文字以内で入力してください")
    end

    it "passwordに英字と数字を含めれば登録できること" do
      user = build(:user, password: "a234567", password_confirmation: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが数字だけだと登録できないこと" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含んで設定してください")
    end

    it "passwordが英字だけだと登録できないこと" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含んで設定してください")
    end

    it "passwordに記号を入れても登録できること" do
      user = build(:user, password: "a123456!@#$%^&*)(=_-", password_confirmation: "a123456!@#$%^&*)(=_-")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordとpassword_confirmationが一致していれば登録できること" do
      user = build(:user, password: "a123456", password_confirmation: "a123456")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordとpassword_confirmationが一致していなければ登録できないこと" do
      user = build(:user, password: "a123456", password_confirmation: "b012345")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "last_nameが20文字以内なら登録できること" do
      user = build(:user, last_name: "aaaaa12345aaaaa12345") # 20文字
      user.valid?
      expect(user).to be_valid
    end

    it "last_nameが21文字以上なら登録できないこと" do
      user = build(:user, last_name: "aaaaa12345aaaaa12345a") # 21文字
      user.valid?
      expect(user.errors[:last_name]).to include("は20文字以内で入力してください")
    end

    it "first_nameが20文字以内なら登録できること" do
      user = build(:user, first_name: "aaaaa12345aaaaa12345")
      user.valid?
      expect(user).to be_valid
    end

    it "first_nameが21文字以上なら登録できないこと" do
      user = build(:user, first_name: "aaaaa12345aaaaa12345a")
      user.valid?
      expect(user.errors[:first_name]).to include("は20文字以内で入力してください")
    end

    it "last_name_kanaが20文字以内なら登録できること" do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアアアアアア") # 20文字
      user.valid?
      expect(user).to be_valid
    end

    it "last_name_kanaが21文字以上なら登録できないこと" do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアアアアアアア") # 21文字
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は20文字以内で入力してください")
    end

    it "first_name_kanaが20文字以内なら登録できること" do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアア")
      user.valid?
      expect(user).to be_valid
    end

    it "first_name_kanaが21文字以上なら登録できないこと" do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は20文字以内で入力してください")
    end

    it "last_name_kanaがカタカナなら登録できること" do
      user = build(:user, last_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "last_name_kanaがカタカナでないなら登録できないこと" do
      user = build(:user, last_name_kana: "あ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("はカタカナで入力して下さい")
    end

    it "first_name_kanaがカタカナなら登録できること" do
      user = build(:user, first_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "first_name_kanaがカタカナでないなら登録できないこと" do
      user = build(:user, first_name_kana: "あ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("はカタカナで入力して下さい")
    end

    it "postcodeが7文字なら登録できること" do
      user = build(:user, postcode: "1234567")
      user.valid?
      expect(user).to be_valid
    end

    it "postcodeが7文字未満なら登録できないこと" do
      user = build(:user, postcode: "123456")
      user.valid?
      expect(user.errors[:postcode]).to include("は不正な値です")
    end

    it "postcodeが8文字以上なら登録できないこと" do
      user = build(:user, postcode: "12345678")
      user.valid?
      expect(user.errors[:postcode]).to include("は不正な値です")
    end

    it "prefectureが20文字以下だと登録できること" do
      user = build(:user, prefecture: "aaaaa12345aaaaa12345")
      user.valid?
      expect(user).to be_valid
    end

    it "prefectureが21文字以上だと登録できないこと" do
      user = build(:user, prefecture: "aaaaa12345aaaaa12345a")
      user.valid?
      expect(user.errors[:prefecture]).to include("は20文字以内で入力してください")
    end

    it "cityが20文字以下だと登録できること" do
      user = build(:user, city: "aaaaa12345aaaaa12345")
      user.valid?
      expect(user).to be_valid
    end

    it "cityが21文字以上だと登録できないこと" do
      user = build(:user, city: "aaaaa12345aaaaa12345a")
      user.valid?
      expect(user.errors[:city]).to include("は20文字以内で入力してください")
    end

    it "blockが20文字以下だと登録できること" do
      user = build(:user, block: "aaaaa12345aaaaa12345")
      user.valid?
      expect(user).to be_valid
    end

    it "blockが21文字以上だと登録できないこと" do
      user = build(:user, block: "aaaaa12345aaaaa12345a")
      user.valid?
      expect(user.errors[:block]).to include("は20文字以内で入力してください")
    end

  end
end
