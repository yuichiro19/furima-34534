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
        end
    end
end