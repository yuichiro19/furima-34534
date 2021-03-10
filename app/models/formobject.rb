class FormObject 
    include ActiveModel::Model
    attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase
    
    with_options presence: true do
        validates :postal_code
        validates :prefecture_id
        validates :city
        validates :address
        validates :phone_number
    end

    def save
        Purchase.create(:user_id, :item_id)
        ShippingAddress.create(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase)
    end

end