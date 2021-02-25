class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :bear_shipping
  belongs_to :prefecture
  belongs_to :shipment_day
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :bear_shipping_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipment_day_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true

  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end
