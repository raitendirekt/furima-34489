require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context 'when valid' do
      it 'is valid with valid attributes' do
        expect(@item).to be_valid
      end
      it 'is valid if price is 300' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'is valid if price is 9,999,999' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it 'is valid if price is half-width number' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context 'when not valid' do
      it 'is not valid without an image' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'is not valid without a name' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'is not valid without a description' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'is not valid without a category' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'is not valid without a condition' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'is not valid without a bear shipping' do
        @item.bear_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Bear shipping must be other than 1')
      end
      it 'is not valid without a prefecture' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'is not valid without a shipment day' do
        @item.shipment_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment day must be other than 1')
      end
      it 'is not valid without a price' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'is not valid if price is less than 300' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'is not valid if price is more than 9,999,999' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'is not valid if price is not half-width number' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'is not valid if price is alphanumeric' do
        @item.price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'is not valid if price is half-width alphabet' do
        @item.price = 'yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
