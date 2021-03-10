class ShippingAddress < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :purchase
    belongs_to :prefecture

    with_options presence: true do
        validates :postal_code
        validates :prefecture_id
        validates :city
        validates :address
        validates :phone_number
    end
end
