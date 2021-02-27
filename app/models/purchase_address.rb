class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :mobile_number, :purchase_id

  with_option presence: true do
    :user_id
    :item_id
    :purchase_id
    :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid including hyphen(-)"}
    :city
    :house_number
    :mobile_number, uniqueness: true
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, mobile_number: mobile_number, purchase_id: purchase_id)
  end
end