FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"a234567"}
    password_confirmation {"a234567"}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birth_year            {"2000"}
    birth_month           {"1"}
    birth_day             {"1"}
    postcode              {"1234567"}
    prefecture            {"群馬県"}
    city                  {"太田市"}
    block                 {"000"}
    phone_number          {"1234567"}
  end

end