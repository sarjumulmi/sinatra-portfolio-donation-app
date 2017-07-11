class AddColumnsItemsAndPriceToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :item, :string
    add_column :donations, :item_price, :decimal
  end
end
