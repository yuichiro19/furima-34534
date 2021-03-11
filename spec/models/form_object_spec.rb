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
                
            end
            it 'postal_codeが全角だと購入できない' do
                
            end
            it 'postal_codeが半角英数混合だと購入できない' do
                
            end
            it 'postal_codeが半角英語だと購入できない' do
                
            end
            it 'postal_codeに-が含まれていないと購入できない' do
                
            end
            it 'postal_codeに-が含まれてても-の位置が違うと購入できない' do
                
            end
            it 'prefecture_idが空では購入できない'do
                
            end
            it 'prefecture_idが未選択では購入できない' do
                
            end
            it 'cityが空では購入できない' do
                
            end
            it 'addressが空では購入できない' do
                
            end
            it 'phone_numberが空では購入できない' do
                
            end
            it 'phone_numberが12桁以上では購入できない' do
                
            end
            it 'phone_numberが全角だと購入できない' do
                
            end
            it 'phone_numberが半角英数混合だと購入できない' do
                
            end
            it 'phone_numberが半角英語だと購入できない' do
                
            end
            it 'userが紐づいていなければ購入できない' do
                
            end
            it 'itemが紐づいていなければ購入できない' do
                
            end
        end
    end
end