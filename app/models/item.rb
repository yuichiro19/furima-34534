class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :date_of_shipment
  belongs_to :shipping_fee
  belongs_to :status
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :text
    validates :image
    validates :price, numericality: { other_than: 0, message: 'Half-width number' },
                      inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :date_of_shipment_id
  end

  # validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
  # numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
