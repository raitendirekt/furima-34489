class ChangeIntegerLimitInAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :mobile_number, :integer, limit: 8
  end
end