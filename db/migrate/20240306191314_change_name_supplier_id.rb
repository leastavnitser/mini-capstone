class ChangeNameSupplierId < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :SupplierId, :supplier_id
  end
end
