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

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複するemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com '
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混同でないと登録できない' do
        @user.password = 'テストパスワード'
        @user.password_confirmation = 'テストパスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Input half-width characters."
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが存在しても一致しないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_nameが全角以外では登録できない' do
        @user.family_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid. Input full-width characters."
      end
      it 'first_nameが全角以外では登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end
      it 'family_name_huriganaが空では登録できない' do
        @user.family_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name hurigana can't be blank"
      end
      it 'first_name_huriganaが空では登録できない' do
        @user.first_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name hurigana can't be blank"
      end
      it 'family_name_huriganaが全角カタカナ以外では登録できない' do
        @user.family_name_hurigana = '田中'
        @user.valid? 
        expect(@user.errors.full_messages).to include "Family name hurigana is invalid. Input full-width katakana characters."
      end
      it 'first_name_huriganaが全角カタカナ以外では登録できない' do
        @user.first_name_hurigana = '太郎'
        @user.valid? 
        expect(@user.errors.full_messages).to include "First name hurigana is invalid. Input full-width katakana characters."
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
    
  end
end
