class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :bear_shipping
  belongs_to :prefecture
  belongs_to :shipment_day

  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end
