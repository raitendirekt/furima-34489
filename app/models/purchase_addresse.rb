class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :mobile_number, :purchase_id

  with_option presence: true do
  end
end