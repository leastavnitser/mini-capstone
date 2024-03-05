class SupplierId < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :SupplierId, :integer
  end
end
