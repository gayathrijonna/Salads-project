class AddIcategoryFkColToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :icategory, foreign_key: true
  end
end
