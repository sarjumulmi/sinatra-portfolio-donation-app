class CreateDonors < ActiveRecord::Migration[5.1]
  def change
    create_table :donors do |t|
      t.string :name
      t.string :email
      t.password :password_digest
      t.timestamps :null=>false
    end
  end
end
