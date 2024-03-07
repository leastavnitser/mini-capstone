class AddImagesColumb < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :images, :string
  end
end
