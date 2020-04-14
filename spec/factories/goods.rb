FactoryBot.define do

  factory :good do
    id                    {""}
    user
    name                  {"abe"}
    state                 {""}
    region                {""}
    postage               {""}
    expanation            {""}
    shipping_date         {""}
    delivery_method_id    {""}
    trading_conditions    {""}
    price                 {""}
    category_id           {""}   
    size_id               {""}
    buyer                 {""}
    seller                {""}
  end
end