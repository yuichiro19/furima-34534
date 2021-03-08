require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できる場合' do
      it '全ての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'category_idが未選択では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'category_idが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'status_idが未選択では出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status Select'
      end
      it 'status_idが空では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status Select'
      end
      it 'shipping_fee_idが未選択では出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee Select'
      end
      it 'shipping_fee_idが空では出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee Select'
      end
      it 'prefecture_idが未選択では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it 'date_of_shipment_idが未選択では出品できない' do
        @item.date_of_shipment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Date of shipment Select'
      end
      it 'date_of_shipment_idが空では出品できない' do
        @item.date_of_shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Date of shipment Select'
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300以上でないと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが9999999以下でないと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが全角だと出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it 'priceが半角英数混合だと出品できない' do
        @item.price = 'price500'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it 'priceが半角英語だと出品できない' do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it 'userが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
