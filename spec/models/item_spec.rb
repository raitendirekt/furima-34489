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
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'is not valid without a condition' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'is not valid without a bear shipping' do
        @item.bear_shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Bear shipping is not a number")
      end
      it 'is not valid without a prefecture' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'is not valid without a shipment day' do
        @item.shipment_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment day is not a number")
      end
      it 'is not valid without a price' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'is not valid if price is less than 300' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'is not valid if price is more than 9,999,999' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'is not valid if price is not half-width number' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
