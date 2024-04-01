class CreateDeliveryProfileItems < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_profile_items do |t|
      t.string :salad_name
      t.integer :salad_id
      t.integer :price_cents
      t.integer :quantity

      t.timestamps
    end
  end
end
