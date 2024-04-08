class CreateShippingaddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shippingaddresses do |t|
      t.string :postcode, null:false
      t.integer :region_id, null:false
      t.string :municipalities, null:false
      t.string :streetaddress, null:false
      t.string :buildingname
      t.string :tel
      t.references :order, null:false, foreign_key:true
      t.timestamps
    end
  end
end
