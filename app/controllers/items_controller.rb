class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.created_at
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :text, :price, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :date_of_shipment_id).merge(user_id: current_user.id)
  end
end
