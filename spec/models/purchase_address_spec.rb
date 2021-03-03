require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context 'when valid' do
      it 'is valid with valid attributes' do
        expect(@purchase_address).to be_valid
      end
      it 'is valid without building_name' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
      it 'is valid if a mobile_number contains 10 digits' do
        @purchase_address.mobile_number = 1234567890
        expect(@purchase_address).to be_valid
      end
      it 'is valid if a mobile_number contains 11 digits' do
        @purchase_address.mobile_number = 1234568901
        expect(@purchase_address).to be_valid
      end
    end
    context 'when not valid' do
      it 'is not valid without a token' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'is not valid without a postal_code' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'is not valid if a postal_cade is not hyphenated' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'is not valid without a prefecture' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'is not valid without a city' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'is not valid without a house_number' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'is not valid without a mobile_number' do
        @purchase_address.mobile_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Mobile number can't be blank")
      end
      it 'is not valid if a mobile_number is alphanumeric' do
        @purchase_address.mobile_number = '12345abcde'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Mobile number must be a figure")
      end
      it 'is not valid if a mobile_number is half-with alphabet' do
        @purchase_address.mobile_number = 'mobilenumber'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Mobile number must be a figure")
      end
    end
  end
end
