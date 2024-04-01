class CreateUserCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :user_cart_items do |t|
      t.string :salad_name
      t.integer :quantities
      t.decimal :price_cents
      t.string :dressing
      t.integer :salad_id
      t.timestamps
    end
  end
end
