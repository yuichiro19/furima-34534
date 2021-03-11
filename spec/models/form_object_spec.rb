require 'rails_helper'

RSpec.describe FormObject, type: :model do
    before do
        @form_object = FactoryBot.build(:form_object)
    end

    describe '商品の購入' do
        context '商品の購入ができる場合' do
            it '全ての項目が正しく入力されていれば購入できる' do
                expect(@form_object).to be_valid
            end
            it 'buildingが空でも他の項目が正しく入力されていれば購入できる' do
                @form_object.building = ''
                expect(@form_object).to be_valid
            end
        end
        context '商品が購入できない場合' do
            it 'postal_codeが空では購入できない' do
                @form_object.postal_code = ''
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Postal code can't be blank"
            end
            it 'postal_codeが全角だと購入できない' do
                @form_object.postal_code = '０００−００００'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Postal code Input correctly"
            end
            it 'postal_codeが半角英数混合だと購入できない' do
                @form_object.postal_code = '000i0000'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Postal code Input correctly"
            end
            it 'postal_codeが半角英語だと購入できない' do
                @form_object.postal_code = 'postalaa'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Postal code Input correctly"
            end
            it 'postal_codeに-が含まれていないと購入できない' do
                @form_object.postal_code = '0000000'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Postal code Input correctly"
            end
            it 'postal_codeに-が含まれてても-の位置が違うと購入できない' do
                @form_object.postal_code = '0000-000'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Postal code Input correctly"
            end
            it 'prefecture_idが空では購入できない'do
                @form_object.prefecture_id = nil
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Prefecture Select"
            end
            it 'prefecture_idが未選択では購入できない' do
                @form_object.prefecture_id = 0
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Prefecture Select"
            end
            it 'cityが空では購入できない' do
                @form_object.city = ''
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "City can't be blank"
            end
            it 'addressが空では購入できない' do
                @form_object.address = ''
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Address can't be blank"
            end
            it 'phone_numberが空では購入できない' do
                @form_object.phone_number = ''
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Phone number can't be blank"
            end
            it 'phone_numberが12桁以上では購入できない' do
                @form_object.phone_number = '000000000000'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Phone number Input only number"
            end
            it 'phone_numberが全角だと購入できない' do
                @form_object.phone_number = '０００００００００００'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Phone number Input only number"
            end
            it 'phone_numberが半角英数混合だと購入できない' do
                @form_object.phone_number = 'phonenum00'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Phone number Input only number"
            end
            it 'phone_numberが半角英語だと購入できない' do
                @form_object.phone_number = 'phonenum'
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Phone number Input only number"
            end
            it 'userが紐づいていなければ購入できない' do
                @form_object.user_id = nil
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "User can't be blank"
                
            end
            it 'itemが紐づいていなければ購入できない' do
                @form_object.item_id = nil
                @form_object.valid?
                expect(@form_object.errors.full_messages).to include "Item can't be blank"
            end
        end
    end
end