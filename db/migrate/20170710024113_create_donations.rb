class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :charity_id
      t.integer :donor_id
    end
  end
end
