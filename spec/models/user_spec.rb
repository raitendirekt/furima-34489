require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    context 'User Information' do
      it 'is not valid without a nickname' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'is not valid without an email' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'is not valid with an existing email' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'is not valid if an email has not @' do
        @user.email = 'fake'
        expect(@user).to_not be_valid
      end
      it 'is not valid without a password' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'is valid if password is 6 or more characters' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'is not valid if password is not alphanumeric' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end
      it 'is not valid if password_confirmation does not match password' do
        @user.password = '123abc'
        @user.password_confirmation = '234bcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'Identity Verification' do
      it 'is not valid without a family_name' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'is not valid without a first_name' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'is not valid if family_name is not full-width characters' do
        @user.family_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name must be full-width characters')
      end
      it 'is not valid if first_name is not full-width characters' do
        @user.first_name = 'Hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name must be full-width characters')
      end
      it 'is not valid if kana_family_name is not full-width katakana characters' do
        @user.kana_family_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name must be full-width katakana characters')
      end
      it 'is not valid if kana_first_name is not full-width katakana characters' do
        @user.kana_first_name = '花子'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name must be full-width katakana characters')
      end
      it 'is not valid without a birthday' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
