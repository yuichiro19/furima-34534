FactoryBot.define do
    factory :form_object do
      postal_code   { Faker::Number.number(3) + '-' + Faker::Number.number(4) }
      prefecture_id { 1 }
      city          { 'test' }
      address       { 'test' }
      building      { 'test' }
      phone_number  { Faker::Number.number(max_length: 11) }
      association :user, :item 

    end
  end
  