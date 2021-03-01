require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
      it 'family_nameが全角だと登録できる' do
        @user.family_name = 'あア亜'
        expect(@user).to be_valid
      end
      it 'first_nameが全角だと登録できる' do
        @user.first_name = 'あア亜'
        expect(@user).to be_valid
      end

      it 'family_name_huriganaが全角カタカナだと登録できる' do
        @user.family_name_hurigana = 'アアア'
        expect(@user).to be_valid
      end
      it 'first_name_huriganaが全角カタカナだと登録できる' do
        @user.first_name_hurigana = 'アアア'
        expect(@user).to be_valid
      end
    end
    
  end
end
