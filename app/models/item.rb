class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    belongs_to :category
    belongs_to :date_of_shipment
    belongs_to :shipping_fee
    belongs_to :sattus
    has_one_attached :image
    belongs_to :user

    
end
