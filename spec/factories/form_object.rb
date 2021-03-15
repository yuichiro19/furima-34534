FactoryBot.define do
  factory :form_object do
    postal_code   { '000-0000' }
    prefecture_id { 1 }
    city          { 'test' }
    address       { 'test' }
    building      { 'test' }
    phone_number  { '09000000000' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
