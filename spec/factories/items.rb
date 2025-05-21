FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    category_id { 1 }
    status_id { 1 }
    shipping_fee_id { 1 }
    area_id { 1 }
    day_id { 1 }
    price { 1 }
    user { nil }
  end
end
