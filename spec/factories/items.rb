FactoryBot.define do
  factory :item do
    item_name           {Faker::Lorem.sentence}
    text                {Faker::Lorem.sentence}
    image               {Faker::Lorem.sentence}
    price               { 1000 }
    category_id         { 1 }
    status_id           { 1 }
    shipping_fee_id     { 1 }
    prefecture_id       { 1 }
    date_of_shipment_id { 1 }
    association :user 
  end
end
