class ItemsController < ApplicationController
  def index
  end






  private

  def item_params
    params.require(:item).permit(:item_name, :image, :text, :price, :category_id, :status_id, :shipping_fee_id, :prefucture_id, :date_of_shipment_id).merge(user_id: current_user.id)
  end
end
