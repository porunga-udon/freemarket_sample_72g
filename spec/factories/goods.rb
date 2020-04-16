FactoryBot.define do

  factory good do
    name               {"ああ"}  
    state              {"未使用に近い"}  
    region             {"東京"}  
    postage            {"送料込み(出品者負担)"}  
    expanation         {"aaaaaa"}  
    shipping_date      {"1~2日で発送"}  
    delivery_method_id {"ああ"}  
    trading_conditions {"未発送"}  
    price              {"222"}  
    category_id        {"1"}  
    size_id            {"1"}  
    buyer              {"1"}  
    seller             {"1"}  
  end
end
  