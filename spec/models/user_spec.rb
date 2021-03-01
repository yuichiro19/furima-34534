require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      end
      it 'family_nameとfirst_nameが全角だと登録できる' do
      end
      it 'family_name_huriganaとfirst_name_huriganaが全角カタカナだと登録できる' do
      end
    end
    
  end
end
