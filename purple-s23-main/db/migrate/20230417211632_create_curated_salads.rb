class CreateCuratedSalads < ActiveRecord::Migration[7.0]
  def change
    create_table :curated_salads do |t|
      t.string :saladName
      t.string :saladIngredients
      t.integer :calories
      t.decimal :price_cents
      t.integer :quantities
      t.boolean :outOfStock
      t.boolean :isVegan
      t.boolean :isAllMeat
      t.boolean :isAllGreens
      t.boolean :isTropical
      t.boolean :isDiaryDiet
      t.decimal :discount

      t.timestamps
    end
  end
end
