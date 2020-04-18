FactoryBot.define do     
  factory :user do      
    nickname        {Faker::Name.name}
    email           {Faker::Internet.free_email}
    password        {"aaaaaa1"}
    last_name       {"横川"}
    first_name      {"竜也"}
    last_name_kana  {"ヨコカワ"}
    first_name_kana {"タツヤ"}
    birth_year      {"1900"}
    birth_month     {"3"}
    birth_day       {"3"}
    postcode        {"0591275"}
    prefecture      {"北海道"}
    city            {"苫小牧市錦岡"}
    block           {"57368"}
    phone_number    {"57368"}
  end 
end 
