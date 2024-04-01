class CreateIcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :icategories do |t|
      t.string :itype

      t.timestamps
    end
  end
end
