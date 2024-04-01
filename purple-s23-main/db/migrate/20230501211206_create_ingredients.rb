class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :iname
      t.integer :icalorie
      t.integer :ifat
      t.integer :icarbo
      t.integer :iprotein
      t.boolean :isAllMeat
      t.boolean :isAllGreens
      t.boolean :isVegan
      t.boolean :icheck

      t.timestamps
    end
  end
end
