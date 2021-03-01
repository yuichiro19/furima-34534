FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'確認'}
    first_name            {'太郎'}
    family_name_hurigana  {'カクニン'}
    first_name_hurigana   {'タロウ'}
    birthday              {'1994-01-01'}
  end
end
