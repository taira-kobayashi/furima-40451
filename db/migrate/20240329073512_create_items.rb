class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :expanation
      t.integer :category_id
      t.integer :situation_id
      t.integer :delivery_id
      t.integer :region_id
      t.integer :shippingdate_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
