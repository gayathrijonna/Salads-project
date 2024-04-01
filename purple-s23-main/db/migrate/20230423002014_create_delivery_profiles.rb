class CreateDeliveryProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_profiles do |t|
      t.string :profile_name
      t.integer :dressings
      t.integer :price_cents

      t.timestamps
    end
  end
end
