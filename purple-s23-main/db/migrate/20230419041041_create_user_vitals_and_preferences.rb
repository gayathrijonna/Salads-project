class CreateUserVitalsAndPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :user_vitals_and_preferences do |t|
      t.string :gender
      t.integer :age
      t.integer :height
      t.integer :weight
      t.integer :weighttobe
      t.boolean :isVegan
      t.boolean :isGlutenFree
      t.boolean :isAllGreens
      t.boolean :isAllMeats
      t.boolean :isTropical
      t.boolean :isBasics

      t.timestamps
    end
  end
end
