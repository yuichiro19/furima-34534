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
      
    end
  end
end
