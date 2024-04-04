class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.string :item_name, null: false
      t.text :expanation, null: false
      t.integer :price, null: false
      t.references :user, null: false foreign_key: true
      t.integer :category_id, null: false
      t.integer :situation_id, null: false
      t.integer :delivery_id, null: false
      t.integer :region_id, null: false
      t.integer :shippingdate_id, null: false

      t.timestamps
    end
  end
end