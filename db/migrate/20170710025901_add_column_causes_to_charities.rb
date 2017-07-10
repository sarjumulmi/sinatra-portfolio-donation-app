class AddColumnCausesToCharities < ActiveRecord::Migration[5.1]
  def change
    add_column :charities, :causes, :string
  end
end
