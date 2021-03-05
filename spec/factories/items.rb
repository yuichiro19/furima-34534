FactoryBot.define do
  factory :item do
    item_name           { 'test_name' }
    text                { 'test_text' }
    price               { 1000 }
    category_id         { 1 }
    status_id           { 1 }
    shipping_fee_id     { 1 }
    prefecture_id       { 1 }
    date_of_shipment_id { 1 }
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test.jpeg'), filename: 'test.jpeg', content_type: 'image/jpeg')
    end
  end
end
